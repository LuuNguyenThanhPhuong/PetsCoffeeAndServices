<%@ page pageEncoding="utf-8"%>
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
                <ul class="breadcrumb" itemscope="" itemtype="https://schema.org/BreadcrumbList">
                    <li class="home" itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"> <a itemprop="item" href="/" title="Trang chủ"> <span itemprop="name">Trang chủ</span> <meta itemprop="position" content="1"> </a> </li>
                    <li itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"> <strong itemprop="name">Đăng nhập tài khoản</strong>
                        <meta itemprop="position" content="2"> </li>
                </ul>
            </div>
        </section>
        <!--Form_Login-->
    <div class="container margin-bottom-20 margin-top-30">
            <div class="row justify-content-md-center">
                <div class="col-lg-8 col-md-12">
                    <div class="page-login account-box-shadow">
                        <div id="login" class="row">
                            <div class="col-lg-6 col-md-6 account-banner order-lg-first order-md-first order-sm-last order-last">
                                    <div class="banner_login">
                                            <img src="/static/images/account-banner.jpg" alt="Không hiện ảnh">
                                        </div>
                                        <div class="conten_account" >
                                <div class="account_policy_title">Quyền lợi thành viên</div>                     
                                <div class="account_policy_content">
                                    <p><i class="fa fa-check-circle" style="margin-left:-23px;color:red;"></i>  Tour chọn lọc chất lượng nhất</p>
                                    <p><i class="fa fa-check-circle" style="margin-left:-23px;color:red;"></i>  Đội ngũ tư vấn chi tiết và tận tình</p>
                                    <p><i class="fa fa-check-circle" style="margin-left:-23px;color:red;"></i>  Nhận nhiều chương trình ưu đãi hấp dẫn từ chúng tôi</p>
                                </div>
                                        </div>
                            </div>
                            
                            <div class="col-lg-6 col-md-6 evo-account-content order-lg-last order-md-last order-sm-first order-first">
                                <ul class="auth-block__menu-list">
                                    <li class="active"> <a href="" title="Đổi mật khẩu">Đổi mật khẩu</a> </li>                               
                                </ul>
                                <div id="recover-password" class="form-signup">
                                    <div class="fix-sblock text-center"> Bạn muốn đổi mật khẩu vui lòng nhập các trường để đổi mật khẩu. </div>
                                    <form accept-charset="utf-8" action="/account/change" id="recover_customer_password" method="post" class="has-validation-callback"> <input name="FormType" type="hidden" value="recover_customer_password"> <input name="utf8" type="hidden" value="true">
                                        <div class="form-signup aaaaaaaa"> 
                <c:if test="${not empty message }">
                <div class="alert alert-${alerts} fade in alert-dismissible show" >
                ${message}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close" style="top: -10px;">
                <span aria-hidden="true" >×</span>
 				 </button>
                </div>
                </c:if></div>
                                        <div class="form-signup clearfix">
                                            <fieldset class="form-group margin-bottom-10"> <label>User name<span class="required">*</span></label> <input autocomplete="off" placeholder="Nhập User Name" type="text" class="form-control form-control-lg" value="" name="maKhachHang" id="customer_user" required=""
                                                data-validation="maKhachHang" data-validation-error-msg="User Name không tồn tại"> </fieldset>
                                                <fieldset class="form-group margin-bottom-10">
                                                    <label>OLD password<span class="required">*</span>
                                                    </label> <input autocomplete="off" placeholder="Nhập Mật khẩu"
                                                        type="password" class="form-control form-control-lg" value=""
                                                        name="password" id="customer_password"
                                                        data-validation-error-msg="Không được để trống"
                                                        data-validation="required" required="">
                                                </fieldset>
                                                <fieldset class="form-group margin-bottom-10">
                                                    <label>new password<span class="required">*</span>
                                                    </label> <input autocomplete="off" placeholder="Nhập Mật khẩu Mới"
                                                        type="password" class="form-control form-control-lg" value=""
                                                        name="newpwd" id="customer_password"
                                                        data-validation-error-msg="Không được để trống"
                                                        data-validation="required" required="">
                                                </fieldset>
                                                <fieldset class="form-group margin-bottom-10">
                                                    <label>conform password<span class="required">*</span>
                                                    </label> <input autocomplete="off" placeholder="Nhập Lại Mật khẩu Mới"
                                                        type="password" class="form-control form-control-lg" value=""
                                                        name="confirm" id="customer_password"
                                                        data-validation-error-msg="Không được để trống"
                                                        data-validation="required" required="">
                                                </fieldset>
   
                                        </div>
                                        <div class="action_bottom text-center"> <button class="btn btn-style btn-blues" style="margin-top: 10px;" type="submit" value="Lấy lại mật khẩu">Đổi mật khẩu</button> </div>
                                        <div class="text-login text-center">
                                            <p>Về Trang Chủ <a href="/home/index" title="Quay lại">tại đây.</a></p>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <br>