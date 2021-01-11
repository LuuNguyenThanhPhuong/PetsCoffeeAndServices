<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<table class="content-table">
	<thead>
		<tr>
			<th>Mã Đơn</th>
			<th>Tour</th>
			<th>Ngày Đặt</th>
			<th>Ngày Đi</th>
			<th>Số Lượng Khách</th>
			<th>Trạng Thái Thanh Toán</th>
			<th>Tổng Tiền</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
	<c:set var="slCTT" value="0" />
		<c:forEach var="item" items="${chuaduyet}" varStatus="st">
		<c:set var="slCTT" value="${slCTT + 1}" />
			<tr class="contentPage">
				<td>${item.maDonTour}</td>
				<td><a href="/tour/detail/${item.tour.maTour}" >${item.tour.tenTour} </a></td>
				<td><fmt:formatDate value="${item.ngayDat}" pattern="dd/MM/yyyy'  'HH:mm:ss"/></td>
				<td><fmt:formatDate value="${item.tour.ngayDi}" pattern="dd/MM/yyyy"/></td>
				<td> ${item.soLuongKhach} </td>
				<td><c:if test="${item.trangThaiThanhToan eq 'true'}"><label class="label label-primary">Đã Thanh Toán</label></c:if> 
				<c:if test="${item.trangThaiThanhToan eq 'false' }"><label class="label label-warning">Chưa Thanh Toán</label></c:if>
				<td><fmt:formatNumber pattern="#,##0₫" value = "${item.giaTour}" type = "currency"/></td>
				
				<td>
					<c:if test="${item.trangThaiDuyetDon eq '0'}">
				    	<a type="button" data-toggle="modal" data-target="#${st.count}1"
							type="button" class="button_delete" class="btn"><i
							class='fas fa-close'></i></a>
			        </c:if>			    
			    	<a data-toggle="tooltip" data-placement="top" title="Edit" href="/trangthaitour/seeDetail/${item.maDonTour}" type="button"
							class="button_edit" class="btn"><i class='fas fa-edit'></i>
			        </a>
			        
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
											<div class="swal-title">Bạn Có Chắc Chắn Muốn Hủy Đơn Này?</div>
											<div class="swal-footer">
												<div class="swal-button-container">
										<a data-dismiss="modal" class="swal-button swal-button--confirm">Trở lại</a>
										<a href="/trangthaitour/cancel/${item.maDonTour}"
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
				</td>

			</tr>
		</c:forEach>
	</tbody>
</table>
	<ul id="pagination"></ul>
<c:if test="${slCTT == '0'}">
<div class="alert1 text-center">Không có dữ liệu</div>
</c:if>
<!-- JS tạo nút bấm di chuyển trang end -->
<script type="text/javascript">
            $(function () {
                var pageSize = 10; 
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
                        showPage1(page);
                    }
                });
                console.info(obj.data());
            });
        </script>
