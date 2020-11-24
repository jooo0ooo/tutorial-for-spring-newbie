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

.swiper-container {
	width: 50%;
	min-width: 230px;
	height: 100%;
	padding: 5%;
	border: 2px solid #ececec;
	z-index: 0;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

#no-account {
	font-size: 7rem;
    color: #00000042;
    width: 7rem;
    height: 7rem;
    text-align: center;
    line-height: 6rem;
    border: 2px solid #ececec;
    border-radius: 7rem;
    margin: 5px 0;
    cursor: pointer;
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

.card-btn {
	cursor: pointer;
}

@media ( min-width: 1200px ) {
	.block-for-array {
		display: none;
	}
}

@media ( max-width: 767px ) {
	.block-for-array, .middle-block-for-array {
		display: none;
	}
}

.main-modal { 
	background-color:#fff;
	border-radius:15px;
	color:#000;
	display:none; 
	padding:25px;
	padding-bottom: 15px;
	min-width:400px;
	min-height: 180px;
	font-size: 15px;
}

.b-close{
	cursor:pointer;
	position:absolute;
	right:10px;
	top:-5px;
	font-size: 30px;
}

.account-input {
	height: 35px;
	line-height: 17.5px;
}

#create-account-btn {
	float: right;
	line-height: 1;
}

.input-group {
	margin-bottom: 15px!important;
}

.toast-message {
	font-size: 15px;
}

.account-slide {
	line-height: 2rem;
	font-size: 1.3rem;
	text-align: center;
	color: black;
}

.slide-children {
	font-weight: bold;
}

.account-slide {
	cursor: pointer;
}

.detail-info {
	float: right;
}

.detail-line {
	margin: 0;
}

.card-header {
	text-align: center;
}

.detail-edit-btn {
	color: blue;
	text-decoration: underline;
	font-size: small;
	cursor: pointer;
}
</style>
<body class="bg-gradient-primary">
<div class="card o-hidden border-0 shadow-lg my-5">
	<div class="card-body p-0">
		<div class="row">
			<div class="col-lg-12">
				<div class="p-5">
					<div class="text-center">
						<h1 class="h4 text-gray-900 mb-4">Golden Bank</h1>
					</div>
					
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<c:forEach var="item" items="${accountList}">
								<div class="swiper-slide">
									<div class="slide-content account-slide">
										<span id="account-alias" class="slide-children" style="color: #3a3939;">${item.alias } INFO</span><br>
										<span class="slide-children" style="color: #af48af;">${item.accountNum }</span><br>
										<span class="slide-children" style="color: #de7c8e;">
											Linked Card 											
											<c:choose>
												<c:when test="${!empty item.cardInfo}">
													<span id="linked-card-exist" style="color: green;">O</span>
												</c:when>
												<c:otherwise>
													<span id="linked-card-exist" style="color: red;">X</span>
												</c:otherwise>
											</c:choose>
											
										</span><br>
										<span class="slide-children" style="color: #2697c5;">
											Account Security 
											<c:choose>
												<c:when test="${item.securityActive eq true}">
													<span id="security-status" style="color: green;">O</span>
												</c:when>
												<c:otherwise>
													<span id="security-status" style="color: red;">X</span>
												</c:otherwise>
											</c:choose>
										</span>
										<input class="account-info" value='${item.totalData }' type="hidden">
									</div>
								</div>
							</c:forEach>
							<div class="swiper-slide">
								<div id="no-account" class="slide-content">+</div>
							</div>
						</div>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
						<div class="swiper-pagination"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="middle-block-for-array col-xl-3 col-md-3 mb-4"></div>
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-left-primary shadow h-100 py-2 card-btn">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Q&A</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800">Frequently Asked Questions</div>
							</div>
							<div class="col-auto">
								<span class="material-icons">question_answer</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="block-for-array col-md-3 mb-4"></div>
			<div class="block-for-array col-md-3 mb-4"></div>
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-left-success shadow h-100 py-2 card-btn">
					<div class="card-body" onClick="location.href='mailto:pingrae@me.com'">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div class="text-xs font-weight-bold text-success text-uppercase mb-1">DM</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800">Go to Ask</div>
							</div>
							<div class="col-auto">
								<span class="material-icons">quickreply</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="middle-block-for-array col-xl-3 col-md-3 mb-4"></div>
		</div>
		
		<div class="row">
			<div class="middle-block-for-array col-xl-3 col-md-3 mb-4"></div>
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-left-info shadow h-100 py-2 card-btn">
					<div class="card-body" onClick="location.href='tel:010-0000-0000'">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div class="text-xs font-weight-bold text-info text-uppercase mb-1">Hotline</div>
								<div class="row no-gutters align-items-center">
									<div class="col-auto">
										<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">Direct Call</div>
									</div>
								</div>
							</div>
							<div class="col-auto">
								<span class="material-icons">phone_enabled</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="block-for-array col-md-3 mb-4"></div>
			<div class="block-for-array col-md-3 mb-4"></div>
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-left-warning shadow h-100 py-2 card-btn">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Company Info</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800">About Us</div>
							</div>
							<div class="col-auto">
								<span class="material-icons">info</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="middle-block-for-array col-xl-3 col-md-6 mb-4"></div>
	</div>
</div>

<div id="create-account-modal" class="main-modal">
	<a class="b-close">x</a>
	<div>
		<div><label>he back seat of the desired account</label></div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text account-input" id="fix-num">MJ{d}{d}</span>
			</div>
			<input type="text" class="form-control account-input" placeholder="6-digits Number" name="account-num" aria-describedby="fix-num" maxlength="6">
			<div class="input-group-append">
				<button id="random-btn" class="btn btn-outline-secondary account-input" type="button">Random</button>
				<button id="check-btn" class="btn btn-outline-secondary account-input" type="button">Check</button>
				<input id="checkedAccountNum" value="0" style="display:none;">
			</div>
		</div>
		
		<div><label>Account alias (up to 8 characters)</label></div>
		<div class="input-group mb-3">
			<input type="text" class="form-control account-input" placeholder="Account Alias" name="account-alias" maxlength="8">
		</div>
		
		<div><label>Account Password</label></div>
		<div class="input-group mb-3">
			<input type="password" class="form-control account-input" placeholder="Account Password" name="account-password" disabled>
			<div class="input-group-append">
				<button id="input-password-btn" class="btn btn-outline-secondary account-input" type="button">Input</button>
			</div>
		</div>
		<button type="button" id="create-account-btn" class="btn btn-outline-primary">Create!</button>
	</div>
</div>

<div id="account-detail-modal" class="main-modal">
	<a class="b-close">x</a>
	<div>
	
<div class="card shadow">
	<div class="card-header py-3">
		<h4 class="m-0 font-weight-bold text-primary">Account Info <span id="history" style="font-weight: 500;" class="detail-edit-btn">moneybook</span></h4>
	</div>
	<div class="card-body">
		<p class="detail-line">Account Number : <span id="detail-account-num" class="detail-info"></span></p>
		<p class="detail-line" id="account-alias-original">Account Alias : <span class="detail-info">&nbsp;<span id="alias-edit-btn" class="detail-edit-btn">edit</span></span><span id="detail-account-alias" class="detail-info"></span></p>
		<div class="detail-line" id="account-alias-edit" style="display: none;">
			Account Alias :
			<div class="input-group" style="margin: 0!important; display: inline-block; width: unset;">
				<input id="edit-alias-input"style="width: 75%; height: 30px; line-height: 0;" type="text" class="form-control" placeholder="New Alias" maxlength="8">
				<div class="input-group-append" style="display: inline-block;">
					<button style="height: 30px; line-height: 0;" id="edit-alias-btn" class="btn btn-outline-secondary" type="button">Set</button>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="card-detail" class="card shadow">
	<div class="card-header py-3">
		<h4 class="m-0 font-weight-bold text-primary">Card Info</h4>
	</div>
	<div class="card-body">
		<p class="detail-line">Card Number : <span id="detail-card-num" class="detail-info">33330512345</span></p>
		<p class="detail-line">Card CreateDt : <span id="detail-card-create-dt" class="detail-info">2020/11/17</span></p>
		<p class="detail-line">Card ExpireDt : <span id="detail-card-expire-dt" class="detail-info">2025/11/17</span></p>
	</div>
</div>
<div id="no-card" class="card shadow">
	<div class="card-body">
		<p class="detail-line">Linked Card : <span id="create-card-btn" class="detail-info">&nbsp;<span class="detail-edit-btn">create</span></span><span class="detail-info" style="color: red; font-weight: bold;">X</span></p>
	</div>
</div>
<div class="card shadow">
	<div class="card-body">
		<p class="detail-line">Account & Card Maximum : <span id="detail-account-max" class="detail-info"></span></p>
		<p class="detail-line">Security Setting : <span id="security-upgrade-btn" style="display:none;" class="detail-info">&nbsp;<span class="detail-edit-btn">upgrade</span></span><span id="detail-account-security" class="detail-info"></span></p>
	</div>
</div>
		
	</div>
</div>
<jsp:include page="account/password.jsp"/>
<jsp:include page="googleotp/otp.jsp"/>
<script>
var windowWidth = $(window).width();
var contentWidth = $('#content').width();
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

var swiper = new Swiper('.swiper-container', {
	navigation: {
		nextEl: '.swiper-button-next',
		prevEl: '.swiper-button-prev',
	},
	pagination: {
		el: '.swiper-pagination',
	},
});

$('#no-account').bind('click', function(e) {
	
	<c:if test="${empty sessionScope.USER_INFO}">
		location.href="${context}/user/login";
	</c:if>
	
	e.preventDefault();
	
	$('input[name="account-num"]').val('');
	$('input[name="account-alias"]').val('');
	$('input[name="account-password"]').val('');
	
	$('#create-account-modal').bPopup({
		
	});
});

$('#random-btn').click(function(){
	$('input[name="account-num"]').val('RANDOM');
});

$('#check-btn').click(function(){
	var accountNum = $('input[name="account-num"]').val();
	
	if(accountNum == 'RANDOM') {
		toastr.info('For RANDOM generation, you do not need to verify the number.');
		return;
	}
	
	if ($.isNumeric(accountNum)) {
		$.ajax({
			url : "${context}/account/check",
			method : "POST",
			data : {"accountNum" : accountNum},
			success : function(result) {
				if (result == false) {
					toastr.info('This account number is available.');
					$('#checkedAccountNum').val(accountNum);
				} else {
					toastr.error('This account number is already in use. Please set it to a different number.');
				}
			}
		});
	} else {
		toastr.error('Please enter only 6 digits.');
	}
	
});

$('#input-password-btn').click(function(){
	$('#password-input-modal').show();
	$('#password-input-modal').modal('show');
});

$('#create-account-btn').click(function(){
	var accountNum = $('input[name="account-num"]').val();
	var checkedAccountNum = $('#checkedAccountNum').val();
	
	if (!$('input[name="account-num"]').val() || !(accountNum == 'RANDOM' || accountNum == checkedAccountNum)) {
		toastr.error('Please set up and verify the desired account.');
		return;
	}
	
	if (!$('input[name="account-password"]').val()) {
		toastr.error('Please set the account password.');
		return;
	}
	
	$.ajax({
		url : "${context}/account/create",
		method : "POST",
		data : {"accountNum" : accountNum, "alias" : $('input[name="account-alias"]').val(), "password" : $('input[name="account-password"]').val()},
		success : function(result) {
			if (result == true) {
				toastr.info('You have successfully opened your account.');
				setTimeout(function(){
					location.reload();
				}, 2000);					
			} else {
				toastr.error('System error. Please re-open it later.');
				setTimeout(function(){
					location.reload();
				}, 2000);
			}
		}
	});
});


$('.account-slide').bind('click', function(e) {
	e.preventDefault();
	
	$('#account-alias-edit').hide();
	$('#account-alias-original').show();
	
	var data = JSON.parse($(this).children('input').val());
	
	$('#detail-account-num').text(data.accountNum);
	$('#detail-account-alias').text(data.alias);
	
	if (data.hasOwnProperty('cardInfo')) {
		$('#no-card').hide();
		$('#detail-card-num').text(data.cardInfo.cardNum.replace(/(.{4})/g,"$1 "));
		$('#detail-card-create-dt').text(data.cardInfo.cardCreateDt);
		$('#detail-card-expire-dt').text(data.cardInfo.cardExpireDt);
		$('#card-detail').show();
	} else {
		$('#card-detail').hide();
		$('#no-card').show();
	}
	
	$('#detail-account-max').text('');
	
	if (data.securityActive + '' == 'false') {
		$('#detail-account-max').text('1,000,000');
		$('#security-upgrade-btn').show();
		$('#detail-account-security').text("X");
		$('#detail-account-security').css({
			color: "red",
			fontWeight: "bold"
		});
	} else {
		$('#detail-account-max').text('1,000,000,000,000');
		$('#detail-account-security').text("O");
		$('#detail-account-security').css({
			color: "green",
			fontWeight: "bold"
		});
	}
	
	$('#account-detail-modal').bPopup({
		
	});
});

$('#alias-edit-btn').click(function(){
	$('#account-alias-edit').show();
	$('#account-alias-original').hide();
});

$('#edit-alias-btn').click(function(){
	
	if (!$('#edit-alias-input').val()) {
		toastr.error('Please enter an account nickname to change.');
		return;
	}
	
	var newAlias = $('#edit-alias-input').val(),
		accountNum = $('#detail-account-num').text();
	
	$.ajax({
		url : "${context}/account/update",
		method : "POST",
		data : {"alias" : newAlias, "accountNum" : accountNum},
		success : function(result) {
			if (result == true) {
				toastr.info('You have changed your account nickname.');
				$('#account-alias-edit').hide();
				$('#account-alias-original').show();
				$('#detail-account-alias').text(newAlias);
				$('#account-alias').text(newAlias + " INFO");
			} else {
				toastr.error('Account nickname change failed. Please try again.');
			}
		}
	});
	
	$('#edit-alias-input').val('');
	
});

$('#create-card-btn').click(function(){
	
	var accountNum = $('#detail-account-num').text();
	
	$.ajax({
		url : "${context}/account/create/card",
		method : "POST",
		data : {"accountNum" : accountNum},
		success : function(result) {
			if (result) {
				
				toastr.info('You have completed opening the card.');
				
				var data = JSON.parse(result);
				
				$('#no-card').hide();
				$('#detail-card-num').text(data.cardNum.replace(/(.{4})/g,"$1 "));
				$('#detail-card-create-dt').text(data.cardCreateDt);
				$('#detail-card-expire-dt').text(data.cardExpireDt);
				$('#card-detail').show();
				
				$('#linked-card-exist').text("O");
				$('#linked-card-exist').css({
					color: "green",
					fontWeight: "bold"
				});
				
			} else {
				toastr.error('Failed to open card. Please try again in a momentarily.');
			}
		}
	});
	
});

$('#security-upgrade-btn').click(function(){
	$.ajax({
		url : "${context}/otp/create",
		method : "POST",
		success : function(result) {
			if (result) {
				$('#otp-qr').attr("src", result);
				$('#otp-modal').show('');
			}
		}
	});
});

$('#history').click(function(){
	location.href="${context}/transfer/history/" + $('#detail-account-num').text();
});
</script>
</body>
</html>