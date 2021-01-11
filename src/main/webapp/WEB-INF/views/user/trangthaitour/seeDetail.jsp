<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id='preloader'>
  <div id='loader'>
    <span class='loader'>
      <span class='loader-inner'></span>
    </span>
  </div>
</div> 
   <!--Article-->
    <!--Tiêu Đề Trang-->
    <section class="bread-crumb margin-bottom-10">
        <div class="container">
            <ul class="breadcrumb" itemscope="" itemtype="https://schema.org/BreadcrumbList">
                <li class="home" itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"> <a
                        itemprop="item" href="/" title="Trang chủ"> <span itemprop="name">Trang chủ</span>
                        <meta itemprop="position" content="1"> </a> </li>
                <li itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"> <strong
                        itemprop="name">Chi tiết đơn Tour</strong>
                    <meta itemprop="position" content="2">
                </li>
            </ul>
        </div>
    </section>
    <!--Form_Information-->
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <table class="Oesya">
                    <thead>
                        <tr>
                            <th><b>Mã Đơn Tour: ${prod.maDonTour} </b></th>
                            <th>Số Lượng Khách</th>
                            <th>Trạng Thái Thanh Toán</th>
                            <th>Trạng Thái Duyệt Đơn</th>
                            <th>Tổng Tiền</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <div class="product-item"><img src="/static/images/tour/${prod.tour.hinh}" alt="chưa có hình">
                                    <div class="product-info"><a class="product-name" href="/tour/detail/${prod.tour.maTour}">${prod.tour.tenTour}</a>
                                        <p class="product-sku">Ngày Đặt: <a href=""><fmt:formatDate value="${prod.ngayDat}" pattern="dd/MM/yyyy'  'HH:mm:ss"/></a></p>
                                        <p class="product-sku">Khách Hàng: <a style="color: #337ab7; " href="">${prod.khachHang.tenKhachHang}</a></p>
                                        <p class="product-sku">Nhân Viên: <a href="">${prod.nhanVien.tenNhanVien}</a></p>
                                        <div class="product-review">
                                            <a class="back" href="/trangthaitour/seeDetail/back">Quay lại</a>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td class="price">${prod.soLuongKhach}</td>
                            <td class="quantity">
                            <c:if test="${prod.trangThaiThanhToan eq 'true'}">
						<label class="label label-primary">Đã Thanh Toán</label>
					</c:if> <c:if test="${prod.trangThaiThanhToan eq 'false' }">
						<label class="label label-warning">Chưa Thanh Toán</label>
					</c:if></td>
                            <td class="discount-amount">
                     <c:if test="${prod.trangThaiDuyetDon eq '1'}">
						<label class="label label-primary">Đã Duyệt</label>
					</c:if> <c:if test="${prod.trangThaiDuyetDon eq '0' }">
						<label class="label label-info">Chưa Duyệt</label>
					</c:if> <c:if test="${prod.trangThaiDuyetDon eq '-1' }">
						<label class="label label-danger">Đã Hủy</label>
					</c:if></td>
                            <td class="raw-total"><fmt:formatNumber
						pattern="#,##0₫" value="${prod.giaTour}" type="currency" /></td>
                        </tr>
                    </tbody>              
                </table>
                <textarea class="chuThich" name="ghiChu"  placeholder="Ghi Chú" readonly="true">${prod.ghiChu}</textarea>
            </div>
            
            <div class="col-md-6">
                <div class="box_info_account_ĐT">
                    <div class="my_info_account_header_ĐT">
                        <h3>THÊM MỚI DU KHÁCH</h3>
              <c:if test="${not empty hidden }">
				 <span style="color: red" ><b>Bạn Đã Nhập Đủ Số Người</b>  </span>
			</c:if>
                    </div>

                    <!--Form-->
               <c:if test="${prod.trangThaiDuyetDon eq '0'}">
               <form:form action="/trangthaitour/seeDetail" modelAttribute="form"
				enctype="multipart/form-data" class="${hidden}">
				<form:hidden path="donTour.maDonTour" />
				<form:hidden path="maThongTin" />
                    <div class="form_info_update">
                        <div class="form-group col-md-6">
                            <label class=" control-label">Tên du khách:</label>
                            <div class="">
                                <form:input path="tenDuKhach" class="form-control" required="f" placeholder="Full Name" name="lh_name" type="text"/>
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label class=" control-label">CMND:</label>
                            <div class="">
                                <form:input path="cmnd" class="form-control numeric" required="f" placeholder="ID " name="lh_name"
                                    type="number"/>
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label class=" control-label">Số điện thoại:</label>
                            <div class="">
                                <form:input path="sdtZalo" class="form-control numeric" maxlength="11" required="f" placeholder="Phone " name="lh_name"
                                    type="text"/>
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label class=" control-label">Giới tính:</label>
                            <div class="">
                                <form:select path="gioiTinh" id="exampleFormControlSelect1" name="gioiTinh" class="form-control">
                                    <form:option value="Nam">Nam</form:option>
                                    <form:option value="Nữ">Nữ</form:option>
                                    <form:option value="Khác">Khác</form:option>
                                </form:select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <form:button formaction="/trangthaitour/seeDetail/${maDonTour}/create" class="btn save4 text-uppercase" disabled="${!empty form.maThongTin}"><i class="fa fa-save"></i> Save</form:button>
                            <form:button formaction="/trangthaitour/seeDetail/${maDonTour}/update" class="btn update4 text-uppercase" disabled="${empty form.maThongTin}"><i class="fa fa-edit"></i> Update</form:button>
                            <a href="/trangthaitour/seeDetail/${maDonTour}" class="btn refresh4 text-uppercase"><i class="fa fa-refresh fa-spin"></i>
                                refresh</a>
                        </div>
                    </div>
				</form:form>                    
               </c:if>
                </div>
            </div>
            <div class="col-md-6">
                <table class="content-table_ĐT ">
                    <thead>
                        <tr>
                            <th>Tên Du Khách</th>
                            <th>CMND</th>
                            <th>Số Điện Thoại</th>
                            <th>Giới Tính</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
					<c:set var="slCTT" value="0" />
					<c:forEach var="item" items="${items}" varStatus="st">
						<c:set var="slCTT" value="${slCTT + 1}" />
						<tr class="contentPage">
							<td>${item.tenDuKhach}</td>
							<td>${item.cmnd}</td>
							<td>${item.sdtZalo}</td>
							<td>${item.gioiTinh}</td>
							<td class="row">
								<div class="button_admin">
									<a data-toggle="tooltip" data-placement="top"
										title="See Detail"
										href="/trangthaitour/seeDetail/${prod.maDonTour}/seeDetail/${item.maThongTin}"
										type="button" class="button_see" class="btn"><i
										class='fas fa-eye'></i> </a>
									<c:if test="${prod.trangThaiDuyetDon eq '0'}">
										<a
											href="/trangthaitour/seeDetail/${prod.maDonTour}/edit/${item.maThongTin}"
											data-toggle="${botay}" data-target="#demo" type="button"
											class="button_edit" class="btn"><i class='fas fa-edit'></i>
										</a>
										<a type="button" data-toggle="modal" data-target="#${st.count}"
											type="button" class="button_delete" class="btn"><i
											class='fas fa-trash'></i></a>
									</c:if>
									
											<!-- Modal -->
						<div class="modal fade" id="${st.count}"  tabindex="-1"
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
										<a href="/trangthaitour/seeDetail/${prod.maDonTour}/delete/${item.maThongTin}"
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
				<div class="alert1 text-center">Xin Mời Bạn Nhập Thông Tin</div>
			</c:if>
		</div>

        </div>
        	              							<!-- Modal OK-->
							<div class="modal" id="${ok}" data-backdrop="static"
								data-keyboard="false" tabindex="-1"
								aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">

									<!-- Modal content-->
									<div class="modal-content">
										<div class="swal-modal">
											<div class="swal-icon swal-icon--success">
												<span
													class="swal-icon--success__line swal-icon--success__line--long"></span>
												<span
													class="swal-icon--success__line swal-icon--success__line--tip"></span>

												<div class="swal-icon--success__ring"></div>
												<div class="swal-icon--success__hide-corners"></div>
											</div>
											<div class="swal-title">${message}</div>
											<div class="swal-footer">
												<div class="swal-button-container">

														<button data-dismiss="modal" class="swal-button swal-button--confirm">OK</button>
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
							<!-- Modal Fail-->
							<div class="modal" id="${fail}" data-backdrop="static"
								data-keyboard="false" tabindex="-1"
								aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">

									<!-- Modal content-->
									<div class="modal-content">
										<div class="swal-modal">
											<div class="swal-icon swal-icon--error">
											<div class="swal-icon swal-icon--waring">
												<div class="swal-icon--error__x-mark">
												<span
														class="swal-icon--warning__line--dot"></span>
													<span
														class="swal-icon--warning__line--long"></span>
													
												</div>
											</div>
											</div>
											<div class="swal-title">${message}</div>
											<div class="swal-footer">
												<div class="swal-button-container">

													<button data-dismiss="modal" class="swal-button swal-button--confirm">OK</button>

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
							<!-- Modal Error-->
							<div class="modal" id="${error}" data-backdrop="static"
								data-keyboard="false" tabindex="-1"
								aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">

									<!-- Modal content-->
									<div class="modal-content">
										<div class="swal-modal">
											<div class="swal-icon swal-icon--error">
												<div class="swal-icon--error__x-mark">
													<span
														class="swal-icon--error__line swal-icon--error__line--left"></span>
													<span
														class="swal-icon--error__line swal-icon--error__line--right"></span>
												</div>
											</div>
											<div class="swal-title">${message}</div>
											<div class="swal-footer">
												<div class="swal-button-container">

													<button data-dismiss="modal" class="swal-button swal-button--confirm">OK</button>

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
<script>
$('#myModal').modal('show');
$('#myModalfail').modal('show');
$('#myModalerror').modal('show');
</script>
<script
	src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
<script type="text/javascript">
            $(function () {
                var pageSize = 5; // Hiển thị 4 sản phẩm trên 1 trang
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
<script>
$(document).on("input", ".numeric", function() {
    this.value = this.value.replace(/\D/g,'');
});
</script>