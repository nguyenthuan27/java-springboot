<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="grid">
	<div class="section all-products" id="products">
		<div class="top container">
			<h1>All Products</h1>
			<form>
				<select onchange="ad(this)">
					<option value="1">Defualt Sorting</option>
					<option value="2">Sort By Price</option>
					<option value="3">Sort By Popularity</option>
					<option value="4">Sort By Sale</option>
					<option value="5">Sort By Rating</option>
				</select> <span><i class='bx bx-chevron-down'></i></span>
			</form>
		</div>

		<div class="footer-a">
			<div class="footer__products-items-two-pro">
				<c:forEach var="item" items="${listpr.content}">
					<div class="footer__product-items-two-card customer-pro">
						<div class="card-img">
							<img src="/fileImg/${item.image}">
						</div>
						<div class="card-img-title">
							<h2>${item.name}</h2>
							<div class="card-img-price">
								<span class="card-img-price-new"> <i
									class="fas fa-dollar-sign">${item.price}</i>
								</span>
							</div>
							<a href="/customer/add/${ item.productId}">BUY NOW</a>
						</div>
					</div>
				</c:forEach>
			</div>


		</div>
	</div>
		<div class="page-content">
			<div class="page-content-first">
				<a href="/customer/list-products?listpr=${listpr.number -1 }">First</a>
			</div>
			<a class="soluong">${listpr.number + 1 }</a>
			<div class="page-content-first">

				<a href="/customer/list-products?listpr=${listprr.number + 1 }">Next</a>
			</div>
		</div>
</div>
<html>
<script type="text/javascript">
function ad(a) {
	alert()
	location.href = "/customer/load/"+a.value
}
</script>
</html>