<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="popup center">
	<div class="title">Thông tin Oders</div>
	<form class="popup-form" action="shopcart" method="post" modelAttribute="itemodercart">
		<div class="form-infor1">
			<div class="infor-input1">
				<div class="labler">
					<label for="">ID Odder</label>
				</div>
				<input name="oderId"  disabled="true"
					placeholder="ID Order" />
			</div>
			<div class="infor-input">
				<div class="labler">
					<label for="">Username Người đặt</label>
				</div>
				<input name="accounts.username" disabled="true" items="${sessionScope.username}" value="${sessionScope.username}" >
			</div>
			<div class="infor-input1">
				<div class="labler">
					<label for="">Nhập địa chỉ nhận hàng</label>
				</div>
				<input  name="address" type="text"
					placeholder="Địa chỉ" />
			</div>
		</div>
		<div class="dismiss-btn">
			<button formaction="oderfromcart">Insert</button>
			<button formaction="">Update</button>
			<button id="dismiss-popup-btn">Cancel</button>
		</div>
	</form>
</div>
<div class=" cart">
	<table>
		<tr>
			<th>Product</th>
			<th>Quantity</th>
			<th>Subtotal</th>
		</tr>
		<tbody>
			<c:forEach var="item" items="${carts}">
				<form action="/customer/update" method="post">
				<input type="hidden" name="id" value="${item.proId}">
				
				<tr>
					<td>
						<div class="cart-info">
							<img src="/fileImg/${item.image}" alt="">
							<div>
								<p class="title-pro">${item.name }</p>
								<span>Price: ${item.price}</span> <br /> <a href="delete/${item.proId }">Remove</a>
							</div>
						</div>
					</td>
					<td><input name="qty" value="${item.qty}" onblur="this.form.submit()" min="1"></td>
					<td>${item.price * item.qty} VND</td>
				</tr>
				</form>
			
			</c:forEach>
		</tbody>




	</table>

	<div class="total-price">
		<table>
			<tr>
				<td>Hóa đơn</td>
				<td>${total } VND</td>
			</tr>
			
			<tr>
				<td>Thành tiền	</td>
				<td>${total } VND</td>
			</tr>
		</table>
		<a  class="checkout btn open-popup-btn">Đặt hàng</a>

	</div>

</div>

	<script>
		function myFunction() {
			var dropdownContent = document.querySelector('.dropdown-content');
			dropdownContent.classList.toggle('dropdown-toggle');
		}
		const openPopups = document.getElementsByClassName("open-popup-btn");
	    for(let idx= 0; idx < openPopups.length; idx++) {
	        openPopups[idx].addEventListener("click", () => {
	            document.getElementsByClassName("popup")[0].classList.add("active");
	        })
	    }
	    document.getElementById("dismiss-popup-btn").addEventListener("click", function () {
	    	console.log("CANCEL")
	        document.getElementsByClassName("popup")[0].classList.remove("active");
	    });
	</script>