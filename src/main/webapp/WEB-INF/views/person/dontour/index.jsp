<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--Menu_Tab-->
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="tab_QL">
				<ul class="nav nav-tabs myTab">
					<!--Trạng Thái-->
					<li class="active question"><a href="#chuaxuatphat"
						data-toggle="tab" aria-expanded="true"><i
							class='far fa-question-circle'></i> Chưa Xuất Phát</a></li>
					<li class="check"><a href="#daxuatphat" data-toggle="tab"
						aria-expanded="true"><i class='far fa-check-circle'></i> Đã
							Xuất Phát</a></li>
					<li class="question"><a href="#done" data-toggle="tab"
						aria-expanded="true"><i class="fa fa-check-circle"></i> Đã
							Hoàn Thành</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<section class="form_QT">
	<div class="container">
		<div class="row">
			<br>
			<c:if test="${not empty message }">
				<div class="alert alert-${alerts} fade in alert-dismissible show">
					${message}
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close" style="top: -10px;">
						<span aria-hidden="true">×</span>
					</button>
				</div>
			</c:if>
		</div>
		<!--Table-->
		<div class="col-md-12">
			<div class="tab-content">
				<div class="tab-pane active" id="chuaxuatphat">
					<jsp:include page="_chuaxuatphat.jsp" />
				</div>

				<div class="tab-pane fade" id="daxuatphat">
					<jsp:include page="_daxuatphat.jsp" />
				</div>

				<div class="tab-pane fade" id="done">
					<jsp:include page="_hoanthanh.jsp" />
				</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">
$(function(){
	$(".datepicker").datepicker({dateFormat: 'dd/mm/yy  HH:mm:ss'})
})
</script>
<script>
    $(document).ready(function () {
        $(".nav-tabs a").click(function (e) {
            e.preventDefault()
            $(this).tab('show');
        });
    });
</script>