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

#drawer-btn {
	z-index: 1;
}

.swiper-container {
      width: 50%;
      min-width: 230px;
      height: 100%;
      padding: 5%;
      border: 2px solid #ececec;
      z-index: 0;
    }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
     background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }

#no-account {
	font-size: 7rem;
    color: #00000042;
    width: 7rem;
    height: 7rem;
    text-align: center;
    line-height: 6rem;
    border: 2px solid #ececec;
    border-radius: 7rem;
    margin-top: 15px;
}

.slide-content {
	line-height: 100px;
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

.card-btn {
	cursor: pointer;
}
</style>
<body class="bg-gradient-primary">
<div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="p-5">
                                    <div class="text-center">
                                    
                                        <h1 class="h4 text-gray-900 mb-4">Golden Bank</h1>
                                    </div>
                                    
                                    <div class="swiper-container">
									    <div class="swiper-wrapper">
									        <div class="swiper-slide">
									        	<div id="no-account" class="slide-content">+</div>
									        </div>
									        <div class="swiper-slide"><div class="slide-content">내용2</div></div>
									        <div class="swiper-slide"><div class="slide-content">내용3</div></div>
									        <div class="swiper-slide"><div class="slide-content">내용4</div></div>
									    </div>
									    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
    <div class="swiper-pagination"></div>
    	
									</div>
                          
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="container-fluid">

                    <div class="row">

                        <div class="col-xl-3 col-md-6 mb-4">
                        </div>
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2 card-btn">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                Q&A</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">Frequently Asked Questions</div>
                                        </div>
                                        <div class="col-auto">
                                           <span class="material-icons">question_answer</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Annual) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2 card-btn">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                DM</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">Go to Ask</div>
                                        </div>
                                        <div class="col-auto">
                                            <span class="material-icons">quickreply</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-xl-3 col-md-6 mb-4">
                        </div>
                        
                        </div>
           
                        <div class="row">
                        <div class="col-xl-3 col-md-6 mb-4">
                        </div>
                        <!-- Tasks Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2 card-btn">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Hotline
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">Direct Call</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <span class="material-icons">phone_enabled</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2 card-btn">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                Company Info</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">About Us</div>
                                        </div>
                                        <div class="col-auto">
                                           <span class="material-icons">info</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-md-6 mb-4">
                        </div>
                        </div>
                </div>
                
<script>
	    var windowWidth = $(window).width();
	    var contentWidth = $('#content').width();
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
    	
    	var swiper = new Swiper('.swiper-container', {
    	      navigation: {
    	        nextEl: '.swiper-button-next',
    	        prevEl: '.swiper-button-prev',
    	      },
    	      pagination: {
    	          el: '.swiper-pagination',
    	        },
    	    });
    </script>
</body>
</html>