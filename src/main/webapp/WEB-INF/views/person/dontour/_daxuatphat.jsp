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
<table class="content-table ">
	<thead>
		<tr>
			<th>Mã Đơn Tour</th>
			<th>Ngày Đặt</th>
			<th>Tên Khách Hàng</th>
			<th>Số Lượng Khách</th>
			<th>Tổng Tiền</th>
			<th>Trạng Thái Thanh Toán</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
	<c:set var="slCTT" value="0" />
		<c:forEach var="item" items="${daxuatphat}">
		<script>tours1[`${item.tour.maTour}`] = `${item.tour.tenTour}`;</script>
		<c:set var="slCTT" value="${slCTT + 1}" />
			<tr style="display:none" class="tour1-${item.tour.maTour} tr-tour1">
				<td>${item.maDonTour}</td>
				<td><fmt:formatDate value="${item.ngayDat}"
						pattern="dd/MM/yyyy'  'HH:mm:ss" /></td>
				<td>${item.khachHang.tenKhachHang}</td>
				<td>${item.soLuongKhach}</td>
				
				<td><fmt:formatNumber pattern="#,##0₫" value="${item.giaTour}"
						type="currency" /></td>
				<td>
				<c:if test="${item.trangThaiThanhToan eq 'true'}"><label class="label label-primary">Đã Thanh Toán</label></c:if> 
				<c:if test="${item.trangThaiThanhToan eq 'false' }"><label class="label label-warning">Chưa Thanh Toán</label></c:if>
				</td>

				<td class="row">
					<div class="button_admin">
						<a href="/person/dontour/seeDetail/${item.maDonTour}"
							type="button" class="button_see" class="btn"><i
							class='fas fa-eye'></i> </a> 
					</div>
				</td>

			</tr>
		</c:forEach>
	</tbody>
</table>
<c:if test="${slCTT == '0'}">
<div class="alert1 text-center">Không có dữ liệu</div>
</c:if>