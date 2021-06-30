<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="overview-boxes">
	<div class="box">
		<div class="right-side">
			<div class="box-topic">Số lượng</div>
			<div class="number">${ fn:length(itemleg4) }</div>
		</div>
		<i class='bx bx-cart-alt cart'></i>
	</div>
	<div class="box">
		<div class="right-side">
			<div class="box-topic">Total Sales</div>
			<div class="number">38,876</div>

		</div>
		<i class='bx bxs-cart-add cart two'></i>
	</div>
</div>
<div class="popup center popup1">
	<div class="title">Thông tin chi tiết Oders</div>
	<form:form class="popup-form" action="qloderdetails" method="post"
		modelAttribute="itemoderdetails">
		<div class="form-infor">
			<div class="infor-input">
				<div class="labler">
					<label for="">ID OdderDetails</label>
				</div>
				<form:input path="id" name="id" 
					placeholder="ID Order" />
			</div>
			<div class="infor-input">
				<div class="labler">
					<label for="">Mã Oder</label>
				</div>
				<form:select path="oders.oderId" type="text">
					<form:options items="${oder}" itemValue="oderId" itemLabel="oderId" />
				</form:select>
			</div>
			<div class="infor-input">
				<div class="labler">
					<label for="">Tên sản phẩm</label>
				</div>
			<form:select path="products.productId">
					<form:options items="${product}" itemValue="productId"
						itemLabel="name" />
				</form:select>
			</div>
			<div class="infor-input">
				<div class="labler">
					<label for="">Price</label>
				</div>
				<form:input  path="price" placeholder="Nhập Giá"
					name="price" />
			</div>
			<div class="infor-input">
				<div class="labler">
					<label for="">Số lượng</label>
				</div>
				<form:input path="quantity" type="text" placeholder="Nhập"
					name="quantity" />
			</div>
			<div class="selecter-active" style="display: flex;align-items: center;">
				<label for="">Admin:</label>
				<form:radiobuttons path="statusdeli" items="${statusdeli}" />
			</div>
		</div>
		<div class="dismiss-btn">
			<button formaction="createOderDetails">Insert</button>
			<button formaction="updateOderDetails">Update</button>
			<button type="button" onclick="deleteOderDetails(idOderDetails)">Delete</button>
			<button id="dismiss-popup-btn">Cancel</button>
		</div>
	</form:form>
</div>
<div class="qlcategory">
	<div class="qlcategory-action">
		<div class="insert-category open-popup-btn">Thêm mới</div>
		<div class="wrapper">
			<div class="searchbtn">
				<i class='bx bx-search-alt-2'></i>
			</div>
			<input type="text" class="input" placeholder="Search.....">
		</div>
	</div>
	<div class="pane-table">
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>oderId</th>
					<th>productId</th>
					<th>price</th>
					<th>quantity</th>
					<th>trạng thái</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${pageoderdetail.content}">
					<tr>
						<td>${item.id }</td>
						<td>${item.oders.oderId}</td>
						<td>${item.products.name }</td>
						<td>${item.price }</td>
						<td>${item.quantity }</td>
						<td>${item.statusdeli }</td>

						<td><a class="open-popup-btn" href="javascript:void(0)"
							onclick="updateOderDetails(`${item.id}`)"><i
								class='bx bxs-message-square-edit'></i></a> <a
							href="deleteOderDetails/${item.id}"><i
								class='bx bxs-message-square-x'></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<div class="page-content">
	<div class="page-content-first">
		<a
			href="/admin/qloderdetails?pageoderdetail=${pageoderdetail.number -1 }">First</a>
	</div>
	<a class="soluong">${pageoderdetail.number + 1 }</a>
	<div class="page-content-first">

		<a
			href="/admin/qloderdetails?pageoderdetail=${pageoderdetail.number + 1 }">Next</a>
	</div>
</div>
<script>
	let idOderDetails = "";

	function deleteOderDetails(idOderDetails) {
		console.log(idOder)
		$.ajax({
			url : 'http://localhost:8080/admin/odersDetails-ajax/delete/'
					+ idOderDetails,
			method : 'DELETE',
			success : function() {

				alert('Xoá thành công');
			},
			error : function(error) {
				alert(error);
			}
		})
	}
	function updateOderDetails(id) {
		console.log(id)
		$.ajax({
			url : 'http://localhost:8080/admin/odersDetails-ajax/' + id,
			method : 'GET',
			dataType : 'json',
			success : function(data) {
				$('#id').val(data.id);
				$('#quantity').val(data.quantity);
				$('#price').val(data.price);
				$('#statusdeli').val(data.statusdeli);
				const oder = document.getElementById('oders.oderId');
				oder.value = data.oders.oderId
				const product = document.getElementById('products.name');
				product.value = data.products.name
			
				idOderDetails = id;

			},
			error : function(error) {
				alert(error);
			}
		})
	}
</script>
