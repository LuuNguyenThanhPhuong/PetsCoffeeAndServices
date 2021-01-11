<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Viet Travel - Quản Trị</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="/static/css/style.css">
    <link rel="stylesheet" type="text/css" href="/static/css/thongKe.css">
    <link rel="stylesheet" type="text/css" href="/static/css/Admin.css">
    <link rel="stylesheet" type="text/css" href="/static/css/chiTietĐT.css">
    <link rel="stylesheet" type="text/css" href="/static/css/ThongTin_Admin.css">
    <link rel="stylesheet" type="text/css" href="/static/css/Account.css">
    <link rel="stylesheet" type="text/css" href="/static/css/chiTietNV.css">
    <link rel="stylesheet" type="text/css" href="/static/css/moDal.css">	

    <link rel="stylesheet" href="/static/css/owl.carousel.min.css">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel='stylesheet' href='https://cdn.rawgit.com/t4t5/sweetalert/v0.2.0/lib/sweet-alert.css'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css">

    <!-- jQuery library -->
    <script src='https://cdn.rawgit.com/t4t5/sweetalert/v0.2.0/lib/sweet-alert.min.js'></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">


    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="/static/js/search.js"></script>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<link rel="shortcut icon" href="/static/images/favicon-16x16.png">
<script>
$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();
});
</script>

<style>
.fakeimg {
	height: 200px;
	background: #aaa;
}

.button_share1 {
	display: inline-block;
	padding: 5px 10px;
	bottom: 100px;
	right: 10px;
	border: none;
	background-color: #ececec;
	text-decoration: none;
	color: #FFF;
	position: fixed;
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
}

.button_share2 :hover {
	color: green;
}

.button_share3 {
	display: inline-block;
	padding: 5px 7.5px;
	bottom: 140px;
	right: 10px;
	border: none;
	background-color: #ececec;
	text-decoration: none;
	color: #FFF;
	position: fixed;
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
<body>
<div id='preloader'>
  <div id='loader'>
    <span class='loader'>
      <span class='loader-inner'></span>
    </span>
  </div>
</div> 
	<script src="/static/js/owl.carousel.min.js"></script>
	<header class="header">
	<!-- Header -->
	<jsp:include page="layout/header.jsp"></jsp:include>
	
	<!-- Menu -->
	<jsp:include page="layout/menu.jsp"></jsp:include>
	</header>
	
	<!-- Category -->
<%-- 	<jsp:include page="layout/quanly.jsp"></jsp:include> --%>
				
	<!-- Nội dung in here -->
			<aside>
				<tiles:insertAttribute name="body" />
<c:choose>
<c:when test="${!empty sessionScope.admin}">
 <div class="hot-linkly hidden-xs">
        <div class="bic-load">
            <div class="bic-load-tem">
                <a class="loptop KH" href="/admin/qlkhachhang/index">
                    <span>QL.Khách Hàng</span>
                </a>
            </div>
            <c:if test="${sessionScope.admin.getVaiTro() eq true}"> 
            <div class="bic-load-tem">
                <a  class="loptop NV" href="/admin/qlnhanvien/index">
                    <span>QL.Nhân Viên</span>
                </a>
            </div>
            </c:if>
            <div class="bic-load-tem">
                <a class="loptop LT" href="/admin/qlloaitour/index">
                    <span>QL.Loại Tour</span>
                </a>
            </div>
            <div class="bic-load-tem">
                <a class="loptop T" href="/admin/qltour/index">
                    <span>QL.Tour</span>
                </a>
            </div>
            <c:if test="${sessionScope.admin.getVaiTro() eq true}"> 
            <div class="bic-load-tem">
                <a  class="loptop DT" href="/admin/qldontour/index">
                    <span>QL. Đơn Tour</span>
                </a>
            </div>
            </c:if>
			<c:if test="${sessionScope.admin.getVaiTro() eq true}"> 
            <div class="bic-load-tem">
                <a class="loptop TK" href="/admin/thongke/index">
                    <span>QL.Thống Kê</span>
                </a>
            </div>
            </c:if>
            <c:if test="${sessionScope.admin.getVaiTro() eq false}"> 
            <div class="bic-load-tem">
                <a class="loptop DT" href="/person/dontour/index">
                    <span>QL.Đơn Tour</span>
                </a>
            </div>
            </c:if>
        </div>
        <span class="show_hide"></span>
    </div>
    </c:when>
			<c:otherwise>

			</c:otherwise>
		</c:choose>
			</aside>
</body>
	<script type='text/javascript'>
	$(document).ready(function () {
	    jQuery("#loader").remove();
	    jQuery("#preloader").remove();
	});
	</script>
</html>
