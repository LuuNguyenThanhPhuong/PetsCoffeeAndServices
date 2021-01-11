<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


    <!--Article-->
    <!--Tiêu Đề Trang-->
    <section class="bread-crumb margin-bottom-10">
            <div class="container">
                <ul class="breadcrumb" itemscope="" itemtype="https://schema.org/BreadcrumbList">
                    <li class="home" itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"> <a itemprop="item" href="/" title="Trang chủ"> <span itemprop="name">Trang chủ</span> <meta itemprop="position" content="1"> </a> </li>
                    <li itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"> <strong itemprop="name">Khách hàng chi tiết</strong>
                        <meta itemprop="position" content="2"> </li>
                </ul>
            </div>
        </section>
        <form action="/admin/qlkhachhang/back" method="post">
        <!--FORM_NV_CT-->
        <div class="container">
            <div class="wrapper">
                <div class="left">
                    <img src="/static/images/photos/${prod.hinh}" 
                    alt="user" width="100">
                    <h4>${prod.tenKhachHang}</h4>
                
                        <i class='fas fa-user-tie' style="font-size: 30px;"></i>
                     <p>INFO-USER</p>
                    
                    
               
                </div>
                <div class="right">
                    <div class="info">
                        <h3>Information</h3>
                        <div class="info_data row">
                             <div class="data">
                                <h4>Mã khách hàng</h4>
                                <p>${prod.maKhachHang}</p>
                             </div>
                             <div class="data">
                               <h4>Tên khách hàng</h4>
                                <p>${prod.tenKhachHang}</p>
                          </div>
                          <div class="data">
                            <h4>Số điện thoại</h4>
                            <p><a href="tel:${prod.soDienThoai}">${prod.soDienThoai}</a></p>
                            
                         </div>
                        </div>

                        <div class="info_data row">
                            <div class="data">
                               <h4>Email</h4>
                               <p><a href="mailto:${prod.email}">${prod.email}</a></p>
                            </div>
                           <div class="data">
                               <h4>CMND</h4>
                               <p>${prod.cmnd}</p>
                            </div>
                              <div class="data">
                              <h4>Địa chỉ</h4>
                               <p>${prod.diaChi}</p>
                               </div>
                            </div>
                            <div class="info_data row">
                         <div class="data">
                           <h4>Ngày sinh</h4>
                           <p><fmt:formatDate value="${prod.ngaySinh}" pattern="dd/MM/yyyy" /></p>
                        </div>
                        <div class="data">
                          <h4>Kích Hoạt Tài Khoản</h4>
                           <p><c:if test="${prod.active eq 'true'}">Đã Kích Hoạt</c:if> 
				<c:if test="${prod.active eq 'false' }">Chưa Kích Hoạt</c:if></p>
                     </div>
                     <div class="data">
                       <h4>Password</h4>
                       <p>${prod.password}</p>
                    </div>
                         </div>

                    </div>
                  
                    <button type="submit" class="btn btn-face">Trở lại</button>
              
                </div>
            </div>
        </div>
        </form>
