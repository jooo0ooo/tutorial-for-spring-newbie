<%@ page language="java" contentType="text/HTML;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>Register</h1>
<form:form action="/user/register" method="POST">
	<div> email <input type="text" name="email" /> </div>
	<div> password <input type="password" name="password" /> </div>
	<div> name <input type="text" name="name" /> </div>
	<div> phone <input type="text" name="phone" /> </div>
	<div> birthDate <input type="text" name="birthDate" /> </div>
	<div> job <input type="text" name="job" /> </div>
	<div> address <input type="text" name="address" /> </div>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
	<div> <input type="submit" value="회원가입"/> </div> 
</form:form>
</body>
</html>