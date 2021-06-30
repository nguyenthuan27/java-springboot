<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="overview-boxes">
	<div class="box">
		<div class="right-side">
			<div class="box-topic">Số lượng Order</div>
			<div class="number">${ fn:length(itemleg3) }</div>

		</div>
		<i class='bx bx-spreadsheet cart'></i>
	</div>
</div>

<div class="popup center">
	<div class="title">Thông tin Oders</div>
	<form:form class="popup-form" action="oders" method="post"
		modelAttribute="itemoder" >
		<div class="form-infor1">
			<div class="infor-input1">
				<div class="labler">
					<label for="">ID Odder</label>
				</div>
				<form:input path="oderId" name="oderId" 
					placeholder="ID Order" />
			</div>
			<div class="infor-input">
				<div class="labler">
					<label for="">Username Người đặt</label>
				</div>
				<form:select path="accounts.username">
					<form:options items="${accounts}" itemValue="username"
						itemLabel="username" />
				</form:select>
			</div>
			<div class="infor-input1">
				<div class="labler">
					<label for="">Địa chỉ nhận hàng</label>
				</div>
				<form:input path="address" name="address" type="text"
					placeholder="Địa chỉ" />
			</div>
		</div>
		<div class="dismiss-btn">
			<button formaction="createOder">Insert</button>
			<button formaction="updateOder">Update</button>
			<button type="button" onclick="deleteOder(idOder)">Delete</button>
			<button id="dismiss-popup-btn">Cancel</button>
		</div>
	</form:form>
</div>
<div class="qlcategory">
	<div class="qlcategory-action">
		<div class="insert-category open-popup-btn">Thêm mới</div>
		<form action="category" method="post" class="wrapper">
			<button class="searchbtn" formaction="category/search/{id}">
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
					<th>Create Date</th>
					<th>Address</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${pageoder.content}">
					<tr>
						<td>${item.oderId}</td>
						<td>${item.accounts.username }</td>
						<td>${item.createDate}</td>
						<td>${item.address}</td>
						<td><a class="open-popup-btn" href="javascript:void(0)"
							onclick="updateOder(`${item.oderId}`)"><i
								class='bx bxs-message-square-edit'></i></a> <a
							href="deleteOder/${item.oderId}"><i
								class='bx bxs-message-square-x'></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<div class="page-content">
	<div class="page-content-first">
		<a href="/admin/oders?pageoder=${pageoder.number - 1 }">First</a>
	</div>
	<a class="soluong">${pageoder.number + 1 }</a>
	<div class="page-content-first">

		<a href="/admin/oders?pageoder=${pageoder.number + 1 }">Next</a>
	</div>
</div>
<script>
	let idOder = "";

	function deleteOder(idOder) {
		console.log(idOder)
		$.ajax({
			url : 'http://localhost:8080/admin/oders-ajax/delete/' + idOder,
			method : 'DELETE',
			success : function() {

				alert('Xoá thành công');
			},
			error : function(error) {
				alert(error);
			}
		})
	}
	function updateOder(oderId) {
		console.log(oderId)
		$.ajax({
			url : 'http://localhost:8080/admin/oders-ajax/' + oderId,
			method : 'GET',
			dataType : 'json',
			success : function(data) {
				$('#oderId').val(data.oderId);
				//$('#username').val(data.username);
				const user = document.getElementById('accounts.username');
				user.value = data.accounts.username
				$('#createDate').val(data.createDate);
				$('#address').val(data.address);
				idOder = oderId;

			},
			error : function(error) {
				alert(error);
			}
		})
	}
</script>
