<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	tours = {}
	$(document).ready(function () {	
		for(id in tours){
			$("#tour").append("<option value='.tour-"+id+"'>"+tours[id]+"</option>");
		}
		$("#tour").change(function(){
			$(".tr-tour").hide();
			var clazz = $(this).val();
			$(clazz).show();
		});
		$("#tour").change();
		$(":checkbox.chk-vehicle").prop("checked", true);
	});
</script>

<select id="tour" class="form-control"></select>
  <br>
 <span> <b>Tình Trạng Tour:</b> &ensp;</span>
    <div class="pretty p-default">
        <input type="checkbox" class="chk-vehicle" value="Chưa xuất phát"/>
        <div class="state p-info">
            <label>Chưa Xuất Phát</label>
        </div>
    </div>

    <div class="pretty p-default">
        <input type="checkbox" class="chk-vehicle" value="Đã xuất phát" />
        <div class="state p-primary">
            <label>Đã Xuất Phát</label>
        </div>
    </div>

    <div class="pretty p-default">
        <input type="checkbox" class="chk-vehicle" value="Hoàn thành" />
        <div class="state p-success">
            <label>Hoàn Thành</label>
        </div>
    </div>
 &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
 <span> <b>Trạng Thái Thanh Toán:</b> &ensp;</span>
    <div class="pretty p-default">
        <input type="checkbox" class="chk-vehicle" value="Đã Thanh Toán" />
        <div class="state p-primary">
            <label>Đã Thanh Toán</label>
        </div>
    </div>
       
    <div class="pretty p-default">
        <input type="checkbox" class="chk-vehicle" value="Chưa thanh toán" />
        <div class="state p-warning">
            <label>Chưa thanh toán</label>
        </div>
    </div>
    
<table class="content-table check">
	<thead>
		<tr>
			<th>Mã Đơn Tour</th>
			<th>Ngày Đặt</th>
			<th>Ngày Đi</th>
			<th>Tên Khách Hàng</th>
			<th>Tên Nhân Viên</th>
			<th>Số Lượng Khách</th>
			<th>Tổng Tiền</th>
			<th>Tình Trạng</th>
			<th>Trạng Thái Thanh Toán</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody id="myTable">
	<c:set var="slCTT" value="0" />
		<c:forEach var="item" items="${daduyet}" varStatus="stt">
		<script>tours[`${item.tour.maTour}`] = `${item.tour.tenTour}`;</script>
		<c:set var="slCTT" value="${slCTT + 1}" />
				<tr  style="display:none" class="tour-${item.tour.maTour} tr-tour">
				<td>${item.maDonTour}</td>
				<td><fmt:formatDate value="${item.ngayDat}"
						pattern="dd/MM/yyyy'  'HH:mm:ss" /></td>
				<td><fmt:formatDate value="${item.tour.ngayDi}"
						pattern="dd/MM/yyyy' 'HH:mm" /></td>
				<td>${item.khachHang.tenKhachHang}</td>
				<td>${item.nhanVien.tenNhanVien}</td>
				<td>${item.soLuongKhach}</td>
				<td><fmt:formatNumber pattern="#,##0₫" value="${item.giaTour}"
						type="currency" /></td>
				<td>
				<c:if test="${item.tinhTrang eq '1'}"><label class="label label-primary">Đã Xuất Phát</label></c:if> 
				<c:if test="${item.tinhTrang eq '-1'}"><label class="label label-info">Chưa Xuất Phát</label></c:if>
				<c:if test="${item.tinhTrang eq '0'}"><label class="label label-success">Hoàn Thành</label></c:if>
				</td>
				<td>
				<c:if test="${item.trangThaiThanhToan eq 'true'}"><label class="label label-primary">Đã Thanh Toán</label></c:if> 
				<c:if test="${item.trangThaiThanhToan eq 'false' }"><label class="label label-warning">Chưa Thanh Toán</label></c:if>
				</td>

				<td class="row">
					<div class="button_admin">
						<a data-toggle="tooltip" data-placement="top" title="See Detail" href="/admin/qldontour/seeDetail/${item.maDonTour}"
							type="button" class="button_see" class="btn"><i
							class='fas fa-eye'></i> </a> 
							<c:if test="${item.trangThaiThanhToan eq 'false' }">
 						<a data-toggle="tooltip" data-placement="top" title="Edit" href="/admin/qldontour/edit/${item.maDonTour}" type="button"
							class="button_edit" class="btn"><i class='fas fa-edit'></i> </a> 

						<a type="button" data-toggle="modal" data-target="#${stt.count}2"
							type="button" class="button_delete" class="btn"><i
							class='fas fa-close'></i></a>
						</c:if>
						
								<!-- Modal -->
						<div class="modal fade" id="${stt.count}2"  tabindex="-1"
							aria-hidden="true">
							<div class="modal-dialog">
									<!-- Modal content-->
									<div class="modal-content">
										<div class="swal-modal">
											<div class="swal-icon swal-icon--waring">
												<div class="swal-icon--error__x-mark">
												<span
														class="swal-icon--warning__line--dot"></span>
													<span
														class="swal-icon--warning__line--long"></span>
													
												</div>
											</div>
											<div class="swal-title">Bạn Có Chắc Chắn Hủy Tour Này?</div>
											<div class="swal-footer">
												<div class="swal-button-container">
										<a data-dismiss="modal" class="swal-button swal-button--confirm">Trở lại</a>
										<a href="/admin/qldontour/cancel/${item.maDonTour}"
											class="swal-button1 swal-button--confirm">Hủy</a>
												
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
				</td>

			</tr>
		</c:forEach>
	</tbody>
</table>
<c:if test="${slCTT == '0'}">
<div class="alert1 text-center">Không có dữ liệu</div>
</c:if>