<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
.password {
	width:10%;
	display: inline-block;
	margin: 3px;
}

.pw-digit {
	font-size: 32px;
	font-weight: bold;
}

.pw-digit-b {
	border: 2px solid #999999;
	display: inline-block;
	width: 25px;
	margin-top: 5px;
}
.digit {
	color: white;
	font-size: 2.5em;
	padding: 1.75rem;
}

.btn-link:hover, .btn-link:active {
	color: #00cc4c;
}
</style>
</head>
<div id="password-input-modal" class="modal animate__animated animate__fadeInUpBig" role="dialog" style="width: 100%; height: 100%; margin: 0 auto; z-index: 10000;">
	
	<div style="width: 100%; height: 100%; max-width: 440px; margin: 0 auto; z-index: 10000;">
		<div class="modal-dialog" style="width: 100%; height: 100%; margin: 0; z-index: 10000;">
			<div class="modal-content" style="width: 100%; height: 100%;">
				<div class="modal-body" style="background-color: #666; color: white; width: 100%; height: 100%; padding: 0;">
					<img id="password-input-modal-close" class="" src="/resources/img/x-icon-white.png" style="padding: 5px; float: right; margin: 5px;">
					<br/>
					<div class="" style="margin-top: 40px;">
						<p class="text-center" style="font-size: 20px; font-weight: bold;">
							Password<br/>
						</p>
					</div>
			
					<div class="" style="margin-top: 15px; margin-bottom: 15px; text-align: center; height: 72px; line-height: 50px;">
						<div class="password">
							<span class="pw-digit" id="digit-1"></span><br/>
							<hr class="pw-digit-b"/>
						</div>
						<div class="password">
							<span id="digit-2" class="pw-digit"></span><br/>
							<hr class="pw-digit-b"/>
						</div>
						<div class="password">
							<span id="digit-3" class="pw-digit"></span><br/>
							<hr class="pw-digit-b"/>
						</div>
						<div class="password">
							<span id="digit-4" class="pw-digit"></span><br/>
							<hr class="pw-digit-b"/>
						</div>
						<div class="password">
							<span id="digit-5" class="pw-digit"></span><br/>
							<hr class="pw-digit-b"/>
						</div>
						<div class="password">
							<span id="digit-6" class="pw-digit"></span><br/>
							<hr class="pw-digit-b"/>
						</div>
					</div>
					<input type="hidden" id="password" name="password">
					
					<table class="text-center" style="margin: 0 auto; width: 100%;">
						<tr>
							<td><button type="button" class="btn btn-lg btn-link digit" value="1">1</button></td>
							<td><button type="button" class="btn btn-lg btn-link digit" value="2">2</button></td>
							<td><button type="button" class="btn btn-lg btn-link digit" value="3">3</button></td>
						</tr>
						<tr>
							<td><button type="button" class="btn btn-lg btn-link digit" value="4">4</button></td>
							<td><button type="button" class="btn btn-lg btn-link digit" value="5">5</button></td>
							<td><button type="button" class="btn btn-lg btn-link digit" value="6">6</button></td>
						</tr>
						<tr>
							<td><button type="button" class="btn btn-lg btn-link digit" value="7">7</button></td>
							<td><button type="button" class="btn btn-lg btn-link digit" value="8">8</button></td>
							<td><button type="button" class="btn btn-lg btn-link digit" value="9">9</button></td>
						</tr>
						<tr>
							<td>
								<button type="button" class="btn btn-lg btn-link digit" value="cancel">
									<img class="menu-button-img" style="width: 50%;" src="/resources/img/cancel-white.png">
								</button>
							</td>
							<td><button type="button" class="btn btn-lg btn-link digit" value="0">0</button></td>
							<td>
								<button type="button" class="btn btn-lg btn-link digit" value="delete">
									<img class="menu-button-img" style="width: 50%;" src="/resources/img/delete-white.png">
								</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	
</div>
<script>
$('#password-input-modal-close').click(function(){
	$('#password-input-modal').hide();
});
   
$('.digit').click(function() {
	
	if($(this).val() == 'cancel') {
		$('#password').val('');
		
		for(var i = 6; i >= 1; i--) {
			removeStar(i);
		}
		return;
	}
	
	if($(this).val() == 'delete') {
		var passwordEntered = $('#password').val();
		
		$('#password').val(passwordEntered.slice(0, -1));
		
		for(var i = 6; i > $('#password').val().length; i--) {
			removeStar(i);
		}
		return;
	}
	
	if ($('#password').val().length > 6) {
		toastr.error('Please wait a moment.');
		return;
       }
	
	$('#password').val($('#password').val() + $(this).val());
	
	for(var i = 1; i <= $('#password').val().length; i++) {
		drawStar(i);
		
		if(i == 6) {
			setTimeout(function(){
				
				$.ajax({
					url : "${context}/transfer/confirm",
					method : "POST",
					data : {"password" : $('#password').val()},
					success : function(result) {
						if (result) {
							location.href="${context}/transfer/result";
						} else {
							toastr.error("Passwords do not match.");
							$('#password').val('');
							for(var i = 6; i >= 1; i--) {
								removeStar(i);
							}
						}
						
					}
				});
				
			}, 1);
		}
	}
	
});

function drawStar(index) {
	modifyNumberPanel(index, '*', '#00cc4c');
}

function removeStar(index) {
	modifyNumberPanel(index, '', '#999999');
}

function modifyNumberPanel(index, text, color) {
	$target = $('#digit-' + index);
	$target.text(text);
	$target.css('color', color);
	$target.next().next().css('border', '2px solid '+color);
}
</script>
</html>