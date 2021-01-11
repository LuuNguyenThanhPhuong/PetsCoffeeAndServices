<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
prods = [];
</script>
   <!--Article-->
    <!--Tiêu Đề Trang-->
    <section class="bread-crumb margin-bottom-10">
        <div class="container">
            <ul class="breadcrumb" itemscope="" itemtype="https://schema.org/BreadcrumbList">
                <li class="home" itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"> <a
                        itemprop="item" href="/home/index" title="Trang chủ"> <span itemprop="name">Trang chủ</span>
                        <meta itemprop="position" content="1"> </a> </li>
                <li itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"> <strong
                        itemprop="name">${tour} ${param.keywords}</strong>
                    <meta itemprop="position" content="2">
                </li>
            </ul>
        </div>
    </section>
    <!--Tour_Title-->
  <section class="Tour_Title_BTN">
<div class="container">
<div class="row">
    <div class="col-md-12">
        <div class="section_tour-new_title">
            <h2> <span>${tour} ${param.keywords}</span></h2>
            <div class="title-line">
                <div class="tl-1"></div>
                <div class="tl-2"></div>
                <div class="tl-3"></div>
            </div>
            <p>Tour du lịch trong nước tại Travel. Du lịch 5 châu - Trải nghiệm sắc xuân thế giới</p>
        </div>
				<div class="row evo-tour-scroll">
								<c:set var="slCTT" value="0" />
					<c:forEach var="prod" items="${list}">
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
										<a title="">${prod.tenTour}</a>
									
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
										<div class="meta-vote">Phương Tiện: &ensp;
										<c:if test="${prod.phuongTien eq 'Máy Bay'}"> <i data-toggle="tooltip" data-placement="top" title="Máy Bay" class="fas fa-plane-departure"></i></c:if>
										<c:if test="${prod.phuongTien eq 'Xe khách'}"> <i data-toggle="tooltip" data-placement="top" title="Xe Khách" class="fas fa-bus"></i></c:if>
										<c:if test="${prod.phuongTien eq 'Xe đạp'}"> <i data-toggle="tooltip" data-placement="top" title="Xe đạp" class="fas fa-bicycle"></i></c:if>
										<c:if test="${prod.phuongTien eq 'Thuyền KAYAK'}"> <i data-toggle="tooltip" data-placement="top" title="Thuyền KAYAK" class="fas fa-wheelchair"></i></c:if>
										<c:if test="${prod.phuongTien eq 'Xích lô'}"> <i data-toggle="tooltip" data-placement="top" title="Xích lô" class="fas fa-wheelchair"></i></c:if>
										<c:if test="${prod.phuongTien eq 'Phà'}"> <i data-toggle="tooltip" data-placement="top" title="Phà" class="fas fa-wheelchair"></i></c:if>
										<c:if test="${prod.phuongTien eq 'Tàu Thủy'}"> <i data-toggle="tooltip" data-placement="top" title="Tàu Thủy" class="fas fa-ship"></i></c:if>
										<c:if test="${prod.phuongTien eq 'Cáp treo'}"> <i data-toggle="tooltip" data-placement="top" title="Cáp Treo" class="fas fa-tram"></i></c:if>
										<c:if test="${prod.phuongTien eq 'Ô Tô Điện'}"> <i data-toggle="tooltip" data-placement="top" title="Ô Tô Điện" class="fas fa-car-side"></i></c:if>
										&ensp;
										<c:if test="${prod.phuongTien1 eq 'Máy Bay'}"> <i data-toggle="tooltip" data-placement="top" title="Máy Bay" class="fas fa-plane-departure"></i></c:if>
										<c:if test="${prod.phuongTien1 eq 'Xe khách'}"> <i data-toggle="tooltip" data-placement="top" title="Xe Khách" class="fas fa-bus"></i></c:if>
										<c:if test="${prod.phuongTien1 eq 'Xe đạp'}"> <i data-toggle="tooltip" data-placement="top" title="Xe đạp" class="fas fa-bicycle"></i></c:if>
										<c:if test="${prod.phuongTien1 eq 'Thuyền KAYAK'}"> <i data-toggle="tooltip" data-placement="top" title="Thuyền KAYAK" class="fas fa-wheelchair"></i></c:if>
										<c:if test="${prod.phuongTien1 eq 'Xích lô'}"> <i data-toggle="tooltip" data-placement="top" title="Xích lô" class="fas fa-wheelchair"></i></c:if>
										<c:if test="${prod.phuongTien1 eq 'Phà'}"> <i data-toggle="tooltip" data-placement="top" title="Phà" class="fas fa-wheelchair"></i></c:if>
										<c:if test="${prod.phuongTien1 eq 'Tàu Thủy'}"> <i data-toggle="tooltip" data-placement="top" title="Tàu Thủy" class="fas fa-ship"></i></c:if>
										<c:if test="${prod.phuongTien1 eq 'Cáp treo'}"> <i data-toggle="tooltip" data-placement="top" title="Cáp Treo" class="fas fa-tram"></i></c:if>
										<c:if test="${prod.phuongTien1 eq 'Ô Tô Điện'}"> <i data-toggle="tooltip" data-placement="top" title="Ô Tô Điện" class="fas fa-car-side"></i></c:if>
										&ensp;
										<c:if test="${prod.phuongTien2 eq 'Máy Bay'}"> <i data-toggle="tooltip" data-placement="top" title="Máy Bay" class="fas fa-plane-departure"></i></c:if>
										<c:if test="${prod.phuongTien2 eq 'Xe khách'}"> <i data-toggle="tooltip" data-placement="top" title="Xe Khách" class="fas fa-bus"></i></c:if>
										<c:if test="${prod.phuongTien2 eq 'Xe đạp'}"> <i data-toggle="tooltip" data-placement="top" title="Xe đạp" class="fas fa-bicycle"></i></c:if>
										<c:if test="${prod.phuongTien2 eq 'Thuyền KAYAK'}"> <i data-toggle="tooltip" data-placement="top" title="Thuyền KAYAK" class="fas fa-wheelchair"></i></c:if>
										<c:if test="${prod.phuongTien2 eq 'Xích lô'}"> <i data-toggle="tooltip" data-placement="top" title="Xích lô" class="fas fa-wheelchair"></i></c:if>
										<c:if test="${prod.phuongTien2 eq 'Phà'}"> <i data-toggle="tooltip" data-placement="top" title="Phà" class="fas fa-wheelchair"></i></c:if>
										<c:if test="${prod.phuongTien2 eq 'Tàu Thủy'}"> <i data-toggle="tooltip" data-placement="top" title="Tàu Thủy" class="fas fa-ship"></i></c:if>
										<c:if test="${prod.phuongTien2 eq 'Cáp treo'}"> <i data-toggle="tooltip" data-placement="top" title="Cáp Treo" class="fas fa-tram"></i></c:if>
										<c:if test="${prod.phuongTien2 eq 'Ô Tô Điện'}"> <i data-toggle="tooltip" data-placement="top" title="Ô Tô Điện" class="fas fa-car-side"></i></c:if>
										
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
					<c:if test="${slCTT == '0'}"><div class="alert1 text-center">
					Tạm Thời Không Có Tour, Xin Lỗi Vì Sự Bất Tiện Này</div></c:if>
    </div>
</div>
</div>
<ul id="pagination"></ul>
  </section>
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
		
		console.log(tiengiamgia)
		console.log(time)
	})
	
});
</script>