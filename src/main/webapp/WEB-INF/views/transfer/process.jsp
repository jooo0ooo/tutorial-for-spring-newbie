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
			
						<h4 class="text-left text-black">Receiver</h4>
						<h4 class="text-left color-333" style="font-weight: unset;">Enter a Receiver's Account number</h4>
						
						<div class="input-group" style="margin: 0!important; display: inline-block; width: 100%;">
							<input id="receiver" style="width: 75%; height: 40px; font-size: 22px;" type="text" class="form-control" placeholder="Account Number" maxlength="10">
							<div class="input-group-append" style="display: inline-block;">
								<button style="line-height: 0; height: 40px; font-size: 22px;" id="check-receiver" class="btn btn-outline-secondary" type="button">Check</button>
							</div>
						</div>
						
						<h4 class="text-left text-black" style="margin-top: 20px;">Remittance Content</h4>
						<h4 class="text-left color-333" style="font-weight: unset;">Enter a remittance content</h4>
						
						<div class="input-group" style="margin: 0!important; display: inline-block; width: 100%;">
							<input id="print-content" style="width: 100%; height: 30px; font-size: 14px;" type="text" class="form-control" placeholder="Enter Print Content" maxlength="30">
						</div>
						
					</div>
			
				</div>
				
				<div class="" style="position: relative; max-width: 440px;">
					<button id="transfer" type="button" class="btn btn-block" style="background-color: #cbcbcb; color: white; font-weight: bold; height: 50px;">Transfer</button>
				</div>
				
			</div>
		</div>
	</div>
</div>

<div id="receiver-check-modal" class="modal fade" role="dialog" style="margin: 150px auto;">
	<div class="modal-dialog" style="z-index: 1051;">
		<div class="modal-content">
			<div class="modal-body">
				<div class="text-center text-black">
					<h3 style="color: #333333">Account holder Check</h3>
					<br/>
					<p style="font-size: 16px;">Golden Bank<br/><span id="receiver-account"></span></p>
					<p style="font-weight: bold; color: #333333; font-size: 16px;">The account holder's name is</p>
					<p id="receiver-name" style="color: #00cc4c; font-weight: bold; font-size: 20px;"></p>
					<input id="receiver-verify" type="hidden">
				</div>
			</div>
			<div style="width: 100%; height: 50px">
				<button id="cancel-btn" class="btn" style="width: 50%; height: 100%; background-color: lightgray; float: left; color: white; border-radius: unset;">Cancel</button>
				<button id="ok-btn" class="btn" style="width: 50%; height: 100%; background-color: #3fce74; float: right; color: white; border-radius: unset;">Ok</button>
			</div>
		</div>
	</div>
</div>
<jsp:include page="password.jsp"/>
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
	$('#check-receiver').click(function() {
		if($('#receiver').val().length < 10) {
			toastr.error("10글자 입력하세요.");
			return;
		}
		
		$.ajax({
			url : "${context}/transfer/check",
			method : "POST",
			data : {"accountNum" : $('#receiver').val()},
			success : function(result) {
				
				if (result) {
					$('#receiver-verify').val('');
					$('#receiver-check-modal').modal('show');
					$('#receiver-account').text($('#receiver').val());
					$('#receiver-name').text(result);
				} else {
					toastr.error("존재하지 않는 계좌입니다.");
				}
				
			}
		});
		
		
	});
	
	$('#cancel-btn').click(function() {
		$('#receiver').val('');
		$('#receiver-check-modal').modal('hide');
	});
	
	$('#ok-btn').click(function() {
		$('#receiver-verify').val('verified');
		$('#receiver-check-modal').modal('hide');
		showBtnGroup('transfer');
	});
	
	$('#transfer').click(function() {
		if ($('#receiver-verify').val() != 'verified') {
			toastr.error("수취인 계좌 확인 해주십시오.");
			return;
		}
		
		$.ajax({
			url : "${context}/transfer/process",
			method : "POST",
			data : {"receiver" : $('#receiver').val(), "content" : $('#print-content').val()},
			success : function(result) {
				
				if (result) {
					//$('#password-input-modal').show();
					$('#password-input-modal').modal('show');
					
				} else {
					toastr.error("잠시 후 다시 시도해주시길 바랍니다.");
				}
				
			}
		});
		
	});
});

function showBtnGroup(group) {
	if(group == 'menu') {
		$('#transfer').css('background-color', '#cbcbcb');
	} else {
		$('#transfer').css('background-color', '#3fce74');
	}
}
</script>
</body>
</html>