<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id='preloader'>
  <div id='loader'>
    <span class='loader'>
      <span class='loader-inner'></span>
    </span>
  </div>
</div> 
<script>
prods = [];
</script>
<section class="section_slider">
	<div id="carouselExampleFade" class="carousel slide carousel-fade"
		data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/static/images/slideshow_1.jpg" class="d-block w-100"
					alt="...">
			</div>
			<div class="carousel-item">
				<img src="/static/images/slide_2.jpg" class="d-block w-100"
					alt="...">
			</div>
			<div class="carousel-item">
				<img src="/static/images/slide_3.jpg" class="d-block w-100"
					alt="...">
			</div>
			<div class="carousel-item">
				<img src="/static/images/slide_4.jpg" class="d-block w-100"
					alt="...">
			</div>
			<div class="carousel-item">
				<img src="/static/images/slide_5.jpg" class="d-block w-100"
					alt="...">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleFade"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleFade"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
</section>

 <section class="section_dichvu">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div id="owl-carousel" class="wrap_dichvu owl-carousel owl-loaded owl-drag">
                        <div class="owl-stage-outer">
                            <div class="owl-stage"
                                style="transform: translate3d(0px, 0px, 0px); transition: all 0.25s ease 0s; width: 1170px;">
                                <div class="owl-item active" style="width: 360px; margin-right: 30px;">
                                    <div class="item">
                                        <div class="wrap_dichvu_item">
                                            <div class="number"><span>01</span></div>
                                            <div class="content_dichvu">
                                                <p>Vận Chuyển Nhanh Chóng</p>
                                                <span>Miễn phí giao hàng trong nội thành Sài Gòn</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                               
                                <div class="owl-item active" style="width: 360px; margin-right: 30px;">
                                    <div class="item">
                                        <div class="wrap_dichvu_item">
                                            <div class="number"><span>02</span></div>
                                            <div class="content_dichvu">
                                                <p>Sản Phẩm Chất Lượng</p>
                                                <span>Các sản phẩm sử dụng chất liệu bền bỉ thân thiện môi trường</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 <div class="owl-item active" style="width: 360px; margin-right: 30px;">
                                    <div class="item">
                                        <div class="wrap_dichvu_item">
                                            <div class="number"><span>03</span></div>
                                            <div class="content_dichvu">
                                                <p>Các dịch vụ cao cấp</p>
                                                <span>Cắt tỉa lông, bảo hiểm sức khỏe thú cưng, Spa Grooming, chích ngừa</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="owl-nav disabled">
                            <div class="owl-prev disabled">prev</div>
                            <div class="owl-next disabled">next</div>
                        </div>
                        <div class="owl-dots disabled">
                            <div class="owl-dot active"><span></span></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section_about">
        <div class="container">
            <div class="row">

                <div class="col-lg-7 col-md-6 col-sm-12 col-xs-12">
                    <div class="inner_about">
                        <div class="title_module_main a-center">
                            <h2><span>Hãy chọn PETS</span></h2>
                        </div>
                        <p class="mini">Vì PETS không chỉ cung cấp những dịch vụ cho thú cưng của bạn mà còn là nơi để bạn ngồi thư giãn trong khoản thời gian chờ đợi thú cưng của mình được các chuyên gia của PETS chăm sóc.</p>
                        <p class="large">Với đội ngũ các nhân viên dày dặn kinh nghiệm, những sản phẩm chất lượng cao. Chúng tôi cam kết đem lại cho khách hàng một trải nghiệm tuyệt vời và ấn tượng.</p>
                        <div class="wrap_about">
                           		 <div class="row">
								 <div class=" item_nopadding">
                                    <div class="item">                              
                                        <div class="icon"><i class="fa fa-plus"></i></div>
                                        <div class="title_about">Chuyến bay đẳng cấp</div>
                                    </div>
                                </div>



                                <div class=" item_nopadding">
                                    <div class="item">
                                        <div class="icon"><i class="fa fa-check"></i></div>
                                        <div class="title_about">Hành trình hấp dẫn</div>
                                    </div>
                                </div>



                                <div class=" item_nopadding">
                                    <div class="item">
                                        <div class="icon"><i class="fa fa-coffee"></i></div>
                                        <div class="title_about">Quản lí chặt chẽ</div>
                                    </div>
                                </div>



                                <div class="item_nopadding">
                                    <div class="item">
                                        <div class="icon"><i class="fa fa-heartbeat"></i></div>
                                        <div class="title_about">Khách sạn tiện nghi</div>
                                    </div>
                                </div>



                                <div class=" item_nopadding">
                                    <div class="item">
                                        <div class="icon"><i class="fa fa-credit-card-alt"></i></div>
                                        <div class="title_about">Chất lượng đỉnh cao</div>
                                    </div>
                                </div>



                                <div class=" item_nopadding">
                                    <div class="item">
                                        <div class="icon"><i class="fa fa-globe"></i></div>
                                        <div class="title_about">Hơn 100 tours quốc tế</div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 col-md-6 col-sm-12 col-xs-12">
                    <div class="item_img">
                        <img src="/static/images/about.png" alt="TravelGo">
                    </div>
                </div>

            </div>
        </div>
    </section>
    <section class="Diem_Du_Lich">
	<div class="section_tour_destination">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section_tour_last_hour_title">
						<h2>Tour Du Lịch <a><span> Được Giảm Giá</span></a></h2>
						<p>Các điểm đến du lịch giảm giá trong tuần</p>
					</div>
				</div>
			</div>
			<div class="row">
	<div id="owl_1" class="owl-carousel owl-theme">
				<c:set var="slCTT1" value="0" />
					<c:forEach var="item" items="${items}">
					<c:set var="slCTT1" value="${slCTT1 + 1}" />
				<div class="">
					<div class="pos-relative">
						<div class="label_icon" style="left:-12px;"><span>giảm giá ${item.giamGia}%</span></div>
						<a href="/tour/detail/${item.maTour}" title="">
							<div class="destination-image">
								<img src="/static/images/tour/${item.hinh}" alt="">
							</div>
							<div class="frame-destination">
								<div class="destination-name">${item.tenTour}</div>
								<div class="destination-like">
									Tour du lịch giảm giá
								</div>
							</div>
						</a>
					</div>
				</div>
				</c:forEach>
				</div>
			</div>
						<c:if test="${slCTT1 == '0'}">
			<div class="alert1 text-center">
			Tạm Thời Không Có Giảm Giá, Xin Lỗi Vì Sự Bất Tiện Này
			</div>
			</c:if>
		</div>
	</div>
	</div>
</section>
<section class="banner">
	<div class="section_banner">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6 col-12 banner-top">
					<img src="/static/images/banner1.jpg">
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-12">
					<img src="/static/images/banner2.jpg">
				</div>
			</div>
		</div>
	</div>
</section>
<section class="tour_HapDan">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section_tour_last_hour_title">
					<h2>
						<a href=""
							title=" Tour giờ chót Giá tốt"> <span>Tour Du Lịch</span> Toàn Quốc
						</a>
					</h2>
					<p>Cùng Evo Tour điểm qua một vài địa điểm du lịch trong nước
						thu hút du khách nhất nhé!</p>
				</div>
				
				<div class="row evo-tour-scroll">
				<c:set var="slCTT" value="0" />
					<c:forEach var="prod" items="${prod}">
					<c:set var="slCTT" value="${slCTT + 1}" />
						<div class="col-12 col-sm-6 col-md-4 col-lg-3">
							<div class="evo-product-block-item contentPage">
							<c:if test="${prod.giamGia > '0'}">			
							<div class="label_icon"><span>giảm ${prod.giamGia}%</span></div>
							</c:if>
								<div class="img-tour">
									<a href="/tour/detail/${prod.maTour}" title=""> <img
										src="/static/images/tour/${prod.hinh}">
									</a>
								</div>
								<div class="info-tour clearfix">
									<h3>
										<a href="/tour/detail/${prod.maTour}" title="">${prod.tenTour}</a>
									
									</h3>
									<script>
										prods.push({
											maTour:`${prod.maTour}`,
											gia:`${prod.giaTour}`,
											giamGia: `${prod.giamGia}`,
											ngayDi: `${prod.ngayDi}`,
											ngayVe:`${prod.ngayVe}`
										});
									</script>
                                         
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
												style="font-size: 18px"></i> Lịch khởi hành: <span><fmt:formatDate value="${prod.ngayDi}" pattern="dd/MM/yyyy"/></span>
											</li>
											<li class="clearfix"><i class="fa fa-map-marker"
												style="font-size: 18px"></i> Nơi Khởi Hành: <span>${prod.noiKhoiHanh}</span>
											</li>
											<li class="clearfix"><i class="fa fa-clock-o"
												style="font-size: 18px"></i> Thời Gian: <span id="time${prod.maTour}"></span> Ngày
											</li>
										</ul>
									</div>
									<div class="action-box">
									<c:if test="${prod.giamGia > '0'}">
										<div class="price-box clearfix" id="tiengiamgia${prod.maTour}"></div>
										<div class="old-price-box clearfix"><fmt:formatNumber pattern="#,##0₫" value = "${prod.giaTour}" type = "currency"/></div>
									</c:if>
									<c:if test="${prod.giamGia == '0'}">
										<div class="price-box clearfix"><fmt:formatNumber pattern="#,##0₫" value = "${prod.giaTour}" type = "currency"/></div>
									</c:if>	
									
									
										
									</div>
										<div class="booking-box">
											<a href="/paytour/index/${prod.maTour}" title="Đặt Tour"
												class="btn btn-sm">ĐẶT TOUR</a>
									
										<button class="btn btn-light" style="border:none; float: right; margin-right: 25px;"
											onclick="cart.add(${prod.maTour}, `${prod.tenTour}`, ${prod.giaTour}, `${prod.noiKhoiHanh}`, `${prod.hinh}`, `${prod.phuongTien}`)">
											
											<span class="fa fa-heart" style="font-size: 20px; color: red"></span>
										</button>
										<%@include file="../buttons/_share.jsp"%>
										</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
						<c:if test="${slCTT == '0'}"><div class="alert1 text-center">
					Tạm Thời Không Có Tour, Xin Lỗi Vì Sự Bất Tiện Này</div></c:if>
	<ul id="pagination"></ul>
</section>

<!-- JS tạo nút bấm di chuyển trang start -->
<script
	src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
<!-- JS tạo nút bấm di chuyển trang end -->
<script type="text/javascript">
            $(function () {
                var pageSize = 8; // Hiển thị 4 sản phẩm trên 1 trang
                showPage = function (page) {
                    $(".contentPage").hide();
                    $(".contentPage").each(function (n) {
                        if (n >= pageSize * (page - 1) && n < pageSize * page)
                            $(this).show();
                    });
                }
                showPage(1);
                ///** Cần truyền giá trị vào đây **///
                var totalRows = ${slCTT} // Tổng số sản phẩm hiển thị
                var btnPage = 5; // Số nút bấm hiển thị di chuyển trang
                var iTotalPages = Math.ceil(totalRows / pageSize);

                var obj = $('#pagination').twbsPagination({
                    totalPages: iTotalPages,
                    visiblePages: btnPage,
                    onPageClick: function (event, page) {
                        console.info(page);
                        showPage(page);
                    }
                });
                console.info(obj.data());
            });
        </script>
<script>
	function formatVND(number){
	return number.toFixed(0).replace(/./g, function (c, i, a){
		return i > 0 && c !== "," && (a.length - i) % 3 === 0? "." + c : c;
	}) + ' ₫';
}
</script>
<script type="text/javascript">
$(document).ready(function () {
	prods.forEach(item =>{ 	
		var matour = item.maTour;
		var ngaydi = item.ngayDi;
		var fromTime = new Date(ngaydi);
		var ngayve = item.ngayVe;
		var toTime = new Date(ngayve);
		var differenceTravel = toTime.getTime() - fromTime.getTime();
		var time = Math.floor((differenceTravel) /1000/60/60/24);
		$('#time'+matour).html(time)
		
		var giamgia = item.giamGia;
		var tien = item.gia;
		var tiengiamgia = tien - (tien * (giamgia /100));
		$('#tiengiamgia'+matour).html(formatVND(tiengiamgia))
	
	})
	
});
</script>
<!-- Facebook Share Button -->
<a class="button_share1 share facebook"
	href="http://www.facebook.com/sharer/sharer.php?u=http://localhost:8080/home/index/"><i
	class="fa fa-facebook"></i></a>
<!-- Twitter Share Button -->
<a class="button_share2 share twitter"
	href="https://twitter.com/intent/tweet?text=WebsiteDuLichToanQuoc&url=http://localhost:8080/home/index"><i
	class="fa fa-twitter"></i></a>
<!-- Pinterest Share Button -->
<a class="button_share3 share pinterest"
	href="http://pinterest.com/pin/create/button/?url=http://localhost:8080/home/index&description=WebsiteDuLichToanQuoc&media=https://www.dulichsocson.com.vn/wp-content/uploads/2018/06/Du-l%E1%BB%8Bch-Ch%C3%A2u-%C3%82u-ti%E1%BA%BFt-ki%E1%BB%87m-m%C3%B4-h%C3%ACnh-du-l%E1%BB%8Bch-%C4%91ang-c%E1%BB%B1c-hot-t%E1%BA%A1i-Vi%E1%BB%87t-Nam.jpg"><i
	class="fa fa-pinterest"></i></a>
<div class="zalo-share-button" data-href="http://localhost:8080/home/index" data-oaid="579745863508352884" data-layout="2" data-color="blue" data-customize=false></div>
<script>
$(function () {
    $("#tags").autocomplete({
        source: [
<c:forEach var="prod" items="${prod}">
            {

                value: "/tour/detail/${prod.maTour}",
                label: "${prod.tenTour}",
                img: "/static/images/tour/${prod.hinh}",
            },
</c:forEach>
        ],
        select: function (event, ui) {
            window.location.href = ui.item.value;
        }

    }).autocomplete("instance")._renderItem = function (ul, item) {
        return $("<li><div class='row' style='transition: 0.3s;'><div class='col-sm-4'><img class='a' src='" + item.img + "'></div><span class='col-sm-8' style='font-weight: bold; font-size: 15px;' >" + item.label + "</span></div></li>").appendTo(ul);
    };

});
</script>
