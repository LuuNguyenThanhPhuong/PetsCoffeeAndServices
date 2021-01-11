<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <br>
 <span> <b>Tình Trạng Tour:</b> &ensp;</span>
    <div class="pretty p-default">
        <input type="checkbox" class="chk-vehicle" value="Chưa xuất phát"/>
        <div class="state p-info">
            <label>Chưa Xuất Phát</label>
        </div>
    </div>

    <div class="pretty p-default">
        <input type="checkbox" class="chk-vehicle" value="Đã xuất phát" />
        <div class="state p-primary">
            <label>Đã Xuất Phát</label>
        </div>
    </div>

    <div class="pretty p-default">
        <input type="checkbox" class="chk-vehicle" value="Hoàn thành" />
        <div class="state p-success">
            <label>Hoàn Thành</label>
        </div>
    </div>
<table class="content-table check">
	<thead>
		<tr>
			<th>Mã Đơn</th>
			<th>Tour</th>
			<th>Ngày Đặt</th>
			<th>Tên Nhân Viên</th>
			<th>Số Lượng Khách</th>
			<th>Trạng Thái Thanh Toán</th>
			<th>Tình Trạng Tour</th>
			<th>Tổng Tiền</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody id="myTable">
	<c:set var="slCTT" value="0" />
		<c:forEach var="item" items="${daduyet}">
		<c:set var="slCTT" value="${slCTT + 1}" />
			<tr class="contentPage1">		
				<td>${item.maDonTour}</td>	
				<td><a href="/tour/detail/${item.tour.maTour}" >${item.tour.tenTour}</a></td>
				<td><fmt:formatDate value="${item.ngayDat}" pattern="dd/MM/yyyy' 'HH:mm"/></td>
				<td>${item.nhanVien.tenNhanVien}</td>
				<td> ${item.soLuongKhach} </td>
				<td>
				<c:if test="${item.trangThaiThanhToan eq 'true'}"><label class="label label-primary">Đã Thanh Toán</label></c:if> 
				<c:if test="${item.trangThaiThanhToan eq 'false' }"><label class="label label-warning">Chưa Thanh Toán</label></c:if>
				

				<td>
				<c:if test="${item.tinhTrang eq '1'}"><label class="label label-primary">Đã Xuất Phát</label></c:if> 
				<c:if test="${item.tinhTrang eq '-1'}"><label class="label label-info">Chưa Xuất Phát</label></c:if>
				<c:if test="${item.tinhTrang eq '0'}"><label class="label label-success">Hoàn Thành</label></c:if>
				</td>
				<td><fmt:formatNumber pattern="#,##0₫" value = "${item.giaTour}" type = "currency"/></td>
				<td>
					<c:if test="${item.trangThaiDuyetDon eq '0'}">
				        <a data-toggle="tooltip" data-placement="top" title="Delete" href="/trangthaitour/cancel/${item.maDonTour}" type="button"
							class="button_delete" class="btn"><i class='fas fa-close'></i>
				        </a>
			        </c:if>			    
			    	<a data-toggle="tooltip" data-placement="top" title="See Detail" href="/trangthaitour/seeDetail/${item.maDonTour}" type="button" class="button_see" class="btn"><i
							class='fas fa-eye'></i> 
			        </a>
				</td>

			</tr>
		</c:forEach>
	</tbody>
</table>
	<ul id="pagination1"></ul>
<c:if test="${slCTT == '0'}">
<div class="alert1 text-center">Không có dữ liệu</div>
</c:if>
<!-- JS tạo nút bấm di chuyển trang end -->
<script type="text/javascript">
            $(function () {
                var pageSize1 = 10; 
                showPage1 = function (page) {
                    $(".contentPage1").hide();
                    $(".contentPage1").each(function (n) {
                        if (n >= pageSize1 * (page - 1) && n < pageSize1 * page)
                            $(this).show();
                    });
                }
                showPage1(1);
                ///** Cần truyền giá trị vào đây **///
                var totalRows = ${slCTT} // Tổng số sản phẩm hiển thị
                var btnPage = 5; // Số nút bấm hiển thị di chuyển trang
                var iTotalPages = Math.ceil(totalRows / pageSize1);

                var obj = $('#pagination1').twbsPagination({
                    totalPages: iTotalPages,
                    visiblePages: btnPage,
                    onPageClick: function (event, page) {
                        console.info(page);
                        showPage1(page);
                    }
                });
                console.info(obj.data());
            });
            
        </script>
<script>
$(document).ready(function () {		
   $(":checkbox.chk-vehicle").change(function(){
	   var chks = [];
	   $(":checked.chk-vehicle").each((i, chk) => {
		   chks.push($(chk).val().trim().toLowerCase());
	   })
		$("tr.contentPage1").each((index, tr) => {
			var td = $(tr).find("td:eq(6)");
			$(tr).hide();
			if(chks.includes(td.text().trim().toLowerCase())){
				$(tr).show();
			}
		});
   });
   $(":checkbox.chk-vehicle").prop("checked", true);
   $(":checkbox.chk-vehicle").change();
});
   </script>