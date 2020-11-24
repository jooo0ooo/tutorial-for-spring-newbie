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
	line-height: 1;
}

p {
	margin: 10px 0;
}

h4 {
	font-size: 16px;
	font-weight: bold;
}

span {
	font-size: 14px;
	color: black;
}

.moneybook-preview {
	margin-bottom: 15px;
	border-bottom: 1.5px solid #85879694;
	cursor: pointer;
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
</style>
<body class="bg-gradient-primary">
<div id="transfer-content" class="card o-hidden border-0 shadow-lg my-5" style="max-width: 440px; margin: 0 auto!important;">
	<div class="card-body p-0">
		<div class="row">
			<div class="col-lg-12">
				<div class="p-5">
					<div id="main-box">			
						<div class="text-left" style="margin: 30px 0;">
							<h4 class="text-center text-black" style="margin-bottom :25px;">Account Money Book</h4>
							
							<c:forEach var="item" items="${data}">
								<div class="moneybook-preview">
									<span style="vertical-align: bottom;" class="material-icons ${item.transactionType } ${item.balanceChange }">arrow_forward</span>
									<c:choose>
										<c:when test="${item.mine eq true}">
											<span class="account-num">${item.accountNum }</span>
											<span class="amount" style="float: right;">
												<c:if test="${item.balanceChange eq 'minus'}">
													-
												</c:if>
												<fmt:formatNumber value="${item.amount}" pattern="#,###"/> KRW
											</span>
										</c:when>
										<c:otherwise>
											<span class="account-num">${item.depositAccountNum }</span>
											<span class="amount" style="float: right;"><fmt:formatNumber value="${item.amount}" pattern="#,###"/> KRW</span>
										</c:otherwise>
									</c:choose>
									<input type="hidden" class="t-seq" value="${item.seq }">
									<input type="hidden" class="t-type" value="${item.transactionType }">
									<input type="hidden" class="t-date" value='<fmt:formatDate value="${item.createDt}" pattern="yyyy/MM/dd" />'>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="moneybook-detail-modal" class="main-modal">
	<a class="b-close">x</a>
	<div>
		<p><span class="pull-left">Transaction Seq</span> <span id="t-seq" class="pull-right"></span></p>
		<br>
		<p><span class="pull-left">Transaction Type</span> <span id="t-type" class="pull-right"></span></p>
		<br>
		<p><span class="pull-left">Account Num</span> <span id="account-num" class="pull-right"></span></p>
		<br>
		<p><span class="pull-left">Amount</span> <span id="amount" class="pull-right"></span></p>
		<br>
		<p><span class="pull-left">Transaction Date</span> <span id="t-date" class="pull-right"></span></p>
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

$('.WITHDRAW').text("arrow_back");
$('.DEPOSIT').text("arrow_forward");
$('.TRANSFER').text("money");
$('.CARD').text("credit_card");

$('.minus').css("color", "red");
$('.plus').css("color", "green");

$('.moneybook-preview').click(function(){
	
	$('#t-seq').text($(this).children().eq(3).val());
	$('#t-type').text($(this).children().eq(4).val());
	$('#account-num').text($(this).children().eq(1).text());
	$('#amount').text($(this).children().eq(2).text());
	$('#t-date').text($(this).children().eq(5).val());
	
	$('#moneybook-detail-modal').bPopup({
		
	});
});
</script>
</body>
</html>