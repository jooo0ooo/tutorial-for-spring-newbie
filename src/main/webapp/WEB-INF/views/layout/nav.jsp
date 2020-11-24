<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.drawer-menu {
	color: #fff;
	text-decoration: none;
	
	display: block;
	font-size: 1.4rem;
	margin-bottom: 15px;
	padding-bottom: 15px;
	border-bottom: 1px solid rgba(100, 100, 100, .5);
	transition: padding-left .5s;
}

.drawer-menu:hover {
	color: #aaa;
}

#drawerInput {
	display: none;
}

/*
#content {
	transition: transform .5s;
}

#drawerInput:checked #content {
	transform: translateX(-200px);
}
*/

#drawer-btn {
	position: fixed;
	top: 5px;
	/*right: 5px;*/
	cursor: pointer;
	transition: .5s;
	
	border: 0;
	outline: 0;
	background-color: rgba(255, 255, 255, 0);
}

#drawer-btn div {
	width: 25px;
	height: 4px;
	border-radius: 5px;
	background: #000;
	transition: .5s cubic-bezier(0.6, 0.05, 0.28, 0.91);
}

#drawer-btn #openbtn-mid {
	margin: 4px 0;
}

#drawerInput:checked ~ #drawer-btn {
	right: 205px;
}
#drawerInput:checked ~ #drawer-btn::before {
	content: '';
	position: fixed;
	top: -5000px;
	left: -5000px;
	width: 100000px;
	height: 100000px;
	background: rgba(0, 0, 0, .25);
}

#drawerInput:checked ~ #drawer-btn #openbtn-top {
	transform: translateY(4px) rotate(-135deg);  
}

#drawerInput:checked ~ #drawer-btn #openbtn-mid {
	opacity: 0;
	transform: rotate(135deg);
}

#drawerInput:checked ~ #drawer-btn #openbtn-bot {
	transform: translateY(-12px) rotate(-45deg);
}

#drawer {
	position: fixed;
	top: 0;
	right: -200px;
	width: 200px;
	height: 100%;
	padding: 30px 10px;
	background: #282828;
	transition: .5s;
	z-index: 10;
}

#drawerInput:checked ~ #drawer{
	transform: translateX(-200px);
}

#drawer a:last-child {
	margin-bottom: 0;
	padding-bottom: 0;
	border-bottom: 0;
}

#drawer a:hover {
	padding-left: 5px;
}
</style>

<input type="checkbox" id="drawerInput">

<button id="drawer-btn">
	<div id="openbtn-top"></div>
	<div id="openbtn-mid"></div>
	<div id="openbtn-bot"></div>
</button>

<nav id="drawer">
	<c:choose>
		<c:when test="${empty sessionScope.USER_INFO}">
			<a href="${context }/" class="drawer-menu">Main</a>
			<a href="${context }/user/login" class="drawer-menu">Login</a>
		</c:when>
		<c:otherwise>
			<a href="${context }/" class="drawer-menu">Main</a>
			<a href="${context }/transfer" class="drawer-menu">Transfer</a>
			<a href="${context }/money/move" class="drawer-menu">Money Move</a>
			<a href="#" class="drawer-menu logout">Logout</a>
		</c:otherwise>
	</c:choose>
</nav>
<script>
</script>