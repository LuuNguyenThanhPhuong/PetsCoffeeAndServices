

<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<table class="content-table">
	<thead>
		<tr>
			<th>Tài Khoản</th>
			<th>Tên Nhân Viên</th>
			<th>Số Điện Thoại</th>
			<th>Email</th>
			<th>Địa Chỉ</th>
			<th>Ngày Sinh</th>
			<th>Giới Tính</th>
			<th>Vai Trò</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
	<c:set var="slCTT" value="0" />
		<c:forEach var="item" items="${items}" varStatus="st">
		<c:set var="slCTT" value="${slCTT + 1}" />
			<tr class="contentPage">
				<td>${item.maNhanVien}</td>
				<td>${item.tenNhanVien}</td>
				<td>${item.soDienThoai}</td>
				<td>${item.email}</td>
				<td>${item.diaChi}</td>
				<td><fmt:formatDate value="${item.ngaySinh}"
						pattern="dd/MM/yyyy" /></td>
				<td>${item.gioiTinh}</td>
				<td><c:if test="${item.vaiTro eq 'true'}">Admin</c:if> <c:if
						test="${item.vaiTro eq 'false' }">Person</c:if></td>
				<td class="row">
					<div class="button_admin">
						<a  data-toggle="tooltip" data-placement="top" title="See Detail" href="/admin/qlnhanvien/seeDetail/${item.maNhanVien}"
							type="button" class="button_see" class="btn"> <i
							class='fas fa-eye'></i></a> 
							<a data-toggle="tooltip" data-placement="top" title="Edit"
							href="/admin/qlnhanvien/edit/${item.maNhanVien}"
							data-target="#demo" class="button_edit" class="btn"><i
							class='fas fa-edit'></i></a> 
							<a type="button" data-toggle="modal" data-target="#${st.count}1"
							type="button" class="button_delete" class="btn"><i
							class='fas fa-trash'></i></a>
							
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
											<div class="swal-title">Bạn Có Chắc Chắn Muốn Xóa?</div>
											<div class="swal-footer">
												<div class="swal-button-container">
										<a data-dismiss="modal" class="swal-button swal-button--confirm">Hủy</a>
										<a href="/admin/qlnhanvien/delete/${item.maNhanVien}"
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
	<ul id="pagination"></ul>
<c:if test="${slCTT == '0'}">
<div class="alert1 text-center">Không có dữ liệu</div>
</c:if>
<script type="text/javascript">
            $(function () {
                var pageSize = 10; // Hiển thị 4 sản phẩm trên 1 trang
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