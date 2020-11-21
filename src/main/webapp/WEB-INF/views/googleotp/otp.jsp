<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
</head>
<div id="otp-modal" class="modal animate__animated animate__fadeInUpBig" role="dialog" style="width: 100%; height: 100%; margin: 0 auto; z-index: 10000;">
	
	<div style="width: 100%; height: 100%; max-width: 440px; margin: 0 auto; z-index: 10000;">
		<div class="modal-dialog" style="width: 100%; height: 100%; margin: 0; z-index: 10000;">
			<div class="modal-content" style="width: 100%; height: 100%;">
				<div class="modal-body" style="text-align: center; background-color: #666; color: white; width: 100%; height: 100%; padding: 0;">
					<img id="otp-modal-close" class="" src="/resources/img/x-icon-white.png" style="padding: 5px; float: right; margin: 5px; cursor: pointer;">
					<br/>
					<div class="" style="margin-top: 40px;">
						<p class="text-center" style="font-size: 20px; font-weight: bold;">
							Upgrade Security Level<br/>
						</p>
					</div>
<img id="otp-qr" src="${url}"/>
<div class="input-group mt-3" style="width: 70%; margin: 0 auto;">
			<input id="otp-code" type="text" style="height: 35px" class="form-control account-input" placeholder="Enter OTP Code" name="otp-code">
			<div class="input-group-append">
				<button id="opt-verify-btn" style="height: 35px" class="btn btn-info" type="button">Verify</button>
			</div>
		</div>
				</div>
			</div>
		</div>
	</div>
	
	
</div>
<script>
$('#otp-modal-close').click(function() {
	$('#otp-modal').hide();
});

$('#opt-verify-btn').click(function() {
	
	$.ajax({
		url : "${context}/otp/verify",
		method : "POST",
		data : {"code" : $('#otp-code').val(), "accountNum" : $('#detail-account-num').text()},
		success : function(result) {
			if (result) {
				toastr.info('Security Level Upgrade Success!');
				setTimeout(function(){
					location.reload();
				}, 2000);
			} else {
				toastr.error('OTP Code is not correct. Try Again.');
			}
		}
	});
});
</script>
</html>