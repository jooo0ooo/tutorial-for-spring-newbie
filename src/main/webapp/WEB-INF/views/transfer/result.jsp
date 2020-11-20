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
</style>
<body class="bg-gradient-primary">
<div id="transfer-content" class="card o-hidden border-0 shadow-lg my-5" style="max-width: 440px; margin: 0 auto!important;">
	<div class="card-body p-0">
		<div class="row">
			<div class="col-lg-12">
				<div class="p-5">
					<div id="main-box">			
						<div class="text-left" style="margin: 30px 0;">
							<h4 class="text-left text-black">Send Money to</h4>
							<h3 class="text-black text-center" style="padding: 0 55px; margin: 30px 0;" id="receiver-name"></h3>
							
							<div class="text-black">
								<span>Send Amount :</span>
								<span class="pull-right"><b id="amount"></b></span>
							</div>
							<br/>
							
							<div class="text-black">
								<span>Account Number :</span>
								<span class="pull-right"><b id="receiver-account-number">${sessionScope.BANK_MONEY_BOOK.depositAccountNum }</b></span>
							</div>
							
							<div class="text-black">
								<span>Bank Name :</span>
								<span class="pull-right"><b id="receiver-bank-name">Golden Bank</b></span>
							</div>
							<br/>
							
							<div class="" style="color: #00cc4c;">
								<span>Golden Bank Fee:</span>
								<span class="pull-right" id="fee"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="" style="position: relative; max-width: 440px;">
					<button id="home" type="button" class="btn btn-block" style="background-color: #3fce74; color: white; font-weight: bold; height: 50px;">Home</button>
				</div>
				
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

$('#amount').text(comma(${sessionScope.BANK_MONEY_BOOK.amount }) + " KRW");
$('#fee').text(comma(${sessionScope.BANK_MONEY_BOOK.fee }) + " KRW");

$(function() {
	
	$('#home').click(function() {
		location.href="${context}/";
	});
	
});

function comma(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
</script>
</body>
</html>