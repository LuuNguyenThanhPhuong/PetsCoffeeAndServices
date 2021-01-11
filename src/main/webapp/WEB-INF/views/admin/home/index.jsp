<%@ page  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
        <section class="section_slider" style="background-color: #d8f1ff;">
            <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="/static/images/free-business-travel-background-vector.webp" style="margin-left: 25%;" alt="...">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </section>
    <!--Article-->
    <!--Tiêu Đề Trang-->
    <div class="n3-form-search">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="frame-search">
                    <c:choose>
						<c:when test="${!empty sessionScope.admin}">
						<c:if test="${sessionScope.admin.getVaiTro() eq true}">   
                        <div class="o-dl dltn">
                            <a href="/admin/qlnhanvien/index"><i class="iconT-i-c1 mg-b"><img src="/static/images/technical-support.png" alt="QLNV"></i>
                            <p class="text1">Quản lí</p>
                            <p class="text2 text-dltn">NHÂN VIÊN</p>
                            </a>
                        </div>
                         </c:if>
                        <div class="o-dl dltn">
                         <a href="/admin/qlkhachhang/index">   <i class="iconT-i-c1 mg-b"><img src="/static/images/target.png" alt="QLKH"></i>
                            <p class="text1">Quản lí</p>
                            <p class="text2 text-dltn">KHÁCH HÀNG</p>
                         </a>
                        </div>

                        <div class="o-dl dltn">
                            <a href="/admin/qlloaitour/index"><i class="iconT-i-c1 mg-b"><img src="/static/images/loaitour.png" alt="QLĐT"></i>
                            <p class="text1">Quản lí</p>
                            <p class="text2 text-dltn">LOẠI TOUR</p>
                            </a>
                        </div>
                        <div class="o-dl dltn">
                           <a href="/admin/qltour/index"> <i class="iconT-i-c1 mg-b"><img src="/static/images/pin.png" alt="QLT"></i>
                            <p class="text1">Quản lí</p>
                            <p class="text2 text-dltn">TOUR</p>
                            </a>
                        </div>
                        <c:if test="${sessionScope.admin.getVaiTro() eq true}">
                        <div class="o-dl dltn">
                            <a href="/admin/qldontour/index"><i class="iconT-i-c1 mg-b"><img src="/static/images/document.png" alt="QLĐT"></i>
                            <p class="text1">Quản lí</p>
                            <p class="text2 text-dltn">ĐƠN TOUR</p>
                            </a>
                        </div>
                        </c:if>
                        <c:if test="${sessionScope.admin.getVaiTro() eq true}"> 
                        <div class="o-dl dltn">
                            <a href="/admin/thongke/index"><i class="iconT-i-c1 mg-b"><img src="/static/images/analytics.png" alt="QLTK"></i>
                            <p class="text1">Quản lí</p>
                            <p class="text2 text-dltn">THỐNG KÊ</p>
                            </a>
                        </div>
                        </c:if>
                        <c:if test="${sessionScope.admin.getVaiTro() eq false}"> 
                        <div class="o-dl dltn">
                            <a href="/person/dontour/index"><i class="iconT-i-c1 mg-b"><img src="/static/images/document.png" alt="QLĐT"></i>
                            <p class="text1">Quản lí</p>
                            <p class="text2 text-dltn">Đơn Tour</p>
                            </a>
                        </div>
                        </c:if>
                         </c:when>
						<c:otherwise>

						</c:otherwise>

</c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
