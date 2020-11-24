<%@ page language="java" contentType="text/HTML;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
	<title>Home</title>
</head>
<style>
.form-control {
	height: calc(1.5em + .75rem + 1.5rem);
	font-size: 1.5rem;
}

.btn {
	padding: .75rem;
	font-size: 1.5rem;
}

.h4 {
	font-size: 2.5rem;
}

.mb-4 {
	margin-bottom: 2rem!important;
}

a {
	font-size: 1.5rem;
}

#drawer-btn {
	z-index: 1;
}

::-webkit-scrollbar { display: none; }

#content {
	overflow: scroll;
	height: 80%;
	margin: 50px 0;
	
	-ms-overflow-style: none;
}

#content::-webkit-scrollbar{ display:none; }

.my-5 {
	margin: 0!important;
}

html {
	height: 100%;
}

.container {
	height: 100%;
}

.main-box {
	height: 100%;
}

.toast-message {
	font-size: 15px;
}

.text-black {
	color: black;
}

br {
	line-height: 2.1;
}

h4 {
	font-size: 16px;
	font-weight: bold;
}

span {
	font-size: 14px;
}

.b-t-style {
	border-top: 1.4px solid #999999;
}

.account-list {
	cursor: pointer;
}

#input-amount {
	text-align: right; 
	font-size: 24px; 
	width: 100%; 
	max-width: 400px; 
	border: none; 
	border-bottom: 1px solid #d1d3e2; 
	box-shadow: none;
}

#input-amount:focus {
	border-bottom: 1px solid #3fce74; 
}
</style>
<body class="bg-gradient-primary">
<div id="transfer-content" class="card o-hidden border-0 shadow-lg my-5" style="max-width: 440px; margin: 0 auto!important;">
	<div class="card-body p-0">
		<div class="row">
			<div class="col-lg-12">
				<div class="p-5">
					<div id="main-box" style="padding: 0 15px;">
						<h4 class="text-left text-black">Transfer Amount</h4>
						
						<h2 id="sending-amount" class="text-black">
							<b>
								<input class="form-control" type="text" id="input-amount" placeholder="Enter KRW" style="">
							</b>
						</h2>
						<div class="text-left">
							<p class="text-left" style="display: inline-block; width: 90%; color: #666666">Maximum 1,000,000 ~ 1,000,000,000,000<br/>according to account authentication grade.</p>
						</div>
						
						<div style="margin: 15px;">
							<span style="color: #333333; font-size: 16px; font-weight: bold;" class="pull-left">Golden Bank Fee</span>
							<span style="color: #333333; font-size: 16px; font-weight: bold;" class="pull-right">${bankFee} KRW</span>
							<br/>
						</div>
						
						<hr style="border-top: 1px dotted lightgray; border-width: 3px;"/>
						
						<h4 class="text-left text-black" style="margin-left: 15px;">Summary</h4>
						<div style="margin: 15px;">
							<span style="color: #666666;" class="pull-left">Sending Amount</span>
							<span style="color: #666666;" class="pull-right"><span id="sending-amount-summary">0</span> KRW</span>
							<br/>
							<span style="color: #666666;" class="pull-left">Golden Bank Fee</span>
							<span style="color: #666666;" class="pull-right">${bankFee} KRW</span>
							<br/>
						</div>
						
						<hr style="border-top: 2px solid #eee;"/>
						
						<div style="margin: 15px;">
							<span style="color: #00cc4c; font-size: 16px; font-weight: bold;" class="pull-left">Total</span>
							<span style="color: #00cc4c; font-size: 16px; font-weight: bold;" class="pull-right"><span id="total-amount">0</span> KRW</span>
							<br/>
						</div>
						
						<hr style="border-top: 1px dotted lightgray; border-width: 3px;"/>
						
						<h4 class="text-left text-black" style="margin-left: 15px;">Balance Info</h4>
						<div style="margin: 15px;">
							<span style="color: #666666;" class="pull-left">Remittancable Amount</span>
							<span style="color: #666666;" class="pull-right"><span id="account-balance">0</span> KRW</span>
							<br/>
							<span style="color: #666666;" class="pull-left">Balance After Remittance</span>
							<span style="color: #666666;" class="pull-right"><span id="after-balance">0</span> KRW</span>
							<br/>
						</div>
						
						<div style="background-color: #f8f8f8; padding: 10px; margin: 15px 15px -10px;">
							<h4 class="text-left text-black">Choose Withdrawal Account</h4>
							
							<div style="box-shadow: 0 3px 6px rgb(0, 0, 0, 0.16); padding: 15px; margin-bottom: 35px; background-color: white;">
								<div class="text-left">
									<button class="btn" id="change-account" style="background-color: white; color: #999; border: 1px solid #999; border-radius: 20px; padding: 5px 10px;">Change</button>
									<span id="selected-account" class="pull-right text-right" style="background-color: white; color: #333333; font-size: 14px;"><br/></span>
								</div>
							</div>
							
						</div>
					</div>
					<div id="send-btn-group" style="display: block; position: absolute; bottom: 0; width: 100%; left: 50%; transform:translateX(-50%); max-width: 440px; height: 50px;">
						<div id="transfer-btn" style="float:unset; width: 100%; height: 100%; border-radius: unset; background-color: #cbcbcb; color: white; padding: 3%; text-align: center; line-height: 25px; font-size:25px;">Transfer</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>

<div id="account-list-modal" class="animate__animated animate__fadeInUpBig" style="display: none; position: fixed; z-index: 1000; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: rgb(0,0,0); background-color: rgba(0,0,0,0.55);">
	<div id="inside" style="width: 100%; height: 400px; background-color: white; position: absolute; bottom: 0; max-width: 640px; left: 50%; transform:translateX(-50%);">
		<img id="close-modal" class="" src="/resources/img/x-icon.png" style="padding: 5px; float: right; margin: 5px; cursor: pointer;">
		<div id="my-account-list-content" class="scroll-style inside" style="width: 100%; height: 350px; padding: 0;">
			<h4 class="text-center text-black" style="margin: 30px 0 15px;">Change Withdrawal Account</h4>
			<div style="overflow-y: scroll; height: 95%;">
				<c:forEach var="item" items="${accountList}">
					<div class="account-list" style="margin: 20px;">
						<div class="text-left" style="display: inline-block; width: width: 60%; font-size: 14px; color: #333;">
							<span class="">Golden Bank</span><br/>
							<span style="color: #666;">${item.alias } ${item.accountNum }</span>
							<input type="hidden" value="${item.balance }">
						</div>
						<c:choose>
							<c:when test="${item.sortOrder eq 0 }">
								<img class="pull-right select-withdraw active" src="/resources/img/check-active-icon.png">
							</c:when>
							<c:otherwise>
								<img class="pull-right select-withdraw" src="/resources/img/check-icon.png">
							</c:otherwise>
						</c:choose>
					</div>
					<input type="hidden" value="${item.accountNum }">
					<input type="hidden" value="${item.securityActive }">
					<hr class="" style="border-color:#ebebeb; margin: 0px 10px;"/>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<script>
var windowWidth = $(window).width();
var contentWidth = $('#transfer-content').width();
var contentParentHeight = $('#content').height();
var contentChildrenHeight = $('#content').children('div').first().height();

var contentHeight = 0;

if (contentParentHeight > contentChildrenHeight) {
	contentHeight = contentChildrenHeight;
} else {
	contentHeight = contentParentHeight;
}

var centralPosition = (windowWidth - contentWidth) / 2

$('#drawer-btn').css('right', centralPosition);

var data = -(centralPosition + 199);

var contentTop = $('#content').offset().top

$('#drawer-btn').css('margin-top', contentTop);
$('#drawer').css('margin-top', contentTop);
$('#drawer').css('height', contentHeight);

$('#drawer-btn').on('click', function() {
	if ($("input:checkbox[id='drawerInput']").is(":checked")) {
		$("input:checkbox[id='drawerInput']").prop("checked", false);
		$('#drawer-btn').css("transform", "translateX(0)");
		$('#drawer').css("transform", "translateX(" + -data + "px)");
	} else {
		$("input:checkbox[id='drawerInput']").prop("checked", true);
		$('#drawer-btn').css("transform", "translateX(-200px)");
		$('#drawer').css("transform", "translateX(" + data + "px)");
	}
});

$(function() {
	
	var selectedAccount = $('.active').parent().next().val();
	var securityActive = $('.active').parent().next().next().val();
	
	$('#selected-account').html($('.active').prev().children('span').last().text().replace(" ", "<br>"));
	
	var activeAccountBalance = $('.active').prev().children('input').val();
	$('#account-balance').text(comma(activeAccountBalance));
	$('#after-balance').text(comma(activeAccountBalance));
	
	$("#input-amount").on("focus", function() {		
	    var x = $(this).val();
	    x = uncomma(x);
	    
	    if(x == '0') {
	    	x = '';
	    }
	    
	    $(this).val(x);
	    
	}).on("focusout", function() {
	    var x = $(this).val();
	    var numberX = x;
	    
	    if (x == '' || x == '0') {
	    	$(this).val('');
	    	$('#sending-amount-summary').text("0");
			$('#total-amount').text("0");
			$('#after-balance').text(comma(activeAccountBalance));
	    	return;
	    	//x = '0';
	    }
	    
	    if(x && x.length > 0) {
	        if(!$.isNumeric(x)) {
	            x = x.replace(/[^0-9]/g,"");
	        }
	        x = comma(x);
	        $(this).val(x);
	    }
	    
		$('#sending-amount-summary').text(comma(numberX));
		var totalAmount = Number(numberX) + Number(uncomma("${bankFee}"));
		$('#total-amount').text(comma(totalAmount));
		
		var afterBalance = activeAccountBalance - totalAmount;
		$('#after-balance').text(comma(afterBalance));
	    
	}).on("keyup", function() {
		var max = 1000000;
		var flag = securityActive + ''
		if(flag == 'true') {
			max = 1000000000000;
		}
		
		var bankFee = Number(uncomma("${bankFee}"));
		if (Number(uncomma($(this).val())) + bankFee > max) {
			toastr.error('Exceeding the limit amount');
			$(this).val(comma(max - bankFee));
		}
		
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	    
		if($(this).val() == 0) {
			showBtnGroup('menu');
		} else if($(this).val() != '') {
			showBtnGroup('send');
		}
	    
		var x = $(this).val();
		
		if (x.length > 1) {
			$(this).val(Number(x));
		}
		
		$('#sending-amount-summary').text(comma(x));
		var totalAmount = Number(x) + bankFee;
		$('#total-amount').text(comma(totalAmount));
		
		var afterBalance = activeAccountBalance - totalAmount;
		$('#after-balance').text(comma(afterBalance));
		
		if(afterBalance < 0) {
			toastr.error("Check Balance");
			$('#input-amount').val("");
			$('#sending-amount-summary').text("0");
			$('#total-amount').text("0");
			
			$('#account-balance').text(comma(activeAccountBalance));
			$('#after-balance').text(comma(activeAccountBalance));
			showBtnGroup('menu');
		}
		
	});
	
	$('#transfer-btn').click(function() {		
		var amount = uncomma($('#input-amount').val());
		
		if (amount > 0) {
			$.ajax({
				url : "${context}/transfer/create",
				method : "POST",
				data : {"amount" : amount, "accountNum" : selectedAccount},
				success : function(result) {
					if(result) {
						location.href="${context}/transfer/process";
					}
				}
			});
		} else {
			toastr.error("Please enter the amount you want to remit.");
		}
		
	});
	
	$('#change-account').click(function() {
		$("#account-list-modal").show();
	});
	
	$("#close-modal").on("click", function() {
		$("#account-list-modal").hide();
	});
	
	$(".account-list").on("click", function() {
		if ($(this).children('img').hasClass('active')) {
			$("#account-list-modal").hide();
		} else {
			
			selectedAccount = $(this).next().val();
			securityActive = $(this).next().next().val();
			
			$('#selected-account').html($(this).children('div').children('span').last().text().replace(" ", "<br>"));
			
			activeAccountBalance = $(this).children('div').children('input').val();
			$('#account-balance').text(comma(activeAccountBalance));
			
			var afterBalance = activeAccountBalance - Number(uncomma($('#total-amount').text()));
			$('#after-balance').text(comma(afterBalance));
			
			if(afterBalance < 0) {
				toastr.error("Check Balance");
				$('#input-amount').val("");
				$('#sending-amount-summary').text("0");
				$('#total-amount').text("0");
				
				$('#account-balance').text(activeAccountBalance);
				$('#after-balance').text("0");
				showBtnGroup('menu');
			}
			
			$('.select-withdraw').attr("src", "/resources/img/check-icon.png");
			$('.select-withdraw').removeClass('active');
			$(this).children('img').addClass('acvite');
			$(this).children('img').attr("src", "/resources/img/check-active-icon.png");
			$("#account-list-modal").hide();
		}
		
	});

});

function comma(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function uncomma(x) {
    return x.replace(/[^\d]+/g, '');
}

function showBtnGroup(group) {
	if(group == 'menu') {
		$('#sending-amount').css('color', 'black');
		$('#transfer-btn').css('background-color', '#cbcbcb');
	} else {
		$('#sending-amount').css('color', '#26c426');
		$('#transfer-btn').css('background-color', '#3fce74');
	}
}
</script>
</body>
</html>