package com.joo.tutorial.spring.controller;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import java.util.Date;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base32;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joo.tutorial.spring.service.AccountInfoService;
import com.joo.tutorial.util.SessionUtil;

@Controller
@RequestMapping("/otp")
public class GoogleOtpController {
	
	@Autowired
	AccountInfoService accountInfoService;
	
	@PostMapping(value = "/create")
	@ResponseBody
	public String create() {
		
		String secretKeyStr = "GXRZIYSI";
		String url = getQRBarcodeURL(SessionUtil.getSession().getName(), "golden.bank.com", secretKeyStr); // 생성된 바코드 주소!
		
		return url;
		
	}
	
	@PostMapping(value = "/verify")
	@ResponseBody
	public boolean verify(String code, String accountNum) {
		
        long otpCode = Integer.parseInt(code);
        String encodedKey = "GXRZIYSI";
        
        long l = new Date().getTime();
        long ll =  l / 30000;
         
        boolean checkCode = false;
        try {
            // 키, 코드, 시간으로 일회용 비밀번호가 맞는지 일치 여부 확인.
        	checkCode = checkCode(encodedKey, otpCode, ll);
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        
        if(checkCode) {
        	accountInfoService.upgradeSecurityLevel(accountNum);
        }
        
        return checkCode;
        
	}
	
	public static String getQRBarcodeURL(String user, String host, String secret) {
        String format = "http://chart.apis.google.com/chart?cht=qr&chs=300x300&chl=otpauth://totp/%s@%s%%3Fsecret%%3D%s&chld=H|0";
        return String.format(format, user, host, secret);
    }
	
	private static boolean checkCode(String secret, long code, long t) throws NoSuchAlgorithmException, InvalidKeyException {
        Base32 codec = new Base32();
        byte[] decodedKey = codec.decode(secret);
 
        // Window is used to check codes generated in the near past.
        // You can use this value to tune how far you're willing to go.
        int window = 3;
        for (int i = -window; i <= window; ++i) {
            long hash = verifyGoogleOtp(decodedKey, t + i);
 
            if (hash == code) {
                return true;
            }
        }
 
        // The validation code is invalid.
        return false;
    }
	
	
	private static int verifyGoogleOtp(byte[] key, long t)
            throws NoSuchAlgorithmException, InvalidKeyException {
        byte[] data = new byte[8];
        long value = t;
        for (int i = 8; i-- > 0; value >>>= 8) {
            data[i] = (byte) value;
        }
 
        SecretKeySpec signKey = new SecretKeySpec(key, "HmacSHA1");
        Mac mac = Mac.getInstance("HmacSHA1");
        mac.init(signKey);
        byte[] hash = mac.doFinal(data);
 
        int offset = hash[20 - 1] & 0xF;
 
        // We're using a long because Java hasn't got unsigned int.
        long truncatedHash = 0;
        for (int i = 0; i < 4; ++i) {
            truncatedHash <<= 8;
            // We are dealing with signed bytes:
            // we just keep the first byte.
            truncatedHash |= (hash[offset + i] & 0xFF);
        }
 
        truncatedHash &= 0x7FFFFFFF;
        truncatedHash %= 1000000;
 
        return (int) truncatedHash;
    }
}