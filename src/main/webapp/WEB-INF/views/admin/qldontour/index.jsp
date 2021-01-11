<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!--Menu_Tab-->
        <section class="bread-crumb margin-bottom-10">
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
    </section>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="tab_QL">
                    <ul class="nav nav-tabs myTab">
                        <!--Trạng Thái-->
                        <li class="active question" >
                            <a href="#chuaduyet" data-toggle="tab" aria-expanded="true"><i class='far fa-question-circle'></i>
                               Chưa Duyệt</a>
                        </li>
                        <li class="check">
                            <a href="#daduyet" data-toggle="tab" aria-expanded="true"><i class='far fa-check-circle'></i>
                               Đã Duyệt</a>
                        </li>
                        <li class="close1">
                            <a href="#dahuy" data-toggle="tab" aria-expanded="true"><i class="fa fa-close"></i>
                               Đã Hủy</a>
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
                    <form  action="/admin/qldontour/list-by-keywords" method="post" class="purchase-list-page__search-bar purchase-list-page__search-bar-focus">
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
                        </svg><input  autocomplete="off" placeholder="Tìm kiếm theo Tour hoặc tên khách hàng, tên nhân viên ..."
                             type="search" value="${param.keywords}" name="keywords">
                    </form>
                    <br>
			<c:if test="${not empty tb}">
	<div class="toast" data-autohide="false" style="max-width: 500px">
		<div class="toast-header">
			<strong class="mr-auto text-primary" style="font-size: 17px">
				${tb} </strong>
			<button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
		</div>
	</div>
</c:if>
                </div>
                
                                <!--Form_input-->
                <section>
                <form:form class="${botay}" id="demo" action="/admin/qldontour/index" modelAttribute="form">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="box_info_account">
                                    <div class="my_info_account_header">
                                        <h3>QUẢN LÝ ĐƠN TOUR </h3>
                                        <h4>Quản lý thông tin hồ sơ, bảo mật tài khoản</h4>
                      <div data-toggle="collapse" data-target="#demo" class="close_form" aria-expanded="true"><i class="fa fa-window-close" aria-hidden="true"></i></div>                  
                                    </div>
                                    <!--Form-->
                                    	<form:hidden path="tour.maTour"/> 
                                    	<form:hidden path="maDonTour"/> 
                                    	<form:hidden path="tinhTrang"/> 
                                    <div class="form_info_update">
                                        <div class="form-group col-md-6">
                                            <label class=" control-label">Tên tour:</label>
                                            <div class="">
												<form:select path="tour.maTour" class="form-control"
													id="exampleFormControlSelect1">
													<c:forEach var="k" items="${tour}">
														<form:option path="tour.maTour" value="${k.maTour}">${k.tenTour}</form:option>
													</c:forEach>
												</form:select>
											</div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label class=" control-label">Ngày đặt:</label>
                                            <div class="">
                                                <form:input path="ngayDat" class="form-control" required="f" placeholder="Date Set"
                                                    name="lh_name" readonly="true"/>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label class=" control-label">Số lượng khách:</label>
                                            <div class="">
                                                <form:input path="soLuongKhach" class="form-control numeric" required="f" placeholder="Số lượng khách"
                                                    name="lh_name" type="number"/>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label class=" control-label">Gía tour:</label>
                                            <div class="">
                                                <form:input path="giaTour" class="form-control numeric" required="f"
													placeholder="Giá Tour" name="lh_name" type="text" inputmode="numric" />
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label class=" control-label">Tên khách hàng:</label>
                                            <div class="">
												<form:select path="khachHang.maKhachHang"
													class="form-control" id="exampleFormControlSelect1">
													<c:forEach var="k" items="${khachhang}">
														<form:option path="khachHang.maKhachHang"
															value="${k.maKhachHang}">${k.tenKhachHang}</form:option>
													</c:forEach>
												</form:select>
											</div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label class=" control-label">Tên nhân viên:</label>
                                            <div class="">
												<form:select path="nhanVien.maNhanVien" class="form-control"
													id="exampleFormControlSelect1">
													<c:forEach var="n" items="${nhanvien}">
														<form:option path="nhanVien.maNhanVien"
															value="${n.maNhanVien}">${n.tenNhanVien}</form:option>
													</c:forEach>
												</form:select>
											</div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label class=" control-label">Trạng thái thanh toán:</label>
                                            <div class="">
												<form:radiobutton path="trangThaiThanhToan" value="true"
													label=" Đã Thanh Toán" />
												<form:radiobutton path="trangThaiThanhToan" value="false"
													label=" Chưa Thanh Toán" />
											</div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label class=" control-label">Trạng thái duyệt đơn:</label>
                                            <div class="">
												<form:radiobutton path="trangThaiDuyetDon" value="-1"
													label=" Đã Hủy" />
												<form:radiobutton path="trangThaiDuyetDon" value="0"
													label=" Chưa Duyệt" />
												<form:radiobutton path="trangThaiDuyetDon" value="1"
													label=" Đã Duyệt" />
											</div>
                                        </div>
                                        <div class="form-group col-md-12">
                                            <label class=" control-label">Ghi Chú:</label>

                                            <form:textarea path="ghiChu" name="area2"
                                                style="width: 1060px; max-width: 100%; height: 150px; outline: none;"
                                                placeholder="Describe"></form:textarea>

                                        </div>
                                        <div class="form-group row">
                                            <form:button formaction="/admin/qldontour/update" class="btn update text-uppercase" disabled="${empty form.maDonTour}"><i class="fa fa-edit"></i>
                                                Update</form:button>
                                            <a href="/admin/qldontour/index" class="btn refresh text-uppercase"><i
                                                    class="fa fa-refresh fa-spin"></i>
                                                refresh</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </form:form>
                </section>
                                <!--Table-->
                <div class="col-md-12">
                    <div class="tab-content">
                        <div class="tab-pane active" id="chuaduyet">
                        <jsp:include page="_chuaduyet.jsp"/>
                        </div>

					<div class="tab-pane fade" id="daduyet">
						<jsp:include page="_daduyet.jsp" />
					</div>

					<div class="tab-pane fade" id="dahuy">
						<jsp:include page="_dahuy.jsp" />
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
<script type="text/javascript">
$(function(){
	$(".datepicker").datepicker({dateFormat: 'dd/mm/yy  HH:mm:ss'})
})
</script>
<script
	src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
<script>
    $(document).ready(function () {
        $(".nav-tabs a").click(function (e) {
            e.preventDefault()
            $(this).tab('show');
        });
    });
</script>
<script>
$(document).on("input", ".numeric", function() {
    this.value = this.value.replace(/\D/g,'');
});
</script>