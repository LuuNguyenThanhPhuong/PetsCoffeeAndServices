<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="http://js.nicedit.com/nicEdit-latest.js"></script>
<script type="text/javascript">
        bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
  </script>
    <section class="bread-crumb margin-bottom-10">
        <div class="container">
            <ul class="breadcrumb" itemscope="" itemtype="https://schema.org/BreadcrumbList">
                <li class="home" itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"> <a
                        itemprop="item" href="/" title="Trang chủ"> <span itemprop="name">Trang chủ</span>
                        <meta itemprop="position" content="1"> </a> </li>
                <li itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"> <strong
                        itemprop="name">Quản lí Tour</strong>
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
					<li class="active"><a href="#list" data-toggle="tab"
						aria-expanded="true"><i class='fas fa-list-ul'></i> Danh Sách
							TOUR</a></li>
					<li class="undo"><a href="#trash" data-toggle="tab"
						aria-expanded="true"><i class='fas fa-trash-alt'></i> Thùng
							Rác</a></li>
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
				<form action="/admin/qltour/list-by-keywords" method="post"
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
						placeholder="Tìm kiếm theo Tên Tour hoặc Lộ Trình ..."
						type="search" value="${param.keywords}" name="keywords">
				</form>
				<br>
				<c:if test="${not empty tb}">
					<div class="alert alert-${alerts} fade in alert-dismissible show">
						${tb}
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close" style="top: -10px;">
							<span aria-hidden="true">×</span>
						</button>
					</div>
				</c:if>
			</div>
               <div class="col-md-6">
                         <a href="/admin/qltour/index" class="btn reply-all "><i class="fas fa-reply-all"></i> Page reset</a>
                    <button type="button" data-toggle="collapse" data-toggle="tooltip" title="Hooray!" data-target="#demo" class="btn save1 "><i class="fa fa-save"></i> Thêm mới Tour</button>
                   

                </div>
			<!--Form_input-->
			<section>
				<form:form class="${botay}" id="demo" action="/admin/qltour/index"
					modelAttribute="form" enctype="multipart/form-data">
					<div class="container">
						<div class="row">
							<div class="col-md-12" style="margin-bottom: 45px">
								<div class="box_info_account" style="height: 100%; ">
									<div class="my_info_account_header">
										<h3>QUẢN LÝ TOUR </h3>
										<h4>Quản lý thông tin hồ sơ, bảo mật tài khoản</h4>
										<div data-toggle="collapse" data-target="#demo"
											class="close_form">
											<i class="fa fa-window-close" aria-hidden="true"></i>
										</div>
									</div>
									<!--Form-->

									<form:hidden path="maTour" />
									<form:hidden path="isDelete" />
									<div class="form_info_update">
										<div class="form-group col-md-4">
											<label class=" control-label">Tên tour:</label>
											<div class="">
												<form:input path="tenTour" class="form-control" required="f"
													placeholder="Tên Tour" name="lh_name" type="text" />
											</div>
										</div>
										<div class="form-group col-md-4">
											<label class=" control-label">Gía tour:</label>
											<div class="">
												<form:input path="giaTour" class="form-control numeric" required="f"
													placeholder="Giá Tour" name="lh_name" type="text" inputmode="numric" />
											</div>
										</div>
										<div class="form-group col-md-4">
											<label class=" control-label">Nơi Khởi Hành:</label>
											<div class="">
												<form:input path="noiKhoiHanh" class="form-control" required="f"
													placeholder="Lộ Trình" name="lh_name" type="text" />
											</div>
										</div>
										<div class="form-group col-md-4">
											<label class=" control-label">Số lượng khách:</label>
											<div class="">
												<form:input id="slk" path="soLuongKhach" class="form-control numeric"
													required="f" placeholder="Số Lượng khách" name="lh_name"
													type="number" />
													
											</div>
										</div>
										<div class="form-group col-md-4">
											<label class=" control-label">Ngày đi: <span id="ngaydimsg" style="color: red"></span></label>
											<div class="">
												<form:input path="ngayDi" class="form-control" required="f" type="datetime-local"
													id="ngaydi" placeholder="Ngày đi" name="lh_name" />
											</div>
										</div>
										<div class="form-group col-md-4">
											<label class=" control-label">Ngày Về: <span id="ngayvemsg" style="color: red"></span></label>
											<div class="">
												<form:input path="ngayVe" class="form-control" required="f" type="datetime-local"
													id="ngayve" placeholder="Ngày về" name="lh_name" />
											</div>
										</div>
										<div class="form-group col-md-4">
											<label class=" control-label">Số Lượng Khách Đã Đặt : <span id="slkhach" style="color: red"></span></label>
											<div class="">
												<form:input id="sldd" path="soLuongDaDat" class="form-control numeric"
													required="f" placeholder="Số khách đã đặt" name="lh_name" type="number"/>
											
											</div>
										</div>
							
											<div class="form-group col-md-4">
											<label class=" control-label">Loại Tour:</label>
											<div class="">
												<form:select path="loaiTour.idLoaiTour" class="form-control"
													id="exampleFormControlSelect1">
													<option>Chọn Loại Tour</option>
													<c:forEach var="p" items="${prod}">
														<form:option path="loaiTour.idLoaiTour"
															value="${p.idLoaiTour}">${p.tenLoaiTour}</form:option>
													</c:forEach>
												</form:select>
											</div>
										</div>
												<div class="form-group col-md-4">
											<label class=" control-label">Link video:</label>
											<div class="">
												<form:input path="video" class="form-control" required=""
													placeholder="Video" name="lh_name" type="text" />
											</div>
										</div>
										
										<div class="col-md-7 row" style="border: 1px solid #ccc;margin-left: 16px;padding-left: 0; padding-right: 34px;border-right: none;">
													<div class="col-md-12" style="text-align: center;">
											<label class=" control-label" style="padding-top: 15px">Ảnh Tour:</label>
									
										</div>
												<div class="form-group col-md-6 ">
										
											<div class="">
												<input  
													type="file" name="hinh_file"
													class="form-control"/>
												<form:hidden path="hinh" />
											</div>
										</div>
													<div class="form-group col-md-6">
										
											<div class="">
												<input 
													type="file" name="hinh1_file"
													class="form-control">
												<form:hidden path="hinh1" />
											</div>
										</div>
														<div class="form-group col-md-6 ">
										
											<div class="">
												<input  
													type="file" name="hinh2_file"
													class="form-control">
												<form:hidden path="hinh2" />
											</div>
										</div>
														<div class="form-group col-md-6">
										
											<div class="">
												<input  
													type="file" name="hinh3_file"
													class="form-control">
												<form:hidden path="hinh3" />
											</div>
										</div>		
								</div>
									<div class="col-md-5 row" style="float: right;border: 1px solid #ccc;margin-right: 14px;padding-right: 0px;padding-left: 0px; ">
												<div class="col-md-12" style="text-align: center;">
											<label class=" control-label" style="padding-top: 15px">Phương tiện:</label>
									
										</div>
											<div class="form-group col-md-6">
										
											<div class="">
												<form:select path="phuongTien"
													id="exampleFormControlSelect1" class="form-control">
													<form:option value="">Chọn Phương Tiện</form:option>
													<form:option value="Máy Bay">Máy Bay</form:option>
													<form:option value="Xe khách">Xe khách</form:option>
													<form:option value="Xe đạp">Xe đạp</form:option>
													<form:option value="Thuyền KAYAK">Thuyền KAYAK</form:option>
													<form:option value="Xích lô">Xích lô</form:option>
													<form:option value="Phà">Phà</form:option>
													<form:option value="Tàu Thủy">Tàu Thủy</form:option>
													<form:option value="Cáp treo">Cáp treo</form:option>
													<form:option value="Ô Tô Điện">Ô Tô Điện</form:option>
												</form:select>
											</div>
										</div>
												<div class="form-group col-md-6">
										
											<div class="">
												<form:select path="phuongTien1"
													id="exampleFormControlSelect1" class="form-control">
													<form:option value="">Chọn Phương Tiện</form:option>
													<form:option value="Máy Bay">Máy Bay</form:option>
													<form:option value="Xe khách">Xe khách</form:option>
													<form:option value="Xe đạp">Xe đạp</form:option>
													<form:option value="Thuyền KAYAK">Thuyền KAYAK</form:option>
													<form:option value="Xích lô">Xích lô</form:option>
													<form:option value="Phà">Phà</form:option>
													<form:option value="Tàu Thủy">Tàu Thủy</form:option>
													<form:option value="Cáp treo">Cáp treo</form:option>
													<form:option value="Ô Tô Điện">Ô Tô Điện</form:option>
												</form:select>
											</div>
										</div>
												<div class="form-group col-md-6">
											
											<div class="">
												<form:select path="phuongTien2"
													id="exampleFormControlSelect1" class="form-control">
													<form:option value="">Chọn Phương Tiện</form:option>
													<form:option value="Máy Bay">Máy Bay</form:option>
													<form:option value="Xe khách">Xe khách</form:option>
													<form:option value="Xe đạp">Xe đạp</form:option>
													<form:option value="Thuyền KAYAK">Thuyền KAYAK</form:option>
													<form:option value="Xích lô">Xích lô</form:option>
													<form:option value="Phà">Phà</form:option>
													<form:option value="Tàu Thủy">Tàu Thủy</form:option>
													<form:option value="Cáp treo">Cáp treo</form:option>
													<form:option value="Ô Tô Điện">Ô Tô Điện</form:option>
												</form:select>
											</div>
										</div>
									</div>
								
								<div class="form-group col-md-12" style="margin-top: 20px">
											<label class=" control-label">Giảm Giá:</label> <span id="spangg" style="color: red"></span>

											<div class="">
												<form:input id="slgg" path="giamGia" class="form-control numeric"
													required="f" placeholder="Giảm giá" name="lh_name" type="number"/>
											
											</div>

										</div>
										
							
								
										<div class="form-group col-md-12" style="margin-top: 20px">
											<label class=" control-label">Mô tả:</label>

											<form:textarea path="moTa" name="area2"
												style="width: 1060px; max-width: 100%; height: 150px; outline: none;"
												placeholder="Mô Tả" />

										</div>
										<div class="form-group row">
											<form:button formaction="/admin/qltour/create"
												class="btn save text-uppercase"
												disabled="${!empty form.maTour}" id="c">
												<i class="fa fa-save"></i> Save</form:button>
											<form:button formaction="/admin/qltour/update"
												class="btn update text-uppercase"
												disabled="${empty form.maTour}" id="u"> 
												<i class="fa fa-edit"></i> Update</form:button>
											<a href="/admin/qltour/index"
												class="btn refresh text-uppercase"><i
												class="fa fa-refresh fa-spin"></i> refresh</a>
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
					<div class="tab-pane active" id="list">
						<jsp:include page="_list.jsp" />
					</div>


					<div class="tab-pane fade" id="trash">
						<jsp:include page="_trash.jsp" />
						
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
$(function(){
	$(".datetimepicker").datetimepicker({dateFormat: "'dd/mm/yy' 'HH:mm'"})
})
</script>
<script>
    $(document).ready(function () {
        $(".nav-tabs a").click(function (e) {
            e.preventDefault()
            $(this).tab('show');
        });
    });
</script>
<!-- <script>
    if ( window.history.replaceState ) {
        window.history.replaceState( null, null, window.location.href );
    }
</script> -->
<script
	src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
<!-- JS tạo nút bấm di chuyển trang end -->
<script>
$(document).on("input", ".numeric", function() {
    this.value = this.value.replace(/\D/g,'');
});
</script>
<script>
	$('#sldd').on('change', () => {
			var slk = $('#slk').val(); 
			var sldd = $('#sldd').val(); 
			if(Number(sldd) > Number(slk) ){
				document.getElementById("slkhach").innerHTML = "Không được > slk";
				$("#sldd").val("");
			}
			else{
				document.getElementById("slkhach").innerHTML = "";
			}
			
	    });
	$('#slgg').on('change', () => {
		var giamgia = $('#slgg').val(); 
		if(Number(giamgia) >= 100 ){
			document.getElementById("spangg").innerHTML = "Chỉ được giảm giá đến 99%";
			$("#slgg").val("");
		}else{
			document.getElementById("spangg").innerHTML = "";
		}
		
    });
	
    $("#ngaydi").change(function () {
	    var ngaydi = document.getElementById("ngaydi").value;
	    var ngayve = document.getElementById("ngayve").value;
	    var today = new Date();
	    
	    if ((Date.parse(ngaydi) <= Date.parse(today))) {
	        document.getElementById("ngaydimsg").innerHTML = "Ngày Đi > Hôm Nay";
	        $("#ngaydi").val("");
	    }else if ((Date.parse(ngayve) <= Date.parse(ngaydi))) {
	        document.getElementById("ngayvemsg").innerHTML = "Ngày Về > Ngày Đi";
	        $("#ngayve").val("");
	    }else if ((Date.parse(ngayve) <= Date.parse(today))) {
	        document.getElementById("ngayvemsg").innerHTML = "Ngày Về > Hôm Nay";
	        $("#ngayve").val("");
	    }else{
	    	document.getElementById("ngaydimsg").innerHTML = "";
	    	document.getElementById("ngayvemsg").innerHTML = "";
	    }
	}); 
    $("#ngayve").change(function () {
	    var ngaydi = document.getElementById("ngaydi").value;
	    var ngayve = document.getElementById("ngayve").value;
	    var today = new Date();
	    
	    if ((Date.parse(ngaydi) <= Date.parse(today))) {
	        document.getElementById("ngaydimsg").innerHTML = "Ngày Đi > Hôm Nay";
	        $("#ngaydi").val("");
	    }else if ((Date.parse(ngayve) <= Date.parse(ngaydi))) {
	        document.getElementById("ngayvemsg").innerHTML = "Ngày Về > Ngày Đi";
	        $("#ngayve").val("");
	    }else if ((Date.parse(ngayve) <= Date.parse(today))) {
	        document.getElementById("ngayvemsg").innerHTML = "Ngày Về > Hôm Nay";
	        $("#ngayve").val("");
	    }else{
	    	document.getElementById("ngaydimsg").innerHTML = "";
	    	document.getElementById("ngayvemsg").innerHTML = "";
	    }
	}); 
</script>