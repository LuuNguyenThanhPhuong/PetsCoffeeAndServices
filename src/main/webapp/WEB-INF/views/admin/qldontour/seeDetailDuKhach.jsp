<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!--Article-->
<!--Tiêu Đề Trang-->
<section class="bread-crumb margin-bottom-10">
	<div class="container">
		<ul class="breadcrumb" itemscope=""
			itemtype="https://schema.org/BreadcrumbList">
			<li class="home" itemprop="itemListElement" itemscope=""
				itemtype="https://schema.org/ListItem"><a itemprop="item"
				href="/" title="Trang chủ"> <span itemprop="name">Trang
						chủ</span>
					<meta itemprop="position" content="1">
			</a></li>
			<li itemprop="itemListElement" itemscope=""
				itemtype="https://schema.org/ListItem"><strong itemprop="name">Chi
					Tiết Du Khách</strong>
				<meta itemprop="position" content="2"></li>
		</ul>
	</div>
</section>
<form action="/admin/qldontour/seeDetail/${maDonTour}/back" method="post">
	<!--FORM_NV_CT-->
	<div class="container">
		<div class="wrapper">
			<div class="left">
				<h4>${prod.tenDuKhach}</h4>

				<i class='fas fa-user-tie' style="font-size: 30px;"></i>
				<p>INFO-Du Khách</p>


			</div>
			<div class="right">
				<div class="info">
					<h3>Information</h3>
					<div class="info_data row">
						<div class="data">
						
							<h4>Mã Thông Tin</h4>
							<p>${prod.maThongTin}</p>
						</div>
						<div class="data">
							<h4>Tên du khách</h4>
							<p>${prod.tenDuKhach}</p>
						</div>
						<div class="data">
							<h4>Số điện thoại - Zalo</h4>
							<p><a href="tel:${prod.sdtZalo}">${prod.sdtZalo}</a></p>
						</div>
					</div>

					<div class="info_data row">
						<div class="data">

						</div>
						<div class="data">
							<h4>CMND</h4>
							<p>${prod.cmnd}</p>
						</div>

						<div class="data">
							<h4>Giới Tính</h4>
							<p>${prod.gioiTinh}</p>
						</div>
					</div>

				</div>

				<button type="submit" class="btn btn-face">Trở lại</button>

			</div>
		</div>
	</div>
</form>
