<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	right: 5px;
	cursor: pointer;
	transition: .5s;
	
	border: 0;
	outline: 0;
	background-color: #fff;
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
	top: 0;
	left: 0;
	width: 100vw;
	height: 100vh;
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

#drawerInput:checked ~ #drawer {
	transform: translateX(-200px);
}

#drawer .drawer-menu {
	
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
	<a href="#" class="drawer-menu">Item 1</a>
	<a href="#" class="drawer-menu">Item 2</a>
	<a href="#" class="drawer-menu">Item 3</a>
	<a href="#" class="drawer-menu">Item 4</a>
</nav>
<script>
$('#drawer-btn').on('click', function() {
	if($("input:checkbox[id='drawerInput']").is(":checked")) {
		$("input:checkbox[id='drawerInput']").prop("checked", false);
		//$('#content').css("transform", "translateX(0)");
		
	} else {
		$("input:checkbox[id='drawerInput']").prop("checked", true);
		//$('#content').css("transform", "translateX(-200px)");
	}

	
	
});
</script>