<%@ page language="java" contentType="text/HTML;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
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
	
	.forgot-btn {
		margin-bottom: 0.5rem;
	}
	
	.my-5 {
		margin-top: 5rem!important;
		margin-bottom: 5rem!important;
	}
	
	#drawer-btn {
		top: 6rem!important;
		z-index: 1;
	}
	
	#drawer {
		top: 5rem!important;
	}
	
	.bg-register-image {
		background: url("${context}/resources/img/register_mascott.jpg");
		background-position: center;
		background-size: cover;
	}
	</style>
</head>
<body class="bg-gradient-primary">
<div>
        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                            <form:form action="/user/register" method="POST">
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" name="firstName" placeholder="First Name">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user" name="lastName" placeholder="Last Name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" name="email" placeholder="Email Address">
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" name="password" class="form-control form-control-user" placeholder="Password">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" name="passwordRepeat" class="form-control form-control-user" placeholder="Repeat Password">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" name="phone" placeholder="Phone Number">
                                </div>
                                
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" name="job" placeholder="Job">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user" name="birthDate" placeholder="Birth Date">
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" name="address" placeholder="Address">
                                </div>
                                
                                <input class="btn btn-primary btn-user btn-block" type="submit" value="Register Account">
             
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
                            </form:form>
                            <hr>
                            <div class="text-center forgot-btn">
                                <a class="" href="forgot-password.html">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="" href="${context}/user/login">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <script>
	    var windowWidth = $(window).width();
	    var contentWidth = $('#content').width();
	    var contentHeight = $('#content').height()
	    
	    var centralPosition = (windowWidth - contentWidth) / 2
	   
    	$('#drawer-btn').css('right', centralPosition);
    	
    	var data = -(centralPosition + 199);
    	
    	$('#drawer').css('height', contentHeight);
    	$('#drawer-btn').on('click', function() {
    		
	if($("input:checkbox[id='drawerInput']").is(":checked")) {
		$("input:checkbox[id='drawerInput']").prop("checked", false);
		$('#drawer-btn').css("transform", "translateX(0)");
		$('#drawer').css("transform", "translateX(" + -data + "px)");
	} else {
		$("input:checkbox[id='drawerInput']").prop("checked", true);
		$('#drawer-btn').css("transform", "translateX(-200px)");
		$('#drawer').css("transform", "translateX(" + data + "px)");
	}
	
});
    </script>
</body>
</html>