<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
$(document).ready(function () {
	var slk = $('#slk').val(); 
	var sldd = $('#sldd').val(); 
	var slkcl = slk - sldd;
	$('#slkcl').html(slkcl)
	
	var ngaydi = $('#ngaydi').val();
	var fromTime = new Date(ngaydi);
	var ngayve = $('#ngayve').val();
	var toTime = new Date(ngayve);
	var differenceTravel = toTime.getTime() - fromTime.getTime();
	var time = Math.floor((differenceTravel) /1000/60/60/24);
	$('#time').html(time)
	$('#time1').html(time)
	
	var tien = $('#tien').val();
	var giamgia = $('#giamgia').val();
	var tiengiamgia = tien - (tien * (giamgia /100));
	$('#tiengiamgia').html(formatVND(tiengiamgia))
});
</script>
<script>
	function formatVND(number){
	return number.toFixed(0).replace(/./g, function (c, i, a){
		return i > 0 && c !== "," && (a.length - i) % 3 === 0? "." + c : c;
	}) + ' ₫';
}
</script>
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
				itemtype="https://schema.org/ListItem"><strong itemprop="name">Thông
					tin tour</strong>
				<meta itemprop="position" content="2"></li>
		</ul>
	</div>
</section>

<div class="container">
	<div class="booking-item-details">
		<div class="row mb15">
			<div class="col-md-6">
				<div id="custCarousel" class="carousel slide" data-ride="carousel">
					<!-- slides -->
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="/static/images/tour/${prod.hinh}" alt="Hills">
						</div>
						<div class="carousel-item">
							<img src="/static/images/tour/${prod.hinh1}" alt="Hills">
						</div>
						<div class="carousel-item">
							<img src="/static/images/tour/${prod.hinh2}" alt="Hills">
						</div>
						<div class="carousel-item">
							<img src="/static/images/tour/${prod.hinh3}" alt="Hills">
						</div>
						<div class="carousel-item">
							<iframe width="560" height="315"
								src="${prod.video}?autoplay=1&mute=1" frameborder="0"
								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen></iframe>
						</div>
					</div>
					<!-- Left right -->
					<a class="carousel-control-prev" href="#custCarousel"
						data-slide="prev"> <span class="carousel-control-prev-icon"></span>
					</a> <a class="carousel-control-next" href="#custCarousel"
						data-slide="next"> <span class="carousel-control-next-icon"></span>
					</a>
					<!-- Thumbnails -->
					<ol class="carousel-indicators ">
						<li class="list-inline-item active"><a
							id="carousel-selector-0" class="selected" data-slide-to="0"
							data-target="#custCarousel"> <img
								src="/static/images/tour/${prod.hinh}" class="img-fluid">
						</a></li>
						<li class="list-inline-item"><a id="carousel-selector-1"
							data-slide-to="1" data-target="#custCarousel"> <img
								src="/static/images/tour/${prod.hinh1}" class="img-fluid">
						</a></li>
						<li class="list-inline-item"><a id="carousel-selector-2"
							data-slide-to="2" data-target="#custCarousel"> <img
								src="/static/images/tour/${prod.hinh2}" class="img-fluid">
						</a></li>
						<li class="list-inline-item"><a id="carousel-selector-2"
							data-slide-to="3" data-target="#custCarousel"> <img
								src="/static/images/tour/${prod.hinh3}" class="img-fluid">
						</a></li>
						<li class="list-inline-item"><a id="carousel-selector-2"
							data-slide-to="4" data-target="#custCarousel"> <img
								src="/static/images/video.png" class="img-fluid">
						</a></li>

					</ol>
				</div>
			</div>
			<div class="col-md-6">
				<header class="booking-item-header">
					<div class="row">
						<div class="col-md-12">
							<h1 class="lh1em color-orange font28">${prod.tenTour}</h1>
						</div>
					</div>
				</header>
				<hr>
				<div class="booking-item-meta">

					<div class="tour-information">
						<div class="row">

							<div class="col-md-6">
								<div class="mb5">
									<i
										class="fa fa-star box-icon-mini box-icon-inline box-icon-gray"></i>
									Mã Tour: ${prod.maTour}
								</div>
								<div class="mb5">
									<i
										class="fa fa-clock-o box-icon-mini box-icon-inline box-icon-gray"></i>
									Giờ Xuất Phát:
									<fmt:formatDate value="${prod.ngayDi}" pattern="HH:mm" />
								</div>
								<div class="mb5">
									<i
										class="fa fa-map-marker box-icon-mini box-icon-inline box-icon-gray"></i>
									Nơi Khởi Hành: ${prod.noiKhoiHanh}
								</div>

								<div class="mb5">
									<i
										class="fa fa-car box-icon-mini box-icon-inline box-icon-gray"></i>
									Phương tiện: &ensp;
									<c:if test="${prod.phuongTien eq 'Máy Bay'}">
										<i data-toggle="tooltip" data-placement="top" title="Máy Bay"
											class="fas fa-plane-departure"></i>
									</c:if>
									<c:if test="${prod.phuongTien eq 'Xe khách'}">
										<i data-toggle="tooltip" data-placement="top" title="Xe Khách"
											class="fas fa-bus"></i>
									</c:if>
									<c:if test="${prod.phuongTien eq 'Xe đạp'}">
										<i data-toggle="tooltip" data-placement="top" title="Xe đạp"
											class="fas fa-bicycle"></i>
									</c:if>
									<c:if test="${prod.phuongTien eq 'Thuyền KAYAK'}">
										<i data-toggle="tooltip" data-placement="top"
											title="Thuyền KAYAK" class="fa fa-ship"></i>
									</c:if>
									<c:if test="${prod.phuongTien eq 'Xích lô'}">
										<i data-toggle="tooltip" data-placement="top" title="Xích lô"
											class="fas fa-wheelchair"></i>
									</c:if>
									<c:if test="${prod.phuongTien eq 'Phà'}">
										<i data-toggle="tooltip" data-placement="top" title="Phà"
											class="fas fa-ship"></i>
									</c:if>
									<c:if test="${prod.phuongTien eq 'Tàu Thủy'}">
										<i data-toggle="tooltip" data-placement="top" title="Tàu Thủy"
											class="fas fa-anchor"></i>
									</c:if>
									<c:if test="${prod.phuongTien eq 'Cáp treo'}">
										<i data-toggle="tooltip" data-placement="top" title="Cáp Treo"
											class="fas fa-tram"></i>
									</c:if>
									<c:if test="${prod.phuongTien eq 'Ô Tô Điện'}">
										<i data-toggle="tooltip" data-placement="top"
											title="Ô Tô Điện" class="fas fa-car-side"></i>
									</c:if>
									&ensp;
									<c:if test="${prod.phuongTien1 eq 'Máy Bay'}">
										<i data-toggle="tooltip" data-placement="top" title="Máy Bay"
											class="fas fa-plane-departure"></i>
									</c:if>
									<c:if test="${prod.phuongTien1 eq 'Xe khách'}">
										<i data-toggle="tooltip" data-placement="top" title="Xe Khách"
											class="fas fa-bus"></i>
									</c:if>
									<c:if test="${prod.phuongTien1 eq 'Xe đạp'}">
										<i data-toggle="tooltip" data-placement="top" title="Xe đạp"
											class="fas fa-bicycle"></i>
									</c:if>
									<c:if test="${prod.phuongTien1 eq 'Thuyền KAYAK'}">
										<i data-toggle="tooltip" data-placement="top"
											title="Thuyền KAYAK" class="fa fa-ship"></i>
									</c:if>
									<c:if test="${prod.phuongTien1 eq 'Xích lô'}">
										<i data-toggle="tooltip" data-placement="top" title="Xích lô"
											class="fas fa-wheelchair"></i>
									</c:if>
									<c:if test="${prod.phuongTien1 eq 'Phà'}">
										<i data-toggle="tooltip" data-placement="top" title="Phà"
											class="fas fa-ship"></i>
									</c:if>
									<c:if test="${prod.phuongTien1 eq 'Tàu Thủy'}">
										<i data-toggle="tooltip" data-placement="top" title="Tàu Thủy"
											class="fas fa-anchor"></i>
									</c:if>
									<c:if test="${prod.phuongTien1 eq 'Cáp treo'}">
										<i data-toggle="tooltip" data-placement="top" title="Cáp Treo"
											class="fas fa-tram"></i>
									</c:if>
									<c:if test="${prod.phuongTien1 eq 'Ô Tô Điện'}">
										<i data-toggle="tooltip" data-placement="top"
											title="Ô Tô Điện" class="fas fa-car-side"></i>
									</c:if>
									&ensp;
									<c:if test="${prod.phuongTien2 eq 'Máy Bay'}">
										<i data-toggle="tooltip" data-placement="top" title="Máy Bay"
											class="fas fa-plane-departure"></i>
									</c:if>
									<c:if test="${prod.phuongTien2 eq 'Xe khách'}">
										<i data-toggle="tooltip" data-placement="top" title="Xe Khách"
											class="fas fa-bus"></i>
									</c:if>
									<c:if test="${prod.phuongTien2 eq 'Xe đạp'}">
										<i data-toggle="tooltip" data-placement="top" title="Xe đạp"
											class="fas fa-bicycle"></i>
									</c:if>
									<c:if test="${prod.phuongTien2 eq 'Thuyền KAYAK'}">
										<i data-toggle="tooltip" data-placement="top"
											title="Thuyền KAYAK" class="fa fa-ship"></i>
									</c:if>
									<c:if test="${prod.phuongTien2 eq 'Xích lô'}">
										<i data-toggle="tooltip" data-placement="top" title="Xích lô"
											class="fas fa-wheelchair"></i>
									</c:if>
									<c:if test="${prod.phuongTien2 eq 'Phà'}">
										<i data-toggle="tooltip" data-placement="top" title="Phà"
											class="fas fa-ship"></i>
									</c:if>
									<c:if test="${prod.phuongTien2 eq 'Tàu Thủy'}">
										<i data-toggle="tooltip" data-placement="top" title="Tàu Thủy"
											class="fas fa-anchor"></i>
									</c:if>
									<c:if test="${prod.phuongTien2 eq 'Cáp treo'}">
										<i data-toggle="tooltip" data-placement="top" title="Cáp Treo"
											class="fas fa-tram"></i>
									</c:if>
									<c:if test="${prod.phuongTien2 eq 'Ô Tô Điện'}">
										<i data-toggle="tooltip" data-placement="top"
											title="Ô Tô Điện" class="fas fa-car-side"></i>
									</c:if>
								</div>
							</div>
							<div class="col-md-6">

								<div class="booking-item-rating mb5 font16">
								<i
										class=" fa fa-hourglass box-icon-mini box-icon-inline box-icon-gray"></i>
									Thời Gian: <span id="time"></span> Ngày
								</div>
								<div class="mb5">
									<i
										class="fa fa-calendar box-icon-mini box-icon-inline box-icon-gray"></i>
									Ngày khởi hành:
									<fmt:formatDate value="${prod.ngayDi}" pattern="dd/MM/yyyy" />
								</div>
								<div class="mb5">
									<i
										class="fa fa-calendar box-icon-mini box-icon-inline box-icon-gray"></i>
									Ngày Về:
									<fmt:formatDate value="${prod.ngayVe}" pattern="dd/MM/yyyy" />
								</div>
								<div class="mb5">
									<i
										class="fa fa-exclamation-circle box-icon-mini box-icon-inline box-icon-gray"></i>
									Số Chỗ Còn Nhận:
									<c:if test="${(prod.soLuongKhach - prod.soLuongDaDat) > '0'}">
										<span id="slkcl"> </span>
									</c:if>
									<c:if test="${(prod.soLuongKhach - prod.soLuongDaDat) eq '0'}">
										<span style="color: red"> Đã hết chỗ </span>
									</c:if>
								</div>
								<input type="hidden" name="ngaydi" id="ngaydi"
									value="${prod.ngayDi}"> <input type="hidden"
									name="ngayve" id="ngayve" value="${prod.ngayVe}"> <input
									type="hidden" name="slk" id="slk" value="${prod.soLuongKhach}">
								<input type="hidden" name="sldd" id="sldd"
									value="${prod.soLuongDaDat}"> <input type="hidden"
									name="tien" id="tien" value="${prod.giaTour}"> <input
									type="hidden" name="giamgia" id="giamgia"
									value="${prod.giamGia}">
							</div>

						</div>
					</div>
					<div class="booking-item-dates-change mt15"
						style="background: #ddd; border: none; border-radius: 0; overflow: hidden;">
						<div class="row">
							<div class="col-md-6">
								<c:if test="${(prod.soLuongKhach - prod.soLuongDaDat) > '0'}">
									<div>
										<c:if test="${prod.giamGia > '0'}">
											<div class="text-lg color-orange_gia font38" id="tiengiamgia"></div>
											<div class="old-price clearfix">
												<fmt:formatNumber pattern="#,##0₫" value="${prod.giaTour}"
													type="currency" />
											</div>
										</c:if>
										<c:if test="${prod.giamGia == '0'}">
											<span class="text-lg color-orange_gia font38"> <fmt:formatNumber
													pattern="#,##0₫" value="${prod.giaTour}" type="currency" /></span>
										</c:if>
									</div>
								</c:if>

								<c:if test="${(prod.soLuongKhach - prod.soLuongDaDat) == '0'}">
									<div
										style="color: red; margin-left: 30px; font-size: 30px; line-height: 60px; text-transform: capitalize; padding-top: 50px;">
										<b>Đã hết chỗ</b>
									</div>
								</c:if>
								<c:if test="${prod.isDelete eq 'true'}">
									<span style="color: red"><b>Đã Đóng</b> </span>
								</c:if>
								<c:if test="${(prod.soLuongKhach - prod.soLuongDaDat) > '0' }">
									<c:if test="${prod.isDelete eq 'false'}">
										<br>
										<a href="/paytour/index/${maTour }">
											<button class="btn btn-success btn-booking text-uppercase">Đặt
												Tour</button>
										</a>
									</c:if>
								</c:if>
							</div>
							<div class="col-md-6">
								<div class="text-center mb15">
									<img style="width: 150px; padding-top: 10px;"
										src="https://tourdulichviet.com/public/frontend/img/ico_dam_bao_hoan_tien.png">
									<div rel="tooltip" data-placement="top" title=""
										data-original-title="Click vào xem chi tiết">
										<i class="fa fa-check-circle color-green"></i> <span
											class="color-blue" data-toggle="modal"
											data-target="#modal-tour-price">Đảm
											bảo giá tốt nhất</span>
									</div>
								</div>

							</div>
						</div>
					</div>



				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div id="sidebar">
					<div id="nav-anchor"></div>
					<div class="fix-menu">
						<ul>
							<li class="tabview"><a href="#tab-1">LỊCH TRÌNH</a></li>
						</ul>
						<button class="btn btn-success btn-book-top" style="display: none">ĐẶT
							TOUR</button>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt15">
			<div class="col-md-8">
				<div class="tabbable booking-details-tabbable">
					<div class="tab-content" style="padding: 15px; border:1px solid #ddd">
						<div id="tab-1">
							<div class="row">
								<div class="col-md-12  mt15 mb20">


									<div id="lt_content">
										<div class="prefix_note">
											<i class="fa fa-suitcase"></i> LỊCH TRÌNH TOUR
										</div>

										<div class="clearfix"></div>

										<ul class="cbp_tmtimeline">
											<li>
												<div class="cbp_tmicon">
													<i class="fa fa-car" aria-hidden="true"></i>
												</div>
												<div class="cbp_tmlabel ">
													<div class="cbp_detail" style="word-wrap: break-word;">
														<h2 style="text-align: justify;">
															<span style="font-size: 16px;"><strong>${prod.noiKhoiHanh}</strong></span>
														</h2>
														<hr />
														
														${prod.moTa}
														<h2 style="text-align: justify;">
															<span style="font-size: 16px;"><strong>${prod.noiKhoiHanh}</strong></span>
														</h2>
													</div>
													<br>
												</div>
											</li>

										</ul>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>




			</div>
			<div class="col-md-4">
				<div class="question-box">
					<div class="question-got">BẠN ĐANG CÓ CÂU HỎI? GỌI NGAY CHO
						CHÚNG TÔI ĐỂ ĐƯỢC TƯ VẤN MIỄN PHÍ 24/7.</div>
					<div class="tel-number mb15">090 206 8068</div>
				</div>
				<br> <br>
				<!--video-->
				<iframe width="350" height="305"
					src="${prod.video}?autoplay=1&mute=1"> </iframe>
				<!--video-->
			</div>
		</div>
	</div>
	<section class="tour_LienQuan1">
		<div class="container">
			<div class="row tour_LienQuan">
				<div class="col-lg-12">
					<div class="section_tour_last_hour_title">
						<h2>
							<a href="tour-khuyen-mai" title=" Tour giờ chót Giá tốt"> <span>Các
									Tour liên quan</span></a>
						</h2>
						<p>Cùng Evo Tour điểm qua một vài địa điểm du lịch trong nước
							thu hút du khách nhất nhé!</p>
					</div>
					<div class="row evo-tour-scroll">
						<div id="owl_3" class="owl-carousel owl-theme">
							<c:forEach var="prod" items="${prod.loaiTour.tour}">
								<div class="">
									<div class="evo-product-block-item contentPage">
									<c:if test="${prod.giamGia > '0'}">	
									<div class="label_icon1"><span>giảm giá ${prod.maTour}%</span></div>
									</c:if>
										<div class="img-tour">
											<a href="/tour/detail/${prod.maTour}" title=""> <img
												src="/static/images/tour/${prod.hinh}">
											</a>
										</div>
										<div class="info-tour clearfix">
											<h3>
												<a title="">${prod.tenTour}</a>
											</h3>
											<div class="vote-box">
												<div class="meta-vote">
									Phương tiện: &ensp;
									<c:if test="${prod.phuongTien eq 'Máy Bay'}">
										<i data-toggle="tooltip" data-placement="top" title="Máy Bay"
											class="fas fa-plane-departure"></i>
									</c:if>
									<c:if test="${prod.phuongTien eq 'Xe khách'}">
										<i data-toggle="tooltip" data-placement="top" title="Xe Khách"
											class="fas fa-bus"></i>
									</c:if>
									<c:if test="${prod.phuongTien eq 'Xe đạp'}">
										<i data-toggle="tooltip" data-placement="top" title="Xe đạp"
											class="fas fa-bicycle"></i>
									</c:if>
									<c:if test="${prod.phuongTien eq 'Thuyền KAYAK'}">
										<i data-toggle="tooltip" data-placement="top"
											title="Thuyền KAYAK" class="fa fa-ship"></i>
									</c:if>
									<c:if test="${prod.phuongTien eq 'Xích lô'}">
										<i data-toggle="tooltip" data-placement="top" title="Xích lô"
											class="fas fa-wheelchair"></i>
									</c:if>
									<c:if test="${prod.phuongTien eq 'Phà'}">
										<i data-toggle="tooltip" data-placement="top" title="Phà"
											class="fas fa-ship"></i>
									</c:if>
									<c:if test="${prod.phuongTien eq 'Tàu Thủy'}">
										<i data-toggle="tooltip" data-placement="top" title="Tàu Thủy"
											class="fas fa-anchor"></i>
									</c:if>
									<c:if test="${prod.phuongTien eq 'Cáp treo'}">
										<i data-toggle="tooltip" data-placement="top" title="Cáp Treo"
											class="fas fa-tram"></i>
									</c:if>
									<c:if test="${prod.phuongTien eq 'Ô Tô Điện'}">
										<i data-toggle="tooltip" data-placement="top"
											title="Ô Tô Điện" class="fas fa-car-side"></i>
									</c:if>
									&ensp;
									<c:if test="${prod.phuongTien1 eq 'Máy Bay'}">
										<i data-toggle="tooltip" data-placement="top" title="Máy Bay"
											class="fas fa-plane-departure"></i>
									</c:if>
									<c:if test="${prod.phuongTien1 eq 'Xe khách'}">
										<i data-toggle="tooltip" data-placement="top" title="Xe Khách"
											class="fas fa-bus"></i>
									</c:if>
									<c:if test="${prod.phuongTien1 eq 'Xe đạp'}">
										<i data-toggle="tooltip" data-placement="top" title="Xe đạp"
											class="fas fa-bicycle"></i>
									</c:if>
									<c:if test="${prod.phuongTien1 eq 'Thuyền KAYAK'}">
										<i data-toggle="tooltip" data-placement="top"
											title="Thuyền KAYAK" class="fa fa-ship"></i>
									</c:if>
									<c:if test="${prod.phuongTien1 eq 'Xích lô'}">
										<i data-toggle="tooltip" data-placement="top" title="Xích lô"
											class="fas fa-wheelchair"></i>
									</c:if>
									<c:if test="${prod.phuongTien1 eq 'Phà'}">
										<i data-toggle="tooltip" data-placement="top" title="Phà"
											class="fas fa-ship"></i>
									</c:if>
									<c:if test="${prod.phuongTien1 eq 'Tàu Thủy'}">
										<i data-toggle="tooltip" data-placement="top" title="Tàu Thủy"
											class="fas fa-anchor"></i>
									</c:if>
									<c:if test="${prod.phuongTien1 eq 'Cáp treo'}">
										<i data-toggle="tooltip" data-placement="top" title="Cáp Treo"
											class="fas fa-tram"></i>
									</c:if>
									<c:if test="${prod.phuongTien1 eq 'Ô Tô Điện'}">
										<i data-toggle="tooltip" data-placement="top"
											title="Ô Tô Điện" class="fas fa-car-side"></i>
									</c:if>
									&ensp;
									<c:if test="${prod.phuongTien2 eq 'Máy Bay'}">
										<i data-toggle="tooltip" data-placement="top" title="Máy Bay"
											class="fas fa-plane-departure"></i>
									</c:if>
									<c:if test="${prod.phuongTien2 eq 'Xe khách'}">
										<i data-toggle="tooltip" data-placement="top" title="Xe Khách"
											class="fas fa-bus"></i>
									</c:if>
									<c:if test="${prod.phuongTien2 eq 'Xe đạp'}">
										<i data-toggle="tooltip" data-placement="top" title="Xe đạp"
											class="fas fa-bicycle"></i>
									</c:if>
									<c:if test="${prod.phuongTien2 eq 'Thuyền KAYAK'}">
										<i data-toggle="tooltip" data-placement="top"
											title="Thuyền KAYAK" class="fa fa-ship"></i>
									</c:if>
									<c:if test="${prod.phuongTien2 eq 'Xích lô'}">
										<i data-toggle="tooltip" data-placement="top" title="Xích lô"
											class="fas fa-wheelchair"></i>
									</c:if>
									<c:if test="${prod.phuongTien2 eq 'Phà'}">
										<i data-toggle="tooltip" data-placement="top" title="Phà"
											class="fas fa-ship"></i>
									</c:if>
									<c:if test="${prod.phuongTien2 eq 'Tàu Thủy'}">
										<i data-toggle="tooltip" data-placement="top" title="Tàu Thủy"
											class="fas fa-anchor"></i>
									</c:if>
									<c:if test="${prod.phuongTien2 eq 'Cáp treo'}">
										<i data-toggle="tooltip" data-placement="top" title="Cáp Treo"
											class="fas fa-tram"></i>
									</c:if>
									<c:if test="${prod.phuongTien2 eq 'Ô Tô Điện'}">
										<i data-toggle="tooltip" data-placement="top"
											title="Ô Tô Điện" class="fas fa-car-side"></i>
									</c:if>
												</div>
											</div>
											<div class="date-go">
												<ul class="ct_course_list">
													<li class="clearfix"><i class="fa fa-calendar"
														style="font-size: 18px"></i> Lịch khởi hành: <span><fmt:formatDate
																value="${prod.ngayDi}" pattern="dd/MM/yyyy" /></span></li>
													<li class="clearfix"><i class="fa fa-map-marker"
														style="font-size: 18px"></i> Nơi Khởi Hành: <span>${prod.noiKhoiHanh}</span>
													</li>
												</ul>
											</div>
											<div class="action-box">
												<div class="booking-box">
													<a href="/paytour/index/${prod.maTour}" title="Đặt Tour"
														class="btn btn-sm">ĐẶT TOUR</a>
												</div>
												<button class="btn btn-light" style="border: none; margin-right: 30px;"
													onclick="cart.add(${prod.maTour}, `${prod.tenTour}`, ${prod.giaTour}, `${prod.noiKhoiHanh}`, `${prod.hinh}`, `${prod.phuongTien}`)">
												<span class="fa fa-heart" style="font-size: 20px; color: red;"> </span>
												</button>
											</div>
											
										</div>
																						<div class="sharing_button1">
	<span><i class="fa fa-share-alt"></i></span>
	<div class="social-media">
		<a target="_blank"
			href="http://www.facebook.com/sharer/sharer.php?u=http://localhost:8080/tour/detail/${prod.maTour}"
			class="share-facebook" title="Chia sẻ lên Facebook"> <i
			class="fa fa-facebook"></i>
		</a> <a target="_blank"
			href="https://twitter.com/intent/tweet?text=WebsiteDuLichToanQuoc&url=http://localhost:8080/tour/detail/${prod.maTour}"
			class="share-twitter" title="Chia sẻ lên Twitter"> <i
			class="fa fa-twitter"></i>
		</a> <a target="_blank"
			href="http://pinterest.com/pin/create/button/?url=http://localhost:8080/tour/detail/${prod.maTour}&description=WebsiteDuLichToanQuoc&media=/static/image/tour/${prod.hinh}"
			class="share-google" title="+1"> <i class="fa fa-google"></i>
		</a>
	</div>
</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
</div>
<!-- Facebook Share Button -->
<a class="button_share1 share facebook"
	href="http://www.facebook.com/sharer/sharer.php?u=http://localhost:8080/tour/detail/${prod.maTour}"><i
	class="fa fa-facebook"></i></a>
<!-- Twitter Share Button -->
<a class="button_share2 share twitter"
	href="https://twitter.com/intent/tweet?text=WebsiteDuLichToanQuoc&url=http://localhost:8080/tour/detail/${prod.maTour}"><i
	class="fa fa-twitter"></i></a>
<!-- Pinterest Share Button -->
<a class="button_share3 share pinterest"
	href="http://pinterest.com/pin/create/button/?url=http://localhost:8080/tour/detail/${prod.maTour}&description=WebsiteDuLichToanQuoc&media=https://www.dulichsocson.com.vn/wp-content/uploads/2018/06/Du-l%E1%BB%8Bch-Ch%C3%A2u-%C3%82u-ti%E1%BA%BFt-ki%E1%BB%87m-m%C3%B4-h%C3%ACnh-du-l%E1%BB%8Bch-%C4%91ang-c%E1%BB%B1c-hot-t%E1%BA%A1i-Vi%E1%BB%87t-Nam.jpg"><i
	class="fa fa-pinterest"></i></a>
