<%@ page language="java" contentType="text/HTML;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>Login</h1>
<h1>Login Page</h1> 
<h2>${error}</h2> 
<h2>${logout}</h2>

<form action="${pageContext.request.contextPath}/user/login-processing" method="post">
	<div> email <input type="text" name="email" /> </div>
	<div> password <input type="password" name="password" /> </div>
	<div> <input type="submit" value="로그인"/> </div>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
</form>
</body>
</html>