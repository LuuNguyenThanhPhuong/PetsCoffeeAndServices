<%@ page pageEncoding="utf-8"%>
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
                        itemprop="name">Tour yêu thích</strong>
                    <meta itemprop="position" content="2">
                </li>
            </ul>
        </div>
    </section>
    <!--Like-->
    <div class="container container--wishlist">
        <h1 class="text-center">Tour yêu thích</h1>
        <div class="row js-wishlist-content products-view products-view-grid" id="wish_list_pro">
            <div class="col text-center">
                <div class="alert alert-warning1 d-inline-block">
                    <h3>Tour nào của chúng tôi bạn mong muốn sở hữu nhất?</h3>
                    <p>Hãy thêm vào danh sách Tour yêu thích ngay nhé!</p>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
    <table class="content-table1">
        <thead>
          <tr>
            <th></th>
            <th>Tên Tour</th>
            <th>Giá Tour</th>
            <th>Nơi Khởi Hành</th>
            <th>Phương Tiện</th>
            <th>Action</th>         
          </tr>
        </thead>
        <tbody class="cart-items">

        </tbody>
        
      </table>
      
      		<a onclick="cart.clear()" href="" class="btn btn-danger"> <span
			class="glyphicon glyphicon-trash"></span> Clear
		</a>
    </div>
  
      
<script>
$(function(){
	cart.show_all();
});
</script>
<script>
	function formatVND(number){
	return number.toFixed(0).replace(/./g, function (c, i, a){
		return i > 0 && c !== "," && (a.length - i) % 3 === 0? "." + c : c;
	}) + ' ₫';
}
</script>