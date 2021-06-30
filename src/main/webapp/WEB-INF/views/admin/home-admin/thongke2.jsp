<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="qlcategory">
	<div class="qlcategory-action">
		<div class="insert-category open-popup-btn">Thêm mới</div>
		<form action="qlproducts" method="post" class="wrapper">
			<button class="searchbtn" formaction="">
				<i class='bx bx-search-alt-2'></i>
			</button>
			<input name="id" class="input" placeholder="Search.....">

		</form>
	</div>
	<div class="pane-table">
		<table>
			<thead>
				<tr>
					<th>Ngày</th>
					<th>Số lượng Oder</th>
					<th>Số lượng sản phẩm</th>
					<th>Tổng tiền</th>			
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${reporttime}">
					<tr>
						<td>${item.createDate}</td>
						<td>${item.countorder}</td>
						<td>${item.countquantity}</td>
						<td>${item.countprice} VND</td>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<div class="page-content">
	<div class="page-content-first">
		<a href="/admin/qlproducts?pagepr=${pagepr.number -1 }">First</a>
	</div>
	<a class="soluong">${page.number + 1 }</a>
	<div class="page-content-first">

		<a href="/admin/qlproducts?pagepr=${pagepr.number + 1 }">Next</a>
	</div>
</div>