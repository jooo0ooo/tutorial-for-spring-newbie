<%@ page language="java" contentType="text/HTML;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  <br/>
	I Seoul U!
</h1>
<p>  ID is ${id}. k.k </p>
<p>Are you login? -> ${isLogin}</p>

<form id="logout" action="/logout" method="POST">
	<input type="submit" value="로그아웃"/>
   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
</form>

</body>
</html>