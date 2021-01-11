<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="header_bar">
	<div class="container">
		<div class="header-main">
			<div class="row">
				<div class="col-lg-3 col-md-2 col-sm-12 col-xs-12">
					<div class="logo">
						<a href="/home/index" class="logo-wrapper dp-flex"> <img
							src="/static/images/logo-header.png" alt="logo BizTravel">
						</a>
					</div>
				</div>
				<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">

					<nav>
						<ul id="nav" class="nav f-right">


							<li class="nav-item active"><a class="nav-link"
								href="/home/index">Trang chủ</a></li>

							<li class="nav-item "><a class="nav-link" href="/home/about">Giới
									thiệu</a></li>
							<li class="nav-item ">
								<!-- Dropdown -->
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbardrop"
								data-toggle="dropdown"> Các Loại Tour </a>

								<div class="dropdown-menu">
									<c:forEach var="c" items="${loaitour}">
										<a href="/tour/list-by-idLoaiTour/${c.idLoaiTour}"
											class="dropdown-item"> <span
											class="fa fa-map-marker"></span> ${c.tenLoaiTour}
										</a>
									</c:forEach>
								</div>
								</li>

							<li class="nav-item ">
							<a class="nav-link"
								href="/home/contact">Liên hệ</a></li>
							<li class="nav-item">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbardrop"
								data-toggle="dropdown"> ${empty sessionScope.user?'Tài Khoản': sessionScope.user.maKhachHang}
							
							</a>
							
								<div class="dropdown-menu">
									<c:choose>
										<c:when test="${empty sessionScope.user}">
											<a href="/account/login" class="dropdown-item">Đăng Nhập</a>
											<a href="/account/register" class="dropdown-item">Đăng Kí</a>
											<a href="/account/forgot" class="dropdown-item">Quên Mật
												Khẩu</a>
										</c:when>
										<c:otherwise>
											<a href="/trangthaitour/index" class="dropdown-item">Các Đơn Đã Đặt</a>
											<a href="/account/change" class="dropdown-item">Đổi Mật
												Khẩu</a>
											<a href="/account/logoff" class="dropdown-item">Đăng Xuất</a>
											<a href="/account/edit" class="dropdown-item">Cập nhập
												Tài Khoản</a>
										</c:otherwise>
									</c:choose>
								</div>
								</li>
								</li>
						 <li class="nav-item ">
						 <div style="width:50px;height:50px;background-image: url('/static/images/photos/${sessionScope.user.hinh}');background-size: cover;background-position: center; "></div>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>


