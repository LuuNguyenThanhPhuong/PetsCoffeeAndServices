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
							<li class="nav-item active"><a class="nav-link" href="/admin/home/index">Trang
									chủ</a>
							</li>
						<c:choose>
						<c:when test="${!empty sessionScope.admin}">
							<li class="nav-item"><a class="nav-link" href="/admin/qlkhachhang/index">Khách Hàng</a>
							</li>
							<c:if test="${sessionScope.admin.getVaiTro() eq true}"> 
							<li class="nav-item"><a class="nav-link" href="/admin/qlnhanvien/index">Nhân Viên</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="/admin/qldontour/index">Đơn Tour</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="/admin/thongke/index">Thống Kê</a>
							</li>
							</c:if>		
							<c:if test="${sessionScope.admin.getVaiTro() eq false}"> 
							<li class="nav-item"><a class="nav-link" href="/person/dontour/index">Đơn Tour</a>
							</li>
							</c:if>
						</c:when>
						<c:otherwise>

						</c:otherwise>
						</c:choose>
						<li class="nav-item ">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbardrop"
								data-toggle="dropdown"> ${empty sessionScope.admin?'Tài Khoản': sessionScope.admin.maNhanVien}
							</a>
								<div class="dropdown-menu">
									<c:choose>
										<c:when test="${empty sessionScope.admin}">
											<a href="/admin/account/login" class="dropdown-item">Đăng Nhập</a>
											<a href="/admin/account/forgot" class="dropdown-item">Quên Mật
												Khẩu</a>
										</c:when>
										<c:otherwise>
											<a href="/admin/account/change" class="dropdown-item">Đổi Mật
												Khẩu</a>
											<a href="/admin/account/logoff" class="dropdown-item">Đăng Xuất</a>
											<a href="/admin/account/edit" class="dropdown-item">Cập nhập
												Tài Khoản</a>
										</c:otherwise>
									</c:choose>
								</div>
								</li>
								</li>
							<li class="nav-item ">
							<div style="width:50px;height:50px;background-image: url('/static/images/photos/${sessionScope.admin.hinh}');background-size: cover;background-position: center; "></div>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>



