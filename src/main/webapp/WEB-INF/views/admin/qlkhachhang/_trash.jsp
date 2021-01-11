<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<table class="content-table undo">

	<thead>
		<tr>
			<th>Tài Khoản</th>
			<th>Tên Khách Hàng</th>
			<th>Số Điện Thoại</th>
			<th>Email</th>
			<th>Địa Chỉ</th>
			<th>Ngày Sinh</th>
			<th>Kích Hoạt Tài Khoản</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<c:set var="slCTT" value="0" />
		<c:forEach var="item" items="${trashitems}" varStatus="stt">
			<c:set var="slCTT" value="${slCTT + 1}" />
			<tr class="contentPage1" >
				<td>${item.maKhachHang}</td>
				<td>${item.tenKhachHang}</td>
				<td>${item.soDienThoai}</td>
				<td>${item.email}</td>
				<td>${item.diaChi}</td>
				<td><fmt:formatDate value="${item.ngaySinh}"
						pattern="dd/MM/yyyy" /></td>
				<%-- <td>${item.hinh}</td> --%>
				<td><c:if test="${item.active eq 'true'}">Đã Kích Hoạt</c:if> <c:if
						test="${item.active eq 'false' }">Chưa Kích Hoạt</c:if></td>
				<td class="row ">
					<div class="button_admin">
						<a data-toggle="tooltip" data-placement="top" title="Recover" type="button" class="button_recovery"
							href="/admin/qlkhachhang/restore/${item.maKhachHang}" class="btn"><i
							class='fas fa-undo-alt'></i> </a>
							 <a type="button" data-toggle="modal" data-target="#${stt.count}2"
							type="button" class="button_delete" class="btn"><i
							class='fas fa-trash'></i></a>
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
											<div class="swal-title">Bạn Có Chắc Chắn Muốn Xóa?</div>
											<div class="swal-footer">
												<div class="swal-button-container">
										<a data-dismiss="modal" class="swal-button swal-button--confirm">Hủy</a>
										<a href="/admin/qlkhachhang/deletetrash/${item.maKhachHang}"
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
<ul id="pagination1"></ul>
<c:if test="${slCTT == '0'}">
<div class="alert1 text-center">Không có dữ liệu</div>
</c:if>
<script type="text/javascript">
            $(function () {
                var pageSize1 = 10; // Hiển thị 4 sản phẩm trên 1 trang
                showPage1 = function (page) {
                    $(".contentPage1").hide();
                    $(".contentPage1").each(function (n) {
                        if (n >= pageSize1 * (page - 1) && n < pageSize1 * page)
                            $(this).show();
                    });
                }
                showPage1(1);
                ///** Cần truyền giá trị vào đây **///
                var totalRows = ${slCTT} // Tổng số sản phẩm hiển thị
                var btnPage = 5; // Số nút bấm hiển thị di chuyển trang
                var iTotalPages = Math.ceil(totalRows / pageSize1);

                var obj = $('#pagination1').twbsPagination({
                    totalPages: iTotalPages,
                    visiblePages: btnPage,
                    onPageClick: function (event, page) {
                        console.info(page);
                        showPage1(page);
                    }
                });
                console.info(obj.data());
            });
        </script>
