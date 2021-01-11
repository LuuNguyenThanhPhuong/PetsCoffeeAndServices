<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<script src="/static/js/upload.js"></script>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>


   <!--Article-->
    <!--Tiêu Đề Trang-->
    <section class="bread-crumb margin-bottom-10">
        <div class="container">
            <ul class="breadcrumb" itemscope="" itemtype="https://schema.org/BreadcrumbList">
                <li class="home" itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"> <a
                        itemprop="item" href="/admin/home/index" title="Trang chủ"> <span itemprop="name">Trang chủ</span>
                        <meta itemprop="position" content="1"> </a> </li>
                <li itemprop="itemListElement" itemscope="" itemtype="https://schema.org/ListItem"> <strong
                        itemprop="name">Thông tin tài khoản</strong>
                    <meta itemprop="position" content="2">
                </li>
            </ul>
        </div>
    </section>
    <!--Form_Information-->
    <div class="container">
        <div class="row">
    <div class="col-md-3">
<div class="box_image_logo1">
<div class="my-account-litle1">Ảnh đại diện</div>
<div class="my-account-img">
    <label for="photo_file">
    <img id="photo_image" src="/static/images/photos/${form.hinh}" width="400px" height="300px"> </label>
    <input id="file-input" type="file" style="display: none;">
</div>
<a style="text-decoration: none;"><button class="btn btn-block"><i class="fa fa-suitcase"></i> <c:if test="${form.vaiTro eq 'true'}">Admin</c:if> 
				<c:if test="${form.vaiTro eq 'false' }">Person</c:if></button></a>
</div>




    </div>
    
    <div class="col-md-9">
<div class="box_info_account1">
<div class="my_info_account_header1s">
    <h3>MY INFOMATION </h3>
    <h4>Quản lý thông tin hồ sơ để bảo mật tài khoản</h4>
</div>
<!--Form-->
<form:form action="/admin/account/edit" modelAttribute="form" enctype="multipart/form-data">
                <c:if test="${not empty message }">
                <div class="alert alert-${alerts} fade in alert-dismissible show" >
                ${message}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close" style="top: -10px;">
                <span aria-hidden="true" >×</span>
 				 </button>
                </div>
                </c:if>
<div class="form_info_update1">
    <div class="form-group row">
        <label class="col-md-4 control-label">Họ và tên:</label>
        <div class="col-md-8">
            <form:input path="tenNhanVien" class="form-control" required="f" placeholder="Họ Và Tên" name="lh_name" type="text" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-md-4 control-label">Ngày sinh:</label>
        <div class="col-md-8">
            <form:input path="ngaySinh" class="form-control" required="f" placeholder="Ngày Sinh" name="lh_name" type="date"/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-md-4 control-label">Điện thoại:</label>
        <div class="col-md-8">
            <form:input path="soDienThoai" class="form-control numeric" maxlength="11" required="f" placeholder="Số Điện Thoại" name="lh_name" type="text"/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-md-4 control-label">Email:</label>
        <div class="col-md-8">
            <form:input path="email" class="form-control" required="f" placeholder="Email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$" name="lh_name" type="text"/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-md-4 control-label">Địa chỉ:</label>
        <div class="col-md-8">
            <form:input path="diaChi" class="form-control" required="f" placeholder="Địa Chỉ" name="lh_name" type="text"/>
        </div>
    </div>
    <div class="form-group row">
		<label class="col-md-4 control-label">Giới Tính</label>
		<div class="col-md-8">
		<form:radiobutton path="gioiTinh" value="Nam" label="Nam"/>
		<form:radiobutton path="gioiTinh" value="Nữ" label="Nữ"/>
		<form:radiobutton path="gioiTinh" value="Khác" label="Khác"/>
		</div>
	</div>
	<div class="form-group row">
		<label class="col-md-4 control-label">Photo</label> 
		<div class="col-md-8">
			<input onchange="upload.change(this, '#photo_image')" type="file"
			name="photo_file" id="photo_file" class="form-control" />
			</div>
		<form:hidden path="hinh" />
	</div>
	<form:hidden path="vaiTro"/>
	<form:hidden path="isDelete"/>
    <form:hidden path="maNhanVien"/>
    <form:hidden path="password"/>
    <div class="form-group" style="margin-bottom: 40px;">
    <button class="btn booking text-uppercase">Update</button>
    
   <a href="/admin/account/change" class="btn booking1 text-uppercase">CHANGE PASSWORD</a>
    

</div>
</div>
</form:form>
</div>
    </div>
        </div>
        
    </div>
<script>
$(document).on("input", ".numeric", function() {
    this.value = this.value.replace(/\D/g,'');
});

</script>
