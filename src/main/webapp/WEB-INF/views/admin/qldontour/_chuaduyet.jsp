<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	tours1 = {}
	$(document).ready(function () {	
		for(id in tours1){
			$("#tour1").append("<option value='.tour1-"+id+"'>"+tours1[id]+"</option>");
		}
		$("#tour1").change(function(){
			$(".tr-tour1").hide();
			var clazz = $(this).val();
			$(clazz).show();
		});
		$("#tour1").change();
	});
	
</script>
<select id="tour1" class="form-control"></select>
<table class="content-table">
	<thead>
		<tr>
			<th>Mã Đơn Tour</th>
			<th>Ngày Đặt</th>
			<th>Ngày Đi</th>
			<th>Tên Nhân Viên</th>
			<th>Tên Khách Hàng</th>
			<th>Số Lượng Khách</th>
			<th>Tổng Tiền</th>
			<th>Duyệt Đơn</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
	<c:set var="slCTT" value="0" />
		<c:forEach var="item" items="${chuaduyet}" varStatus="st">
		<script>tours1[`${item.tour.maTour}`] = `${item.tour.tenTour}`;</script>
		<c:set var="slCTT" value="${slCTT + 1}" />
				<tr  style="display:none" class="tour1-${item.tour.maTour} tr-tour1">
				<td>${item.maDonTour}</td>
				<td><fmt:formatDate value="${item.ngayDat}"
						pattern="dd/MM/yyyy" /></td>
				<td><fmt:formatDate value="${item.tour.ngayDi}"
						pattern="dd/MM/yyyy' 'HH:mm" /></td>
				<td>${item.nhanVien.tenNhanVien}</td>
				<td>${item.khachHang.tenKhachHang}</td>
				<td>${item.soLuongKhach}</td>
				
				<td><fmt:formatNumber pattern="#,##0₫" value="${item.giaTour}"
						type="currency" /></td>
				<td><c:if test="${item.trangThaiDuyetDon eq '0' }">
						<a href="/admin/qldontour/xacnhan/${item.maDonTour}">
							<input class="btn btn-sm btn-success" value="Duyệt" type="submit"/></a>
					</c:if></td>

				<td class="row">
					<div class="button_admin">
						<a  data-toggle="tooltip" data-placement="top" title="See Detail" href="/admin/qldontour/seeDetail/${item.maDonTour}"
							type="button" class="button_see" class="btn"><i
							class='fas fa-eye'></i> </a> 
							<a data-toggle="tooltip" data-placement="top" title="Edit"
							href="/admin/qldontour/edit/${item.maDonTour}" type="button"
							class="button_edit" class="btn"><i class='fas fa-edit'></i> </a>
						<a type="button" data-toggle="modal" data-target="#${st.count}1"
							type="button" class="button_delete" class="btn"><i
							class='fas fa-close'></i></a>
							
										<!-- Modal -->
						<div class="modal fade" id="${st.count}1"  tabindex="-1"
							 aria-labelledby="exampleModalLabel"
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
											<div class="swal-title">Bạn Có Chắc Chắn Hủy?</div>
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