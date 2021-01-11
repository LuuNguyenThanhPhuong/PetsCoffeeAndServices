<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%-- <base href="${pageContext.request.contextPath}/"/> --%>
<meta charset="utf-8">
<title>PETS Coffee And Services</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" type="text/css" href="/static/css/style.css">
<link rel="stylesheet" type="text/css" href="/static/css/lienHe.css">
<link rel="stylesheet" type="text/css" href="/static/css/chiTietĐT.css">
<link rel="stylesheet" type="text/css" href="/static/css/yeuThich.css">
<link rel="stylesheet" type="text/css" href="/static/css/Account.css">
<link rel="stylesheet" type="text/css" href="/static/css/Admin.css">
<link rel="stylesheet" type="text/css" href="/static/css/tour(BTN).css">
<link rel="stylesheet" type="text/css" href="/static/css/datTour.css">
<link rel="stylesheet" type="text/css" href="/static/css/ThongTin_KH.css">
<link rel="stylesheet" type="text/css" href="/static/css/thongTinTour.css">
<link rel="stylesheet" type="text/css" href="/static/css/gioiThieu.css">
<link rel="stylesheet" type="text/css" href="/static/css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="/static/css/tinTuc.css">
<link rel="stylesheet" type="text/css" href="/static/css/chiTietNV.css">
<link rel="stylesheet" type="text/css" href="/static/css/moDal.css">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel='stylesheet'
	href='https://cdn.rawgit.com/t4t5/sweetalert/v0.2.0/lib/sweet-alert.css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script
	src='https://cdn.rawgit.com/t4t5/sweetalert/v0.2.0/lib/sweet-alert.min.js'></script> 



<!-- Latest compiled JavaScript -->
 <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="/static/js/cart.js"></script>
<script src="/static/js/buttonshare.js"></script>
<script src="/static/css/button.css"></script>
<link rel="shortcut icon" href="/static/images/1.png">




<style>
.fakeimg {
	height: 200px;
	background: #aaa;
}

.zalo-share-button {
	display: inline-block;
	bottom: 260px;
	right: 15px;
	border: none;
	background-color: #ececec;
	text-decoration: none;
	color: #FFF;
	position: fixed;
	z-index: 80;
	height: 20px;
}

.button_share1 {
	display: inline-block;
	padding: 5px 10px;
	bottom: 140px;
	right: 10px;
	border: none;
	background-color: #ececec;
	text-decoration: none;
	color: #FFF;
	position: fixed;
	z-index: 80;
}

.button_share1 :hover {
	color: green;
}

.button_share2 {
	display: inline-block;
	padding: 5px 7px;
	bottom: 180px;
	right: 10px;
	border: none;
	background-color: #ececec;
	text-decoration: none;
	color: #FFF;
	position: fixed;
	z-index: 80;
}

.button_share2 :hover {
	color: green;
}

.button_share3 {
	display: inline-block;
	padding: 5px 7.5px;
	bottom: 220px;
	right: 10px;
	border: none;
	background-color: #ececec;
	text-decoration: none;
	color: #FFF;
	position: fixed;
	z-index: 80;
}

.button_share3 :hover {
	color: green;
}

.button_share {
	display: block;
	float: left;
	padding: 5px 10px;
	border: none;
	background-color: #ececec;
	text-decoration: none;
	font-size: 18px;
	color: #FFF;
}

.button_share :hover {
	color: gray;
}

.facebook {
	background-color: #3b5998;
}

.twitter {
	background-color: #55acee;
}

.pinterest {
	background-color: #cc2127;
}
#preloader{position:fixed;z-index:1800;top:0;right:0;bottom:0;left:0;width:100%;height:100%;background-color:#5ea1e5}
.no-js #preloaders,.oldie #preloaders{display:none}
#loader{position:absolute;top:calc(50% - 1.25em);left:calc(50% - 1.25em)}
.loader{display:inline-block;width:30px;height:30px;position:relative;border:4px solid #Fff;top:50%;animation:loader 2s infinite ease}
.loader-inner{vertical-align:top;display:inline-block;width:100%;background-color:#fff;animation:loader-inner 2s infinite ease-in}
@keyframes loader {
0%{transform:rotate(0deg)}
25%{transform:rotate(180deg)}
50%{transform:rotate(180deg)}
75%{transform:rotate(360deg)}
100%{transform:rotate(360deg)}
}
@keyframes loader-inner {
0%{height:0}
25%{height:0}
50%{height:100%}
75%{height:100%}
100%{height:0}
}
</style>
</head>
</head>
<body >
	<script src="/static/js/owl.carousel.min.js"></script>

	<header class="header">
		<!-- Header -->
		<jsp:include page="layout/header.jsp"></jsp:include>

		<!-- Menu -->
		<c:import url="/layout/menu"></c:import>
	</header>
	<!-- Nội dung in here -->
	<aside>

		<tiles:insertAttribute name="body" />
 <ul class="the-article-tools">
	
	<li class="btnZalo">
		<a target="_blank" href="https://zalo.me/3758448700840824390" title="Chat qua Zalo">
			<span class="ti-zalo"></span>
		</a>
		<span class="label">Chat qua Zalo</span>
	</li>
	
	
	<li class="btnFacebook">
		<a target="_blank" href="https://www.messenger.com/t/vietnamtravelpoly" title="Chat qua Messenger">
			<span class="ti-facebook"></span>
		</a>
		<span class="label">Chat qua Messenger</span>
	</li>
</ul>
	</aside>



	<!-- Footer -->
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
<script type='text/javascript'>
$(document).ready(function () {
    jQuery("#loader").remove();
    jQuery("#preloader").remove();
});
</script>
<script>
  
        $('#owl_2').owlCarousel({
            items:3,
            dot:false,
            nav:false,
            margin:30,
            loop:true,
        
    })

    </script>
    <script>
  
        $('#owl_1').owlCarousel({
            items:4,
            dot:false,
            nav:true,
            margin:30,      
            autoplay:true,
            autoplayTimeout:2000,
            autoplayHoverPause:true,
            loop:true,
        
    })

    </script>
        <script>
  
        $('#owl_3').owlCarousel({
            items:4,
            dot:false,
            nav:false,
            margin:30,      
            autoplay:true,
            autoplayTimeout:2000,
            autoplayHoverPause:true,
            loop:true,
        
    })

    </script>
      <script>
$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();   
});
</html>

