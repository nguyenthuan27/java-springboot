<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="overview-boxes">
	<div class="box">
		<div class="right-side">
			<div class="box-topic">Số lượng sản phẩm</div>
			<div class="number">${ fn:length(itemleg2) }</div>

		</div>
		<i class='bx bx-calendar-event cart'></i>
	</div>
	<div class="box">
		<div class="right-side">
			<div class="box-topic">Số lượng sản phẩm đã về</div>
			<div class="number">38,876</div>

		</div>
		<i class='bx bxs-cart-add cart two'></i>
	</div>
	<div class="box">
		<div class="right-side">
			<div class="box-topic">Số lượng sản phẩm chưa về</div>
			<div class="number">38,876</div>

		</div>
		<i class='bx bx-loader cart two'></i>
	</div>
</div>

<div class="popup center popup1">
	<div class="title">Thông tin sản phẩm</div>
	<form:form class="popup-form" action="qlproducts" method="post"
		modelAttribute="itempr" enctype="multipart/form-data">
		<div class="form-infor">
			<div class="infor-input">
				<div class="labler">
					<label for="">productId</label>
				</div>
				<form:input type="text" path="productId" name="productId"
					placeholder="ID" />
			</div>
			<div class="infor-input">
				<div class="labler">
					<label for="">Name</label>
				</div>
				<form:input type="text" path="name" name="name"
					placeholder="Nhập tên sản phẩm" />
			</div>
			<div class="infor-input">
				<div class="labler">
					<label for="">Price</label>
				</div>
				<form:input type="text" path="price" placeholder="Nhập giá"
					name="price" />
			</div>
			<div class="infor-input">
				<div class="labler">
					<label for="">Danh mục</label>
				</div>
				<form:select path="categories.categoryId" >
					<form:options items="${category}" itemValue="categoryId"
						itemLabel="name" />
				</form:select>
			</div>
			<div class="select-input">
				<div class="selecter">
					<div class="selecter-active">
						<label for="">Availiable:</label>
						<form:radiobutton path="availiable" value="true" name="availiable" 
							label="Available" />
						<form:radiobutton path="availiable" value="false"
							name="availiable" label="Loading" />
					</div>

				</div>
				<div class="photo-image">
					<label for="">Image:</label> <input name="image" type="file" />
				</div>
			</div>
		</div>
		<div class="dismiss-btn">
			<button formaction="createProduct">Insert</button>
			<button formaction="updateProduct">Update</button>
			<button type="button" onclick="deleteProduct(idPro)">Delete</button>
			<button id="dismiss-popup-btn">Cancel</button>
		</div>
	</form:form>
</div>
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
					<th>ID</th>
					<th>Name</th>
					<th>image</th>
					<th>Price</th>
					<th>Create Date</th>
					<th>Availiable</th>
					<th>CategoryId</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${pagepr.content}">
					<tr>
						<td>${item.productId}</td>
						<td>${item.name}</td>
						<td><img style="width: 40px" alt="" src="/fileImg/${item.image}"></td>
						<td>${item.price}</td>
						<td>${item.createDate}</td>
						<td>${item.availiable == true?"Available":"Loading"}</td>
						<td>${item.categories.name}</td>
						<td><a class="open-popup-btn" href="javascript:void(0)"
							onclick="updateProduct(`${item.productId}`)"><i
								class='bx bxs-message-square-edit'></i></a> <a
							href="deleteProduct/${item.productId}"><i
								class='bx bxs-message-square-x'></i></a></td>
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

<script>
	let idPro = "";

	// function deleteOne(){
	//	window.location.href = "/category/delete/" + categoryId;
	//	return false;
	//}
	function deleteProduct(idPro) {
		console.log(idPro)
		$.ajax({
			url : 'http://localhost:8080/admin/products-ajax/delete/'
					+ idPro,
			method : 'DELETE',
			success : function() {

				alert('Xoá thành công');
			},
			error : function(error) {
				alert(error);
			}
		})
	}
	function updateProduct(productId) {
		console.log(productId)
		$.ajax({
			url : 'http://localhost:8080/admin/products-ajax/' + productId,
			method : 'GET',
			dataType : 'json',
			success : function(data) {
				const bolean = data.availiable
				$('#productId').val(data.productId);
				$('#name').val(data.name);
				$('#price').val(data.price);
				$('#date').val(data.createDate);
				$('#image').val(data.image);
				$("input[name='"+ 'availiable' +"'][value='"+ bolean +"']").prop('checked', true);
				//console.log("CATEGORY" , $('#categories.categoryId'))
				const category = document.getElementById('categories.categoryId');
				category.value = data.categories.categoryId
				idPro = productId;
				

			},
			error : function(error) {
				alert(error);
			}
		})
	}
</script>