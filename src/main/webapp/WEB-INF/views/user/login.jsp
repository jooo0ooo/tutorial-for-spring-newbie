<%@ page language="java" contentType="text/HTML;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false" %>
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

.forgot-btn {
	margin-bottom: 0.5rem;
}
.bg-login-image {
	background: url("${context}/resources/img/login_mascott.jpg");
	background-position: center;
	background-size: cover;
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
</style>
<body class="bg-gradient-primary">
<div class="card o-hidden border-0 shadow-lg my-5">



                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                    <form:form action="/user/login-processing" method="POST">
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user" name="email" aria-describedby="emailHelp" placeholder="Enter Email Address...">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user" name="password" placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">Remember
                                                    Me</label>
                                            </div>
                                        </div>
                                        <input class="btn btn-primary btn-user btn-block" type="submit" value="Login">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        
                                    </form:form>
                                    <hr>
                                    <div class="text-center forgot-btn">
                                        <a class="" href="forgot-password.html">Forgot Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="" href="${context}/user/register">Create an Account!</a>
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
    	
    	var loginFailMsg = '${requestScope.loginFailMsg}';
    	if(loginFailMsg) {
    		toastr.error('${requestScope.loginFailMsg}', 'Login Failed');
    	}
    	
    	
    </script>
</body>
</html>