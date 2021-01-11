<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <section class="bread-crumb margin-bottom-10">
        <div class="container">
            <ul class="breadcrumb" itemscope="" itemtype="https://schema.org/BreadcrumbList">
                <li class="home" itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"> <a
                        itemprop="item" href="/" title="Trang chủ"> <span itemprop="name">Trang chủ</span>
                        <meta itemprop="position" content="1"> </a> </li>
                <li itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"> <strong
                        itemprop="name">Quản lí khách hàng</strong>
                    <meta itemprop="position" content="2">
                </li>
            </ul>
        </div>
    </section>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="tab_QL">
                    <ul class="nav nav-tabs myTab">
                        <li class="active">
                            <a href="#list" data-toggle="tab" aria-expanded="true"><i class='fas fa-list-ul'></i>
                                Danh Sách Khách Hàng</a>
                        </li>
                        <li class="undo">
                            <a href="#trash" data-toggle="tab" aria-expanded="true"><i class='fas fa-trash-alt'></i>
                                Thùng Rác</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <section class="form_QT">
        <div class="container">
            <div class="row">
                <!--search-->
                <div class="col-md-12">
                    <form  action="/admin/qlkhachhang/list-by-keywords" method="post" class="purchase-list-page__search-bar purchase-list-page__search-bar-focus">
                        <svg width="19px" height="19px" viewBox="0 0 19 19">
                            <g id="Search-New" stroke-width="1" fill="none" fill-rule="evenodd">
                                <g id="my-purchase-copy-27" transform="translate(-399.000000, -221.000000)"
                                    stroke-width="2">
                                    <g id="Group-32" transform="translate(400.000000, 222.000000)">
                                        <circle id="Oval-27" cx="7" cy="7" r="7"></circle>
                                        <path d="M12,12 L16.9799555,16.919354" id="Path-184" stroke-linecap="round"
                                            stroke-linejoin="round"></path>
                                    </g>
                                </g>
                            </g>
                        </svg><input  autocomplete="off" placeholder="Tìm kiếm theo Tài Khoản khách hàng hoặc tên khách hàng"
                             type="search" value="${param.keywords}" name="keywords">
                    </form>
                    <br>
                </div>
 <div class="col-md-12">
  <a href="/admin/qlkhachhang/index" class="btn reply-all "><i class="fas fa-reply-all"></i> Page reset</a>
 </div>
                <!--Form_Input-->
               <form:form class="${botay}" id="demo" action="/admin/qlkhachhang/index" modelAttribute="form" enctype="multipart/form-data">
                <div>
                    <div class="container">
                    <div class="row">
                            <div class="col-md-12">
                                <div class="box_info_account">
                                    <div class="my_info_account_header">
                                        <h3>QUẢN LÝ KHÁCH HÀNG </h3>
                                        <h4>Quản lý thông tin hồ sơ, bảo mật tài khoản</h4>
                                          <div data-toggle="collapse" data-target="#demo" class="close_form" aria-expanded="true"><i class="fa fa-window-close" aria-hidden="true"></i></div>                  
                                    </div>
                                    <!--Form-->
                                    <form:hidden path="maKhachHang"/>
                                    <form:hidden path="password"/>
                                    <form:hidden path="isDelete"/>
                                    <form:hidden path="active"/>
                                    <form:hidden path="cmnd"/>
                                    <div class="form_info_update">
                                        <div class="form-group col-md-4">
                                            <label class=" control-label">Tên Khách Hàng:</label>
                                            <div class="">
                                                <form:input path="tenKhachHang" class="form-control" required="f" placeholder="Tên Khách Hàng"
                                                    name="lh_name" type="text" />
                                            </div>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label class=" control-label">Điện thoại:</label>
                                            <div class="">
                                                <form:input path="soDienThoai" class="form-control numeric" maxlength="11" required="f" placeholder="Số Điện Thoại"
                                                    name="lh_name" type="text" />
                                            </div>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label class="control-label">Email:</label>
                                            <div class="">
                                                <form:input path="email" class="form-control" required="f" placeholder="Email"
                                                    pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$" name="lh_name"
                                                    type="text"/>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label class=" control-label">Địa chỉ:</label>
                                            <div class="">
                                                <form:input path="diaChi" class="form-control" required="f" placeholder="Địa Chỉ"
                                                    name="lh_name" type="text"/>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label class=" control-label">Ngày sinh:</label>
                                            <div class="">
                                                <form:input path="ngaySinh" class="form-control" required="f" placeholder="Ngày Sinh" type="date"
                                                    name="lh_name"/>
                                            </div>
                                        </div>

                                        <div class="form-group col-md-4">
                                            <label class=" control-label">Ảnh:</label>
                                            <div class="">
											<input onchange="upload.change(this, '#photo_image')"
												type="file" name="photo_file" id="photo_file"
												class="form-control">
											<form:hidden path="hinh" />
										</div>
                                        </div>

                                        <div class="form-group row">
                                            <form:button formaction="/admin/qlkhachhang/update" disabled="${empty form.maKhachHang}" class="btn update text-uppercase" style="margin-left: 30px;"><i
                                                    class="fa fa-edit" ></i> Update</form:button>
                                            <a href="/admin/qlkhachhang/index" class="btn refresh text-uppercase"><i
                                                    class="fa fa-refresh fa-spin"></i>
                                                refresh</a>
                                                
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </form:form>
                <!--Table-->
                <div class="col-md-12">
                    <div class="tab-content">
                        <div class="tab-pane active" id="list">
                        <jsp:include page="_list.jsp"/>
                        </div>
                        
                        <div class="tab-pane fade" id="trash">
						<jsp:include page="_trash.jsp"/>
                        </div>
                    </div>
                    	
                </div>
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
											<div class="swal-icon swal-icon--waring">
												<div class="swal-icon--error__x-mark">
												<span
														class="swal-icon--warning__line--dot"></span>
													<span
														class="swal-icon--warning__line--long"></span>
													
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

    </section>
<script>
$('#myModal').modal('show');
$('#myModalfail').modal('show');
$('#myModalerror').modal('show');
</script>
<script>
    $(document).ready(function () {
        $(".nav-tabs a").click(function (e) {
            e.preventDefault()
            $(this).tab('show');
        });
    });
</script>
<script
	src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
<!-- JS tạo nút bấm di chuyển trang end -->

<script>
$(document).on("input", ".numeric", function() {
    this.value = this.value.replace(/\D/g,'');
});

</script>