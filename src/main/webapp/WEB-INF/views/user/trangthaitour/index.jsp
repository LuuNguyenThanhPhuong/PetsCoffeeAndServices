<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id='preloader'>
  <div id='loader'>
    <span class='loader'>
      <span class='loader-inner'></span>
    </span>
  </div>
</div> 
        <section class="bread-crumb margin-bottom-10" style="margin-bottom: 20px">
        <div class="container">
            <ul class="breadcrumb" itemscope="" itemtype="https://schema.org/BreadcrumbList">
                <li class="home" itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"> <a
                        itemprop="item" href="/" title="Trang chủ"> <span itemprop="name">Trang chủ</span>
                        <meta itemprop="position" content="1"> </a> </li>
                <li itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"> <strong
                        itemprop="name">Quản lí đơn Tour của bạn</strong>
                    <meta itemprop="position" content="2">
                </li>
            </ul>
        </div>
    </section>
<div class="Modal_ĐT" style="margin-bottom: 20px">
<div class="container">
<div class="row">
<div class="col-md-12">
<c:set var="slCTT" value="0" />
<c:forEach var="item" items="${daduyet}">
	<c:if test="${item.trangThaiThanhToan eq '0'}">
		<c:set var="slCTT" value="${slCTT + 1}" />
	</c:if>
</c:forEach>
<c:if test="${slCTT > '0'}">
	<div class="toast" data-autohide="false" style="max-width: 500px">
		<div class="toast-header">
			<strong class="mr-auto text-primary" style="font-size: 17px">Đơn
				Đặt Của Bạn Đã Được Duyệt, Vui Lòng Thanh Toán</strong>
			<button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
		</div>
		<div class="toast-body" style="font-size: 15px">Tổng đơn cần
			thanh toán: ${slCTT}</div>
	</div>
</c:if>
<c:if test="${not empty tb}">
	<div class="toast" data-autohide="false" style="max-width: 500px">
		<div class="toast-header">
			<strong class="mr-auto text-primary" style="font-size: 17px">
				Đơn Của Bạn Đã Bị Hủy Vì 7 Tiếng Sau Tour Này Sẽ Xuất Phát - ${tb}</strong> <span class="text-muted">${sss}</span>
			<button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
		</div>
	</div>
</c:if>
<c:if test="${not empty autohuy}">
	<div class="toast" data-autohide="false" style="max-width: 500px">
		<div class="toast-header">
			<strong class="mr-auto text-primary" style="font-size: 17px">
				Đơn Của Bạn Đã Bị Hủy, Đã 5 ngày đơn này chưa được duyệt - ${autohuy}</strong>
			<button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
		</div>
	</div>
</c:if>
</div>
</div>
</div>
</div>



<!--Menu_Tab-->
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="tab_QL">
				<ul class="nav nav-tabs myTab">
					<!--Trạng Thái-->
					<li class="active question"><a href="#chuaduyet"
						data-toggle="tab" aria-expanded="true"><i
							class='far fa-question-circle'></i> Chưa Duyệt</a></li>
					<li class="check"><a href="#daduyet" data-toggle="tab"
						aria-expanded="true"><i class='far fa-check-circle'></i> Đã
							Duyệt</a></li>
					<li class="close1"><a href="#dahuy" data-toggle="tab"
						aria-expanded="true"><i class="fa fa-close"></i> Đã Hủy</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<section class="form_QT">
	<div class="container">
		<div class="row">
		<div class="col-md-12">
			</div>
			<!--Table-->
			<div class="col-md-12">
				<div class="tab-content">
					<div class="tab-pane active" id="chuaduyet">
						<jsp:include page="_chuaduyet.jsp" />
					</div>

					<div class="tab-pane fade" id="daduyet">
						<jsp:include page="_daduyet.jsp" />
					</div>

					<div class="tab-pane fade" id="dahuy">
						<jsp:include page="_dahuy.jsp" />
					</div>
				</div>
			</div>
		</div>
	</div>
		              							<!-- Modal OK-->
							<div class="modal" id="${ok}" data-backdrop="static"
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
											<div class="swal-title">${message}</div>
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
							<!-- Modal Error-->
							<div class="modal" id="${error}" data-backdrop="static"
								data-keyboard="false" tabindex="-1"
								aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">

									<!-- Modal content-->
									<div class="modal-content">
										<div class="swal-modal">
											<div class="swal-icon swal-icon--error">
												<div class="swal-icon--error__x-mark">
													<span
														class="swal-icon--error__line swal-icon--error__line--left"></span>
													<span
														class="swal-icon--error__line swal-icon--error__line--right"></span>
												</div>
											</div>
											<div class="swal-title">${message}</div>
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
</section>
<br>
<br>
<br>
<br>
<script>
$('#myModal').modal('show');
$('#myModalerror').modal('show');
</script>
<script>
$(document).ready(function(){
  $('.toast').toast('show');
});
</script>
<script>
    $(document).ready(function () {
        $(".nav-tabs a").click(function (e) {
            e.preventDefault()
            $(this).tab('show');
        });
    });
</script>
<script
	src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js"
	type="text/javascript"></script>