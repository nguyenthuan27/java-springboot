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
					<th>Tên sản phẩm</th>
					<th>Ngày mua</th>
					<th>Tổng số lượng</th>
					<th>Giá của sản phẩm</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${reporttype}">
					<tr>
						<td>${item.name}</td>
						<td>${item.createDate}</td>
						<td>${item.countquantitys}</td>
						<td>${item.countprices} VND</td>
					
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
