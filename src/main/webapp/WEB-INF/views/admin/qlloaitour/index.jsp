
<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>


<c:set var="ctrl" value="/admin/qlloaitour" scope="request"/>
    <section class="bread-crumb margin-bottom-10">
        <div class="container">
            <ul class="breadcrumb" itemscope="" itemtype="https://schema.org/BreadcrumbList">
                <li class="home" itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"> <a
                        itemprop="item" href="/" title="Trang chủ"> <span itemprop="name">Trang chủ</span>
                        <meta itemprop="position" content="1"> </a> </li>
                <li itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"> <strong
                        itemprop="name">Quản lí loại Tour</strong>
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
                                Danh Sách Loại Tour</a>
                        </li>

                    </ul>

                </div>
                <br>
            </div>
                           <div class="col-md-6">
                         <a href="/admin/qlloaitour/index" class="btn reply-all "><i class="fas fa-reply-all"></i> Page reset</a>
                    <button type="button" data-toggle="collapse" data-toggle="tooltip" title="Hooray!" data-target="#demo" class="btn save1 "><i class="fa fa-save"></i> Thêm mới loại Tour</button>
                   

                </div>
        </div>
    </div>
    
        <section class="form_QT">
         <div class="container">
            <div class="row">
                    <!--Form_input-->
                <section>
                <form:form class="${botay}" id="demo" action="${ctrl}/index" modelAttribute="form">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="box_info_account">
                                    <div class="my_info_account_header">
                                        <h3>QUẢN LÝ LOẠI TOUR </h3>
                                        <h4>Quản lý thông tin hồ sơ, bảo mật tài khoản</h4>
                                          <div data-toggle="collapse" data-target="#demo" class="close_form" aria-expanded="true"><i class="fa fa-window-close" aria-hidden="true"></i></div>                  
                                    </div>
                                    <!--Form-->
                                    <div class="form_info_update">
                                        <div class="form-group col-md-6">
                                            <label class=" control-label">Mã loại tour:</label>
                                            <div class="">
                                                <form:input path="idLoaiTour" class="form-control" required="f" placeholder="Mã Loại Tour" name="lh_name" type="text"/>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label class=" control-label">Tên loại tour:</label>
                                            <div class="">
                                                <form:input path="tenLoaiTour" class="form-control" required="f" placeholder="Full Name " name="lh_name"
                                                    type="text"/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <form:button formaction="/admin/qlloaitour/create" class="btn save text-uppercase" disabled="${!empty form.idLoaiTour}"><i class="fa fa-save"></i> Save</form:button>
                                            <form:button formaction="/admin/qlloaitour/update" class="btn update text-uppercase" disabled="${empty form.idLoaiTour}"><i class="fa fa-edit"></i> Update</form:button>
                                            <a href="${ctrl}/index" class="btn refresh text-uppercase"><i class="fa fa-refresh fa-spin"></i> refresh</a>
            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </form:form>
                    </section>
   <div class="col-md-12">
	<div class="tab-content">
		<div id="list" class="tab-pane active">
		<div class="tab-pane active" id="customer">
			<jsp:include page="_list.jsp" />
			</div>
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