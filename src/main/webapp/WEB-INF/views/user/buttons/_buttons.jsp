<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="btn-group">
	<button
		onclick="cart.add(${prod.maTour}, `${prod.tenTour}`, ${prod.giaTour}, `${prod.noiKhoiHanh}`, `${prod.hinh}`, `${prod.phuongTien}`)"
		class="btn btn-sm btn-primary">
		<span class="glyphicon glyphicon-shopping-cart">Lưu Tour</span>
	</button>
	<a href="/paytour/index/${prod.maTour}">
		<button class="btn btn-sm btn-success">
			<span class="glyphicon glyphicon-envelope">Đặt Tour</span>
		</button>
	</a>

</div>
