<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<table class="content-table undo">
	<thead>
		<tr>
			<th>Mã Đơn Tour</th>
			<th>Ngày Đặt</th>
			<th>Tên Khách Hàng</th>
			<th>Tên Nhân Viên</th>
			<th>Số Lượng Khách</th>
			<th>Ghi Chú</th>
			<th>Tổng Tiền</th>
			<th>Trạng Thái Thanh Toán</th>

			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<c:set var="slCTT" value="0" />
		<c:forEach var="item" items="${trashitems}" varStatus="sttt">
		<c:set var="slCTT" value="${slCTT + 1}" />
			<tr class="contentPage2">
				<td>${item.maDonTour}</td>
				<td><fmt:formatDate value="${item.ngayDat}"
						pattern="dd/MM/yyyy'  'HH:mm:ss" /></td>
				<td>${item.khachHang.tenKhachHang}</td>
				<td>${item.nhanVien.tenNhanVien}</td>
				<td>${item.soLuongKhach}</td>
				<td>${item.ghiChu}</td>
				<td><fmt:formatNumber pattern="#,##0₫" value="${item.giaTour}"
						type="currency" /></td>
				<td>
				<c:if test="${item.trangThaiThanhToan eq 'true'}"><label class="label label-primary">Đã Thanh Toán</label></c:if> 
				<c:if test="${item.trangThaiThanhToan eq 'false' }"><label class="label label-warning">Chưa Thanh Toán</label></c:if>
				</td>

				<td class="row">
					<div class="button_admin">
						<a data-toggle="tooltip" data-placement="top" title="See Detail" href="/admin/qldontour/seeDetail/${item.maDonTour}"
							type="button" class="button_see" class="btn"><i
							class='fas fa-eye'></i> </a> 
						<a type="button" data-toggle="modal" data-target="#${sttt.count}3"
							type="button" class="button_delete" class="btn"><i
							class='fas fa-trash'></i></a>
							
									<!-- Modal -->
						<div class="modal fade" id="${sttt.count}3"  tabindex="-1"
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
											<div class="swal-title">Bạn Có Chắc Chắn Muốn Xóa?</div>
											<div class="swal-footer">
												<div class="swal-button-container">
										<a data-dismiss="modal" class="swal-button swal-button--confirm">Trở lại</a>
										<a href="/admin/qldontour/delete/${item.maDonTour}"
											class="swal-button1 swal-button--confirm">Xóa</a>
												
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