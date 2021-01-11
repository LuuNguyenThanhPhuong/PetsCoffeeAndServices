<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
    <!--Article-->
    <!--Tiêu Đề Trang-->
    <section class="bread-crumb margin-bottom-10">
        <div class="container">
            <ul class="breadcrumb" itemscope="" itemtype="https://schema.org/BreadcrumbList">
                <li class="home" itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem">
                    <a itemprop="item" href="/" title="Trang chủ"> <span itemprop="name">Trang chủ</span>
                        <meta itemprop="position" content="1"> </a>
                </li>
                <li itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"> <strong
                        itemprop="name">Booking</strong>
                    <meta itemprop="position" content="2" >
                </li>
            </ul>
        </div>
    </section>


<div class="container">
	<div class="row">
		<form:form action="/paytour/index" modelAttribute="form"
			id="form-booking" method="post">
			<!--Box_Right-->
			<div class="col-md-4  col-xs-12 pull-right xs-right">
				<div class="booking-item-payment">
					<ul class="booking-item-payment-details">
						<li><img class="clearfix mb10" height="200"
							src="/static/images/tour/${prod.hinh}">
							<h5 class="color-orange">${prod.tenTour}</h5>
							<div class="row" style="margin-bottom: 0px;">

								<div class="col-md-12">
									<p class="mb0 text-darken clearfix">
										<i class="fa fa-calendar font16" aria-hidden="true"></i> Ngày
										khởi hành: <span><fmt:formatDate value="${prod.ngayDi}"
												pattern="dd/MM/yyyy" /></span>
									</p>
									<p class="mb0 text-darken clearfix">
										<i class="fa fa-clock-o font16" aria-hidden="true"></i> Giờ
										khởi hành: <span><fmt:formatDate value="${prod.ngayDi}"
												pattern="HH:mm" /></span>
									</p>
									<p class="mb0 text-darken clearfix">
										<i class="fa fa-hourglass font16" aria-hidden="true"></i> Thời
										Gian: <span id="time"> </span> Ngày
									</p>
									<p class="mb0 text-darken clearfix">
										<i class="fa fa-calendar font16" aria-hidden="true"></i> Ngày
										Về: <span><fmt:formatDate value="${prod.ngayVe}"
												pattern="dd/MM/yyyy" /></span>
									</p>
									<p class="mb0 text-darken clearfix">
										<i class="fa fa-map-marker font16" aria-hidden="true"></i> Nơi
										Khởi Hành: <span>${prod.noiKhoiHanh}</span>
									</p>
									<p class="mb0 text-darken clearfix">
										<i class="fa fa-users font16" aria-hidden="true"></i> Số
										Lượng Khách:
										<c:if test="${(prod.soLuongKhach - prod.soLuongDaDat) > '0'}">
											<span id="slkcl"> </span>
										</c:if>
										<c:if test="${(prod.soLuongKhach - prod.soLuongDaDat) eq '0'}">
											<span> Đã hết chỗ </span>
										</c:if>
									</p>
									<c:if test="${prod.giamGia > 0 }">
										<p class="mb0 text-darken clearfix">
											<i class="fa fa-star font16" aria-hidden="true"></i>
											Giảm Giá: <span>${prod.giamGia}%</span>
										</p>
									</c:if>
									<input type="hidden" name="ngaydi" id="ngaydi"
										value="${prod.ngayDi}"> <input type="hidden"
										name="ngayve" id="ngayve" value="${prod.ngayVe}"> <input
										type="hidden" name="slk" id="slk" value="${prod.soLuongKhach}">
									<input type="hidden" name="sldd" id="sldd"
										value="${prod.soLuongDaDat}">
									<p class="mb0 text-darken clearfix">
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
									</p>
									<div class="booking-item-rating w100 mb0 clearfix"></div>
								</div>

							</div>
							<h5>
								GIÁ TOUR
								<c:if test="${prod.giamGia > 0 }">
									<span class="color-orange">(Đã Giảm Giá)</span>
								</c:if>
							</h5>
							<table class="table table-no-bd table-booking mb0"
								style="height: 10px">
								<tbody>
									<tr>
										<td><span class="ticket_number color-blue"> </span><span
											class="badge badge-pill badge-info" id="khach1">0</span>
											Người x</td>

										<td><strong class="ticket_price color-orange"
											id="tiengiamgia"> </strong> <input type="hidden"
											name="giamgia" id="giamgia" value="${prod.giamGia}">
											<input type="hidden" name="tien" id="tien"
											value="${prod.giaTour}"> =</td>

										<td class="text-right"><strong
											class="ticket_total color-orange" id="tongtien"> 0
										</strong></td>
									</tr>
								</tbody>
							</table></li>
						<li class="baggage"></li>
					</ul>
					<p class="booking-item-payment-total">
						Số tiền thanh toán: <span class="total color-orange"
							id="tongtien1"> 0 </span>

					</p>
				</div>
			</div>
			<!--Box_Left-->

			<div class="col-md-8  pull-left col-xs-12">
				<div class="box-booking mb15">
					<h4 class="color-orange">ĐẶT TOUR ONLINE hoặc gọi (028) 3933
						8002</h4>

					<div class="list booking-item-passengers">
						<div class="row">
							<form:hidden path="maDonTour" />
							<form:hidden path="Tour.maTour" />
							<form:hidden path="nhanVien.maNhanVien" />
							<form:hidden path="khachHang.maKhachHang" />
							<form:hidden path="giaTour" />

							<form:hidden path="trangThaiDuyetDon" />
							<form:hidden path="trangThaiThanhToan" />


							<div class="col-md-12">
								<div class="form-group">
									<label>Ngày Đặt Tour</label>
									<form:input path="ngayDat" class="form-control datepicker"
										placeholder="Ngày Đặt" readonly="true" />
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label>Số Lượng Khách (<span class="color-orange">*</span>)
									</label>
									<form:input id="khach" path="soLuongKhach"
										class="form-control numeric" required=""
										placeholder="Nhập Số Lượng" name="soluong" type="number" />
									<span id="slkhach" style="color: red"></span>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label>Ghi Chú</label>
									<form:textarea id="ghichu" path="ghiChu" class="form-control"
										placeholder="Yêu cầu khác" name="ghiChu" rows="5"></form:textarea>
								</div>
							</div>
							<!-- Cần chứ ý cái này -->
							<input name="details" type="hidden">
							<!-- -- -->
							<div class="col-md-12">
								<p>
									<i class="glyphicon glyphicon-star"></i> Hãy chắc chắn rằng bạn
									đã nhập thông tin chính xác ở phần tài khoản của bạn! Để chúng
									tôi có thể liên lạc với bạn và tiến hành xác nhận. Cảm ơn bạn
									đã tin tưởng.
								</p>
							</div>
							<div class="col-md-12">
								<p>
									<i class="glyphicon glyphicon-lock"></i> tourdulichviet.com cam
									kết bảo mật thông tin của quý khách.
								</p>
							</div>
							<div class="col-md-6">
								<button formaction="/paytour/index/${maTour}/create"
									id="dattour" class="btn btn-block mb10 btn-lg">
									<i class="glyphicon glyphicon-ok"></i> HOÀN TẤT ĐẶT TOUR
								</button>
							</div>
							<div class="col-md-6">
								<button formaction="/paytour/index/back"
									class="btn btn-back mb10 btn-lg">
									<i class="fa fa-reply"></i> TRỞ LẠI
								</button>
							</div>
							<!-- Modal -->
							<div class="modal" id="${message}" data-backdrop="static"
								data-keyboard="false" tabindex="-1"
								aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">

									<!-- Modal content-->
									<div class="modal-content">
										<div class="swal-modal">
											<div class="swal-icon swal-icon--success">
												<span
													class="swal-icon--success__line swal-icon--success__line--long"></span>
												<span
													class="swal-icon--success__line swal-icon--success__line--tip"></span>

												<div class="swal-icon--success__ring"></div>
												<div class="swal-icon--success__hide-corners"></div>
											</div>
											<div class="swal-title">
												Cảm ơn bạn tin tưởng vào <br> dịch vụ của chúng tôi
											</div>
											<div class="swal-text">Xin vui lòng điền thông tin
												Hành Khách theo số lượng!</div>
											<div class="swal-footer">
												<div class="swal-button-container">


													<a style="text-decoration: none;"
														class="swal-button swal-button--confirm"
														href="/trangthaitour/seeDetail/${maDonTour}"> OK</a>


													<div class="swal-button__loader">
														<div></div>
														<div></div>
														<div></div>
													</div>
												</div>
											</div>
										</div>
									</div>

								</div>
							</div>

							<!-- Modal Error-->
							<div class="modal" id="${message}" data-backdrop="static"
								data-keyboard="false" tabindex="-1"
								aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">

									<!-- Modal content-->
									<div class="modal-content">
										<div class="swal-modal">
											<div class="swal-icon swal-icon--error">
												<div class="swal-icon--error__x-mark">
													<span
														class="swal-icon--error__line swal-icon--error__line--left"></span>
													<span
														class="swal-icon--error__line swal-icon--error__line--right"></span>
												</div>
											</div>
											<div class="swal-title">Bạn đã đặt Tour thất bại</div>
											<div class="swal-text">Xin vui lòng tải lại trang và
												thử lại!</div>
											<div class="swal-footer">
												<div class="swal-button-container">

													<button class="swal-button swal-button--confirm">OK</button>

													<div class="swal-button__loader">
														<div></div>
														<div></div>
														<div></div>
													</div>

												</div>
											</div>
										</div>
									</div>

								</div>
							</div>


						</div>
					</div>
				</div>
			</div>
		</form:form>
	</div>
</div>

</div>
<script>
$('#myModal').modal('show');
$('#myModalerror').modal('show');
</script>
<script>
	function formatVND(number){
	return number.toFixed(0).replace(/./g, function (c, i, a){
		return i > 0 && c !== "," && (a.length - i) % 3 === 0? "." + c : c;
	}) + ' ₫';
}
</script>
<script>
$(document).ready(function () {
	$('#dattour').prop('disabled', true);
	$('#khach').prop('disabled', false);
	$('#ghichu').prop('disabled', false);
	
});
</script>
<script>
	$('#khach').on('change', () => {
		$('#khach1').html($('#khach').val());
		var khach = $('#khach').val();
		var tien = $('#tien').val();
		var giamgia = $('#giamgia').val();
		var tiengiamgia = tien - (tien * (giamgia /100));
		var tongtien = khach * tiengiamgia;
		
		$('#tiengiamgia').html(formatVND(tiengiamgia));
		$('#tongtien').html(formatVND(tongtien));
		
		$('#tongtien1').html(formatVND(tongtien));
		
		
		$("[name=giaTour]").val(tongtien);
		

		var slk = $('#slk').val(); 
		var sldd = $('#sldd').val(); 
		var slkcl = slk - sldd;
		if(Number(khach) > Number(slkcl)){
			document.getElementById("slkhach").innerHTML = "Quá Số Lượng Khách, Tour chỉ còn trống cho "+ slkcl + " người";
			$('#dattour').prop('disabled', true);
		}else if (Number(khach) == 0){
			document.getElementById("slkhach").innerHTML = "Số lượng phải lớn hơn 0";
			$('#dattour').prop('disabled', true);
		} else{
			document.getElementById("slkhach").innerHTML = "";
			$('#dattour').prop('disabled', false);
		}
	});
	    $(document).ready(function () {
	    	$('#dattour').prop('disabled', true);
	    	var tien = $('#tien').val();
			var giamgia = $('#giamgia').val();
			var tiengiamgia = tien - (tien * (giamgia /100));
			$('#tiengiamgia').html(formatVND(tiengiamgia));
			var slk = $('#slk').val(); 
			var sldd = $('#sldd').val(); 
			var slkcl = slk - sldd;
			$('#slkcl').html(slkcl)
			var khach = $('#khach').val();
			if(Number(slkcl) == 0){
				document.getElementById("slkhach").innerHTML = "Đã Hết Chỗ, Xin Lỗi Vì Sự Bất Tiện Này";
				$('#khach').prop('disabled', true);
				$('#ghichu').prop('disabled', true);
			}
			
			var ngaydi = $('#ngaydi').val();
			var ngayve = $('#ngayve').val();
			
			var fromTime = new Date(ngaydi);
			var toTime = new Date(ngayve);
			var differenceTravel = toTime.getTime() - fromTime.getTime();
			var time = Math.floor((differenceTravel) /1000/60/60/24);
			$('#time').html(time)
	    });
</script>
<script>
$(document).on("input", ".numeric", function() {
    this.value = this.value.replace(/\D/g,'');
});
</script>