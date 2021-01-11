<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>

<br>
<br>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<a href="/admin/thongke/index"> <i class='fas fa-angle-left'></i>
				Quay lại
			</a>
		</div>
	   <div class="panel-heading">
        <strong class="panel-title">BÁO CÁO DOANH THU THEO TOUR</strong>
    </div>
		<div class="col-md-12">

			<div class="tab_QL">
				<ul class="nav nav-tabs myTab">
					<li class="active chart"><a href="#customer" data-toggle="tab"
						aria-expanded="true"><i class='fa fa-institution'></i> BIỂU ĐỒ</a></li>
					<li class="chart"><a href="#BD" data-toggle="tab"
						aria-expanded="true"><i class='fa fa-table'></i> BẢNG SỐ
							LIỆU</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

<div class="container">
<input class="form-control" type="text" id="myInput" onkeyup="myFunction()" placeholder="Tìm Kiếm Theo Từ Khóa..">
	<div class="tab-content">
		<div class="tab-pane active" id="customer">
		<%@include file="thongke_tour_chart.jsp"%>
		</div>
		<div class="tab-pane fade" id="BD">

			<table class="content-table chart">
	    <thead class="bg-danger">
	        <tr>
	            <th>Tên Tour</th>
	            <th>Tổng giá trị</th>
	            <th>Tổng SL</th>
	            <th>Giá Min</th>
	            <th>Giá Max</th>
	            <th>Giá TB</th>
	        </tr>
	    </thead>
	    <tbody id="myTable">
	<c:set var="slCTT" value="0" />
		<c:forEach var="item" items="${items}">
		<c:set var="slCTT" value="${slCTT + 1}" />
			<tr class="contentPage">
			    <td>${item.group}</td>
				<td><fmt:formatNumber pattern="#,##0₫" value = "${item.sum}" type = "currency"/> </td>
				<td>${item.count}</td>
				<td><fmt:formatNumber pattern="#,##0₫" value = "${item.min}" type = "currency"/> </td>
				<td><fmt:formatNumber pattern="#,##0₫" value = "${item.max}" type = "currency"/> </td>
				<td><fmt:formatNumber pattern="#,##0₫" value = "${item.avg}" type = "currency"/> </td>
			</tr>
	    </c:forEach>
	    </tbody>
	</table>
		   <ul id="pagination"></ul>
		   	 <c:if test="${slCTT == '0'}">
<div class="alert1 text-center">Không có dữ liệu</div>
</c:if>
		</div>
	</div>

</div>
<script>
	$(document).ready(function() {
		$(".nav-tabs a").click(function(e) {
			e.preventDefault()
			$(this).tab('show');
		});
	});
</script>
<script
	src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
<!-- JS tạo nút bấm di chuyển trang end -->
<script type="text/javascript">
            $(function () {
                var pageSize = 10; // Hiển thị 4 sản phẩm trên 1 trang
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