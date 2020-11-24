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
			
						<h4 class="text-left text-black">DEPOSIT / WITHDRAW / CARD</h4>
						<div class="dropdown no-arrow mb-4">
	                        <button class="btn btn-secondary dropdown-toggle" type="button"
	                            id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
	                            aria-expanded="false"
	                            style="height: 40px;">
	                            Choose Type
	                        </button>
	                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
	                            <a class="dropdown-item type" id="DEPOSIT">DEPOSIT</a>
	                            <a class="dropdown-item type" id="WITHDRAW">WITHDRAW</a>
	                            <a class="dropdown-item type" id="CARD">CARD</a>
	                        </div>
	                        
	                        <input id="type" type="text" disabled style="height: 40px; width: 65%; font-size: 2rem; vertical-align: middle;">
	                    </div>
						
						<h4 class="text-left text-black">Account</h4>
						<div class="dropdown no-arrow mb-4">
	                        <button class="btn btn-secondary dropdown-toggle" type="button"
	                            id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
	                            aria-expanded="false"
	                            style="height: 40px;">
	                            Choose Account
	                        </button>
	                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
	                            <c:forEach var="item" items="${accountList}">
									<a class="dropdown-item account">${item.accountNum }</a>
								</c:forEach>
	                        </div>
	                        
	                        <input id="account" type="text" disabled style="height: 40px; width: 65%; font-size: 2rem; vertical-align: middle;">
	                    </div>
						
						
						<h4 class="text-left text-black">Amount</h4>
						
						<h2 id="sending-amount" class="text-black">
							<b>
								<input class="form-control" type="text" id="amount" placeholder="Enter KRW" style="">
							</b>
						</h2>
						
						<h4 class="text-left text-black" style="margin-top: 20px;">Memo</h4>						
						<div class="input-group" style="margin: 0!important; display: inline-block; width: 100%;">
							<input id="print-content" style="width: 100%; height: 30px; font-size: 14px;" type="text" class="form-control" placeholder="Print Content" maxlength="30">
						</div>
						
						
					</div>
			
				</div>
				
				<div class="" style="position: relative; max-width: 440px;">
					<button id="progress" type="button" class="btn btn-block" style="background-color: #3fce74; color: white; font-weight: bold; height: 50px;">Progress</button>
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

$(function() {
	
	$('#progress').click(function() {
		
		var accountNum = $('#account').val(),
			content = $('#print-content').val(),
			transactionType = $('#type').val(),
			amount = $('#amount').val();
		
		if (accountNum != '' && transactionType != '' && amount != '') {
			$.ajax({
				url : "${context}/money/move",
				method : "POST",
				data : {"accountNum" : $('#account').val(), 
					"content" : $('#print-content').val(),
					"transactionType" : $('#type').val(),
					"amount" : $('#amount').val()},
				success : function(result) {
					
					if (result) {
						toastr.info("Success");
					} else {
						toastr.error("Failed");
					}
					
					setTimeout(function(){
						location.reload();
					}, 1500);
					
				}
			});
		} else {
			toastr.error("Fill All Items");
		}
		
	});
	
	$('.type').click(function() {
		$('#type').val($(this).text());
	});
	
	$('.account').click(function() {
		$('#account').val($(this).text());
	});
});

</script>
</body>
</html>