cart = {
	items: {}, /*-- Chứa hàng đã chọn --*/
	/*-- Thêm hàng vào giỏ --*/
	add(maTour, tenTour, giaTour, noiKhoiHanh, hinh, phuongTien) {
		if (this.items[maTour]) { /*-- có rồi -> Không cho lưu nữa --*/
			swal("Đã Yêu Thích Tour Này Rồi!", "Cảm ơn bạn đã quan tâm", "warning")
		}
		else { /*-- chưa có -> tạo và bỏ vào giỏ --*/
			this.items[maTour] = {
				maTour: maTour, tenTour: tenTour, giaTour: giaTour, noiKhoiHanh: noiKhoiHanh, hinh: hinh, phuongTien: phuongTien, quantity: 1
			}
		}
		this.save();
		this.show_info();
		console.log(this.items)
	},
	/*-- Lưu hàng đã chọn vào sessionStorage --*/
	save() {
		var json = JSON.stringify(this.items);
		sessionStorage.setItem("cart", json);
	},
	/*-- Đọc hàng đã chọn từ sessionStorage --*/
	read() {
		var json = sessionStorage.getItem("cart");
		if (json) {
			this.items = JSON.parse(json);

		}
		this.show_info();
	},
	get count() {
		var total = 0;
		for (var maTour in this.items) {
			total += this.items[maTour].quantity;
		}
		return total;
	},
	/*-- Hiển thị thông tin tổng hợp giỏ hàng --*/
	show_info() {
		$(".cart-cnt").html(this.count);
	},

	/*-- Xóa hết giỏ hàng --*/
	clear() {
		sessionStorage.removeItem("cart");
		this.items = {};
		this.show_info();
		this.show_all();
	},
	/*-- Hiển thị giỏ hàng và thông tin tổng hợp --*/
	show_all() {
		$("tbody.cart-items").empty();
		for (var maTour in this.items) {
			var item = this.items[maTour];
			var tr = `
					<tr>
					
						<td class="hidden">${item.maTour}</td>
						<td class="img_table_like">
						<a href="/tour/detail/${item.maTour}"><img src="/static/images/tour/${item.hinh}"></a></td>
						<td><a href="/tour/detail/${item.maTour}">${item.tenTour}</a></td>
						<td>${item.giaTour}</td>
						<td>${item.noiKhoiHanh}</td>
						<td>${item.phuongTien}</td>
						
						<td>
					    	<button data-toggle="tooltip" data-placement="top" title="Delete" onclick="cart.remove(${item.maTour})" type="button" class="btn" id="btn-delete">
					    		<i class="fa fa-trash-o"></i>
					    	</button>
					    </td>	
					    
					    						
					</tr>
				`;
			$("tbody.cart-items").append(tr);
		}
	},

	/*-- Xóa một mặt hàng khỏi giỏ --*/
	remove(maTour) {
		delete this.items[maTour];
		this.save();
		this.show_info();
		this.show_all();
	}
}

$(function() {
	cart.read(); /*-- Đọc từ sessionStorage khi trang web chạy --*/
})
