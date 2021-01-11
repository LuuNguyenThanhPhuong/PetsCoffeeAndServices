<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="topbar fixed-top">
	<div class="container">
		<div class="row">
			<div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
				<ul class="list-inline">
					<li class="hidden-sm hidden-xs"><span>Chào mừng đến với
							dịch vụ online của chúng tôi!</span></li>
					<li><a href="/cart/index"> <i class="fa fa-heart"></i> Yêu
							thích (<span class="cart-cnt" id="cart-total">0</span>)
					</a></li>
					<c:choose>
						<c:when test="${empty sessionScope.user}">
							<li><a href="/account/login" class="login_btn">Đăng nhập</a>
							</li>
							<li><a href="/account/register" class="register_btn">Đăng
									ký</a></li>

						</c:when>

						<c:otherwise>
							<li><a href="/trangthaitour/index" class="login_btn">Đơn Đã Đặt</a></li>
							<li><a href="/account/logoff" class="register_btn">Đăng
									Xuất</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${!empty sessionScope.admin}">
							<li><a href="/admin/home/index" class="register_btn">Quản
									Trị</a></li>
						</c:when>
					</c:choose>
				</ul>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
				<div class="search f-right">
					<div class="header_search search_form">
						<form class="input-group search-bar search_form"
							action="/tour/list-by-keywords" method="post">
							<input id="tags" type="search" value="${param.keywords}" name="keywords"
								placeholder="Tìm kiếm ... "
								class="input-group-field st-default-search-input search-text"
								autocomplete="off"> <span class="input-group-btn">
								<button class="btn icon-fallback-text">
									<i class="fa fa-search"></i>
								</button>
							</span>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
