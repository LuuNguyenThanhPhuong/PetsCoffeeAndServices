<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	tours2 = {}
	$(document).ready(function () {	
		for(id in tours2){
			$("#tour2").append("<option value='.tour2-"+id+"'>"+tours2[id]+"</option>");
		}
		$("#tour2").change(function(){
			$(".tr-tour2").hide();
			var clazz = $(this).val();
			$(clazz).show();
		});
		$("#tour2").change();
	});
	
</script>

<select id="tour2" class="form-control"></select>
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
		<c:forEach var="item" items="${hoanthanh}">
		<script>tours2[`${item.tour.maTour}`] = `${item.tour.tenTour}`;</script>
		<c:set var="slCTT" value="${slCTT + 1}" />
			<tr style="display:none" class="tour2-${item.tour.maTour} tr-tour2">
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