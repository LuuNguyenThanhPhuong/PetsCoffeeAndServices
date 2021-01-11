<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <!--Article-->
    <!--Tiêu Đề Trang-->
    <section class="bread-crumb margin-bottom-10">
        <div class="container">
            <ul class="breadcrumb" itemscope="" itemtype="https://schema.org/BreadcrumbList">
                <li class="home" itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"> <a
                        itemprop="item" href="/" title="Trang chủ"> <span itemprop="name">Trang chủ</span>
                        <meta itemprop="position" content="1"> </a> </li>
                <li itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"> <strong
                        itemprop="name">Chi tiết đơn Tour</strong>
                    <meta itemprop="position" content="2">
                </li>
            </ul>
        </div>
    </section>
    <!--Form_Information-->
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <table class="Oesya">
                    <thead>
                        <tr>
                            <th><b>Mã Đơn Tour: ${prod.maDonTour} </b></th>
                            <th>Số Lượng Khách</th>
                            <th>Trạng Thái Thanh Toán</th>
                            <th>Trạng Thái Duyệt Đơn</th>
                            <th>Tổng Tiền</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <div class="product-item"><img src="/static/images/tour/${prod.tour.hinh}" alt="chưa có hình">
                                    <div class="product-info"><a class="product-name" href="/tour/detail/${prod.tour.maTour}">${prod.tour.tenTour}</a>
                                        <p class="product-sku">Ngày Đặt: <a href=""><fmt:formatDate value="${prod.ngayDat}" pattern="dd/MM/yyyy'  'HH:mm:ss"/></a></p>
                                        <p class="product-sku">Khách Hàng: <a style="color: #337ab7; " href="/admin/qlkhachhang/seeDetail/${prod.khachHang.maKhachHang}">${prod.khachHang.tenKhachHang}</a></p>
                                        <p class="product-sku">Ngày Đi: <a href=""><fmt:formatDate value="${prod.tour.ngayDi}" pattern="dd/MM/yyyy'  'HH:mm:ss"/></a></p>
                                        <div class="product-review">
                                            <a class="back" href="/person/dontour/back">Quay lại</a>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td class="price">${prod.soLuongKhach}</td>
                            <td class="quantity">
                            <c:if test="${prod.trangThaiThanhToan eq 'true'}">
						<label class="label label-primary">Đã Thanh Toán</label>
					</c:if> <c:if test="${prod.trangThaiThanhToan eq 'false' }">
						<label class="label label-warning">Chưa Thanh Toán</label>
					</c:if></td>
                            <td class="discount-amount">
                     <c:if test="${prod.trangThaiDuyetDon eq '1'}">
						<label class="label label-primary">Đã Duyệt</label>
					</c:if> <c:if test="${prod.trangThaiDuyetDon eq '0' }">
						<label class="label label-info">Chưa Duyệt</label>
					</c:if> <c:if test="${prod.trangThaiDuyetDon eq '-1' }">
						<label class="label label-danger">Đã Hủy</label>
					</c:if></td>
                            <td class="raw-total"><fmt:formatNumber
						pattern="#,##0₫" value="${prod.giaTour}" type="currency" /></td>
                        </tr>
                    </tbody>              
                </table>
                <textarea class="chuThich" name="ghiChu"  placeholder="Ghi Chú" readonly="true">${prod.ghiChu}</textarea>
            </div>
                </div>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <table class="content-table_ĐT ">
                    <thead>
                        <tr>
                            <th>Tên Du Khách</th>
                            <th>CMND</th>
                            <th>Số Điện Thoại</th>
                            <th>Giới Tính</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
					<c:set var="slCTT" value="0" />
					<c:forEach var="item" items="${items}">
						<c:set var="slCTT" value="${slCTT + 1}" />
						<tr class="contentPage">
							<td>${item.tenDuKhach}</td>
							<td>${item.cmnd}</td>
							<td>${item.sdtZalo}</td>
							<td>${item.gioiTinh}</td>
							<td class="row">
								<div class="button_admin">
									<a data-toggle="tooltip" data-placement="top"
										title="See Detail"
										href=/person/dontour/seeDetail/${item.donTour.maDonTour}/seeDetail/${item.maThongTin}
										type="button" class="button_see" class="btn"><i
										class='fas fa-eye'></i> </a>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
                </table>
			<ul id="pagination"></ul>
			<c:if test="${slCTT == '0'}">
				<div class="alert1 text-center">Chưa Có Thông Tin</div>
			</c:if>
		</div>
<script
	src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
<script type="text/javascript">
            $(function () {
                var pageSize = 5; // Hiển thị 4 sản phẩm trên 1 trang
                showPage = function (page) {
                    $(".contentPage").hide();
                    $(".contentPage").each(function (n) {
                        if (n >= pageSize * (page - 1) && n < pageSize * page)
                            $(this).show();
                    });
                }
                showPage(1);
                ///** Cần truyền giá trị vào đây **///
                var totalRows = ${slCTT} // Tổng số sản phẩm hiển thị
                var btnPage = 5; // Số nút bấm hiển thị di chuyển trang
                var iTotalPages = Math.ceil(totalRows / pageSize);

                var obj = $('#pagination').twbsPagination({
                    totalPages: iTotalPages,
                    visiblePages: btnPage,
                    onPageClick: function (event, page) {
                        console.info(page);
                        showPage(page);
                    }
                });
                console.info(obj.data());
            });
        </script>