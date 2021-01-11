<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script src="/static/js/upload.js"></script>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
		<ul class="breadcrumb" itemscope=""
			itemtype="https://schema.org/BreadcrumbList">
			<li class="home" itemprop="itemListElement" itemscope=""
				itemtype="https://schema.org/ListItem"><a itemprop="item"
				href="/" title="Trang chủ"> <span itemprop="name">Trang
						chủ</span>
					<meta itemprop="position" content="1">
			</a></li>
			<li itemprop="itemListElement" itemscope=""
				itemtype="https://schema.org/ListItem"><strong itemprop="name">Đăng
					ký tài khoản</strong>
				<meta itemprop="position" content="2"></li>
		</ul>
	</div>
</section>
<!--Form_Registere-->
<div class="container margin-bottom-20 margin-top-30">
	<div class="row justify-content-md-center">
		<div class="col-lg-8 col-md-12">
			<div class="page-login account-box-shadow">
				<div id="login" class="row">
					<div
						class="col-lg-6 col-md-6 account-banner order-lg-first order-md-first order-sm-last order-last">
						<div class="banner_login">
							<img src="/static/images/account-banner.jpg" alt="Không hiện ảnh">
						</div>
						<div class="conten_account">
							<div class="account_policy_title">Quyền lợi thành viên</div>
							<div class="account_policy_content">
								<p>
									<i class="fa fa-check-circle"
										style="margin-left: -23px; color: red;"></i> Tour chọn lọc
									chất lượng nhất
								</p>
								<p>
									<i class="fa fa-check-circle"
										style="margin-left: -23px; color: red;"></i> Đội ngũ tư vấn
									chi tiết và tận tình
								</p>
								<p>
									<i class="fa fa-check-circle"
										style="margin-left: -23px; color: red;"></i> Nhận nhiều chương
									trình ưu đãi hấp dẫn từ chúng tôi
								</p>
							</div>
						</div>
					</div>
					<div
						class="col-lg-6 col-md-6 evo-account-content order-lg-last order-md-last order-sm-first order-first">
						<ul class="auth-block__menu-list">
							<li><a href="/account/login" title="Đăng nhập">Đăng nhập</a>
							</li>
							<li class="active"><a href="/account/register"
								title="Đăng ký">Đăng ký</a></li>
						</ul>


						<div id="evo-login" style="display: block;">
							<form:form accept-charset="utf-8" action="/account/register"
								id="customer_register" method="post"
								class="has-validation-callback" modelAttribute="form"
								enctype="multipart/form-data">
								<input name="FormType" type="hidden" value="customer_login">
								<input name="utf8" type="hidden" value="true">
								<div class="form-signup">
									<c:if test="${not empty message }">
										<div
											class="alert alert-${alerts} fade in alert-dismissible show">
											${message}${param.message}
											<button type="button" class="close" data-dismiss="alert"
												aria-label="Close" style="top: -10px;">
												<span aria-hidden="true">×</span>
											</button>
										</div>
									</c:if>
								</div>
								<div class="form-signup clearfix">
									<!--Input_Họ và tên-->
									<fieldset class="form-group margin-bottom-0">
										<label>Họ và tên<span class="required">*</span>
										</label>
										<form:input path="tenKhachHang" autocomplete="off"
											placeholder="Nhập Họ tên" type="text"
											class="form-control form-control-lg" value=""
											name="tenKhachHang" id="customer_name" required="f"
											data-validation-error-msg="Không được để trống"
											data-validation="required" />
									</fieldset>
									<!--Input_Ngày sinh-->
									<fieldset class="form-group margin-bottom-0">
										<label>Ngày sinh<span class="required">*</span>
										</label>
										<form:input path="ngaySinh" autocomplete="off"
											placeholder="Nhập Ngày sinh" type="date"
											class="form-control form-control-lg" value="" name="ngaySinh"
											id="customer_birth" required="f"
											data-validation-error-msg="Không được để trống"
											data-validation="required" />
									</fieldset>
									<!--Input_Điện thoại-->
									<fieldset class="form-group margin-bottom-0">
										<label>Điện thoại<span class="required">*</span>
										</label>
										<form:input path="soDienThoai" autocomplete="off"
											placeholder="Nhập số điện thoại"
											class="form-control form-control-lg numeric" maxlength="11" type="text"  value=""
											name="soDienThoai" id="customer_phone" required="f"
											data-validation-error-msg="Không được để trống"
											data-validation="required" />
											<span id="tb" style="color: red"></span>
									</fieldset>
									<!--Input_Địa chỉ-->
									<fieldset class="form-group margin-bottom-0">
										<label>Địa chỉ<span class="required">*</span>
										</label>
										<form:input path="diaChi" autocomplete="off"
											placeholder="Nhập Địa chỉ" type="text"
											class="form-control form-control-lg" value="" name="diaChi"
											id="customer_address" required="f"
											data-validation-error-msg="Không được để trống"
											data-validation="required" />
									</fieldset>
									<!--Input_CMND-->
									<fieldset class="form-group margin-bottom-0">
										<label>Chứng minh nhân dân<span class="required">*</span>
										</label>
										<form:input path="cmnd" autocomplete="off"
											placeholder="Nhập chứng minh nhân dân" type="text"
											class="form-control form-control-lg numeric" maxlength="11" value="" name="CMND"
											id="customer_CMND" required="f"
											data-validation-error-msg="Không được để trống"
											data-validation="required" />
									</fieldset>
									<!--Input_Email-->
									<fieldset class="form-group margin-bottom-10">
										<label>Email<span class="required">*</span>
										</label>
										<form:input path="email" autocomplete="off"
											placeholder="Nhập Địa chỉ Email" type="email"
											class="form-control form-control-lg" value="" name="email"
											id="customer_email" required="f" data-validation="email"
											pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$"
											data-validation-error-msg="Email sai định dạng" />
									</fieldset>
									<!--Input_Username-->
									<fieldset class="form-group margin-bottom-0">
										<label>Tên Đăng Nhập<span class="required">*</span>
										</label>
										<form:input path="maKhachHang" autocomplete="off"
											placeholder="Nhập Tài Khoản" type="text"
											class="form-control form-control-lg" value=""
											name="maKhachHang" id="customer_taikhoan" required="f"
											data-validation-error-msg="Không được để trống"
											data-validation="required" />
									</fieldset>
									<!--Input_Mật khẩu-->
									<form:hidden path="active" />
									<fieldset class="form-group margin-bottom-0">
										<label>Mật khẩu<span class="required">*</span>
										</label>
										<form:input path="password" autocomplete="off"
											placeholder="Nhập Mật khẩu" type="password"
											class="form-control form-control-lg" value="" name="password"
											id="customer_password" required="f"
											data-validation-error-msg="Không được để trống"
											data-validation="required" />
									</fieldset>

									<fieldset class="form-group margin-bottom-0">
										<label>Photo</label> <input
											onchange="upload.change(this, '#photo_image')" type="file"
											name="photo_file" id="photo_file" class="form-control">
										<form:hidden path="hinh" />
									</fieldset>

									<div class="clearfix"></div>
									<p class="text-right recover">
										<a href="/account/forgot" class="btn-link-style"
											title="Quên mật khẩu?">Quên mật khẩu?</a>
									</p>
									<div class="pull-xs-left text-center" style="margin-top: 15px;">
										<button class="btn btn-style btn-blues" type="submit">Đăng
											kí</button>
									</div>
									<p class="login--notes">
										VietTravel cam kết bảo mật và sẽ không bao giờ đăng <br>hay
										chia sẻ thông tin mà chưa có được sự đồng ý của bạn.
									</p>
								</div>
							</form:form>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<br>
<script>
$(document).on("input", ".numeric", function() {
    this.value = this.value.replace(/\D/g,'');
});
</script>
<script>
	$('#customer_phone').on('change', () => {

			if(Number(customer_phone) > 11 ){
				document.getElementById("tb").innerHTML = "Không được > slk";
				$("#customer_phone").val("");
			}
			
	    });
</script>