<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Spring Tutorial for Newbie - It's for Me:)</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0">
<link href="${context}/resources/css/bootstrap.min.css" rel="stylesheet">

<link href="${context}/resources/css/fontawesome-free/all.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="${context}/resources/css/sb-admin-2.min.css" rel="stylesheet">
<link href="${context}/resources/css/swiper.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<script src="${context}/resources/js/jquery-3.5.1.min.js"></script>
<script src="${context}/resources/js/bootstrap.min.js"></script>
<script src="${context}/resources/js/sb-admin-2.min.js"></script>
<script src="${context}/resources/js/swiper.min.js"></script>
</head>
<body>
<div class="container">
	<div id="nav">
		<tiles:insertAttribute name="nav" />
	</div>
	<div id="content">
		<tiles:insertAttribute name="content" />
	</div>
	</div>
<form:form id="logout-form" action="/logout" method="POST"></form:form>
<script>
$('.logout').on('click', function() {
	event.preventDefault();
	$('#logout-form').submit();
});
</script>
</body>
</html>