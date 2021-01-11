
<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
        <div class="container">
            <ul class="breadcrumb" itemscope="" itemtype="https://schema.org/BreadcrumbList">
                <li class="home" itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"> <a
                        itemprop="item" href="/" title="Trang chủ"> <span itemprop="name">Trang chủ</span>
                        <meta itemprop="position" content="1"> </a> </li>
                <li itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"> <strong
                        itemprop="name">Quản lí đơn Tour</strong>
                    <meta itemprop="position" content="2">
                </li>
            </ul>
        </div>
<section class="form_QT">
	<div class="container">
		<div class="row">
				<div class="col-md-12">
			<a href="/admin/qldontour/index"> <i class='fas fa-angle-left'></i>
				Quay lại
			</a>
		</div>
		<br>

				<!--search-->
				<div class="col-md-12">
					<form action="/admin/qldontour/list-by-keywords" method="post"
						class="purchase-list-page__search-bar purchase-list-page__search-bar-focus">
						<svg width="19px" height="19px" viewBox="0 0 19 19">
                            <g id="Search-New" stroke-width="1"
								fill="none" fill-rule="evenodd">
                                <g id="my-purchase-copy-27"
								transform="translate(-399.000000, -221.000000)" stroke-width="2">
                                    <g id="Group-32"
								transform="translate(400.000000, 222.000000)">
                                        <circle id="Oval-27" cx="7"
								cy="7" r="7"></circle>
                                        <path
								d="M12,12 L16.9799555,16.919354" id="Path-184"
								stroke-linecap="round" stroke-linejoin="round"></path>
                                    </g>
                                </g>
                            </g>
                        </svg>
						<input autocomplete="off"
							placeholder="Tìm kiếm theo Tour hoặc tên khách hàng, tên nhân viên ..."
							type="search" value="${param.keywords}" name="keywords">
					</form>
					<c:if test="${not empty message }">
						<div class="alert alert-${alerts} fade in alert-dismissible show">
							${message}
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close" style="top: -10px;">
								<span aria-hidden="true">×</span>
							</button>
						</div>
					</c:if>
					<c:if test="${not empty tb}">
						<div class="toast" data-autohide="false" style="max-width: 500px">
							<div class="toast-header">
								<strong class="mr-auto text-primary" style="font-size: 17px">
									${message} </strong>
								<button type="button" class="ml-2 mb-1 close"
									data-dismiss="toast">&times;</button>
							</div>
						</div>
					</c:if>
				</div>
			<section>
<table class="content-table check">
	<thead>
		<tr>
			<th>Tour</th>
			<th>Ngày Đặt</th>
			<th>Tên Khách Hàng</th>
			<th>Tên Nhân Viên</th>
			<th>Số Lượng Khách</th>
			<th>Ghi Chú</th>
			<th>Tổng Tiền</th>
			<th>Trạng Thái Thanh Toán</th>
			<th>Tình Trạng</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
	<c:set var="slCTT" value="0" />
		<c:forEach var="item" items="${items}" varStatus="st">
		<c:set var="slCTT" value="${slCTT + 1}" />
			<tr class="contentPage1">
				<td>${item.tour.tenTour}</td>
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
				<td>
				<c:if test="${item.tinhTrang eq '1'}"><label class="label label-primary">Đã Xuất Phát</label></c:if> 
				<c:if test="${item.tinhTrang eq '-1'}"><label class="label label-info">Chưa Xuất Phát</label></c:if>
				<c:if test="${item.tinhTrang eq '0'}"><label class="label label-info">Hoàn Thành</label></c:if>
				</td>

				<td class="row">
					<div class="button_admin">
						<a data-toggle="tooltip" data-placement="top" title="See Detail" href="/admin/qldontour/seeDetail/${item.maDonTour}"
							type="button" class="button_see" class="btn"><i
							class='fas fa-eye'></i> </a> 
							<c:if test="${item.trangThaiThanhToan eq 'false' }">
 						<a data-toggle="tooltip" data-placement="top" title="Edit" href="/admin/qldontour/edit/${item.maDonTour}" type="button"
							class="button_edit" class="btn"><i class='fas fa-edit'></i> </a> 
					
						<a type="button" data-toggle="modal" data-target="#${st.count}1"
							type="button" class="button_delete" class="btn"><i
							class='fas fa-close'></i></a>
						</c:if>

							
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
	<ul id="pagination1"></ul>
<c:if test="${slCTT == '0'}">
<div class="alert1 text-center">Không có dữ liệu</div>
</c:if>
			</section>
		</div>
	</div>
</section>
<!-- JS tạo nút bấm di chuyển trang end -->
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