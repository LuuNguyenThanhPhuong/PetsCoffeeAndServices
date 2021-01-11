<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<table class="content-table undo">
	<thead>
		<tr>
			<th>Mã Đơn</th>
			<th>Tour</th>
			<th>Ngày Đặt</th>
			<th>Số Lượng Khách</th>
			<th>Trạng Thái Thanh Toán</th>
			<th>Tổng Tiền</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
	<c:set var="slCTT" value="0" />
		<c:forEach var="item" items="${dahuy}">
		<c:set var="slCTT" value="${slCTT + 1}" />
			<tr class="contentPage2">
				<td>${item.maDonTour}</td>
				<td><a href="/tour/detail/${item.tour.maTour}" >${item.tour.tenTour}</a></td>
				<td><fmt:formatDate value="${item.ngayDat}" pattern="dd/MM/yyyy'  'HH:mm"/></td>
				<td> ${item.soLuongKhach} </td>
				<td><c:if test="${item.trangThaiThanhToan eq 'true'}"><label class="label label-primary">Đã Thanh Toán</label></c:if> 
				<c:if test="${item.trangThaiThanhToan eq 'false' }"><label class="label label-warning">Chưa Thanh Toán</label></c:if>
				<td><fmt:formatNumber pattern="#,##0₫" value = "${item.giaTour}" type = "currency"/></td>
				<td>		    
			    	<a data-toggle="tooltip" data-placement="See Detail" title="See Detail" href="/trangthaitour/seeDetail/${item.maDonTour}" type="button" class="button_see" class="btn"><i
							class='fas fa-eye'></i>
			        </a>
				</td>

			</tr>
		</c:forEach>
	</tbody>
</table>
	<ul id="pagination2"></ul>
<c:if test="${slCTT == '0'}">
<div class="alert1 text-center">Không có dữ liệu</div>
</c:if>
<!-- JS tạo nút bấm di chuyển trang end -->
<script type="text/javascript">
            $(function () {
                var pageSize2 = 10; // Hiển thị 4 sản phẩm trên 1 trang
                showPage2 = function (page) {
                    $(".contentPage2").hide();
                    $(".contentPage2").each(function (n) {
                        if (n >= pageSize2 * (page - 1) && n < pageSize2 * page)
                            $(this).show();
                    });
                }
                showPage2(1);
                ///** Cần truyền giá trị vào đây **///
                var totalRows = ${slCTT} // Tổng số sản phẩm hiển thị
                var btnPage = 5; // Số nút bấm hiển thị di chuyển trang
                var iTotalPages = Math.ceil(totalRows / pageSize2);

                var obj = $('#pagination2').twbsPagination({
                    totalPages: iTotalPages,
                    visiblePages: btnPage,
                    onPageClick: function (event, page) {
                        console.info(page);
                        showPage2(page);
                    }
                });
                console.info(obj.data());
            });
        </script>