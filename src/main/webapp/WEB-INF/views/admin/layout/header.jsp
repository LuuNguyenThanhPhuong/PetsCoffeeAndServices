<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
 <div class="topbar fixed-top">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <ul class="list-inline">
                                    <li class="hidden-sm hidden-xs">
                                        <span>Chào mừng bạn đến với trang quản trị trực tuyến của chúng tôi !</span>
                                    </li>
                                    <li>
                                        <a">
                                         <span>Tài Khoản: </span>   ${empty sessionScope.admin?'': sessionScope.admin.maNhanVien}
                                        </a>
                                    </li>
                                   <c:choose>
										<c:when test="${empty sessionScope.admin}">
                                    <li>
                                        <a href="/admin/account/login" class="login_btn">Đăng nhập</a>
                                    </li>
                                    <li>
                                        <a href="/admin/account/forgot" class="register_btn">Quên Mật Khẩu</a>
                                    </li>   
                                   <li>
                                        <a href="/home/index" class="register_btn">Trang Chủ Dành Cho Khách Hàng</a>
                                    </li> 
</c:when>

<c:otherwise>
                                    <li>
                                        <a href="/admin/account/edit" class="login_btn">Cập Nhập Tài Khoản</a>
                                    </li>
                                    <li>
                                        <a href="/admin/account/logoff" class="register_btn">Đăng Xuất</a>
                                    </li> 
</c:otherwise>
</c:choose>
                                        
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>