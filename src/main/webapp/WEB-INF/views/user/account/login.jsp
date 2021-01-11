<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
					nhập tài khoản</strong>
				<meta itemprop="position" content="2"></li>
		</ul>
	</div>
</section>
<!--Form_Login-->
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
							<li class="active"><a href="/account/login" title="Đăng nhập">Đăng
									nhập</a></li>
							<li><a href="/account/register" title="Đăng ký">Đăng ký</a>
							</li>
						</ul>

						<div id="evo-login" style="display: block;">
							<form action="/account/login" id="customer_login" method="post"
								class="has-validation-callback">
								<input name="FormType" type="hidden" value="customer_login">
								<input name="utf8" type="hidden" value="true">
								<div class="form-signup">
									<c:if test="${not empty message }">
										<div
											class="alert alert-${alerts} fade in alert-dismissible show">
											${message}
											<button type="button" class="close" data-dismiss="alert"
												aria-label="Close" style="top: -10px;">
												<span aria-hidden="true">×</span>
											</button>
										</div>
									</c:if>
								</div>
								<div class="form-signup clearfix">
									<fieldset class="form-group margin-bottom-10">
										<label>Tài Khoản<span class="required">*</span></label> <input
											autocomplete="off" value="${map.maKhachHang}"
											placeholder="Nhập tài khoản" type="text"
											class="form-control form-control-lg" value=""
											name="maKhachHang" id="customer_taikhoan" required="">
									</fieldset>
									<fieldset class="form-group margin-bottom-0">
										<label>Mật khẩu<span class="required">*</span></label> <input
											autocomplete="off" value="${map.password}"
											placeholder="Nhập Mật khẩu" type="password"
											class="form-control form-control-lg" value="" name="password"
											id="customer_password"
											data-validation-error-msg="Không được để trống"
											data-validation="required">
									</fieldset>
									<div class="clearfix"></div>
									<p class="text-right recover">
									<div class="form-group">
										<div class="form-control">
											<label class="checkbox-inline"> <input
												type="checkbox" name="remember" value="true">Remember
												me?
											</label>
										</div>
									</div>
									<a href="/admin/account/login" class="btn-link-style"
										title="login admin">Đăng Nhập Bằng Tài Khoản Nhân Viên</a>
									<hr>
									<a href="/account/forgot" class="btn-link-style"
										title="Quên mật khẩu?">Quên mật khẩu?</a>
									<div class="pull-xs-left text-center" style="margin-top: 15px;">
										<button class="btn btn-style btn-blues" type="submit"
											value="Đăng nhập">Đăng nhập</button>
									</div>
									<p class="login--notes">
										VietTravel cam kết bảo mật và sẽ không bao giờ đăng <br>hay
										chia sẻ thông tin mà chưa có được sự đồng ý của bạn.
									</p>
								</div>
							</form>
							<div class="clearfix"></div>
						</div>
						
							<!-- Modal -->
							<div class="modal" id="myModal" data-backdrop="static"
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
											<div class="swal-title">
											${message}
											</div>
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
							
							<!-- Modal active-->
							<div class="modal" id="myModala" data-backdrop="static"
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
											<div class="swal-title">${messageactive}</div>
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


<script type="text/javascript">
$('#myModal').modal('${modal}');
</script>
<script type="text/javascript">
$('#myModala').modal('${modalactive}');
</script>