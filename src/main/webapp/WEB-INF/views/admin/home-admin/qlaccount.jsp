<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="overview-boxes">
	<div class="box">
		<div class="right-side">
			<div class="box-topic">Số lượng Account</div>
			<div class="number">${ fn:length(itemleg1) }</div>

		</div>
	<i class='bx bx-user-circle cart' ></i>
	</div>
	<div class="box">
		<div class="right-side">
			<div class="box-topic">Tài khoản đã kích hoạt</div>
			<div class="number">3</div>

		</div>
		<i class='bx bx-user-check cart two'></i>
	</div>
	<div class="box">
		<div class="right-side">
			<div class="box-topic">Tài khoản chưa kích hoạt</div>
			<div class="number">2</div>

		</div>
		<i class='bx bx-user-plus cart'></i>
	</div>

</div>
<div class="popup center popup1">
	<div class="title">Thông tin người dùng</div>
	<form:form class="popup-form" action="qlaccount" method="post"
		modelAttribute="items" enctype="multipart/form-data">
		<div class="form-infor">
			<div class="infor-input">
				<div class="labler">
					<label for="">UserName</label>
				</div>
				<form:input path="username" name="username"
					placeholder="Nhập Username của bạn" />
			</div>
			<div class="infor-input">
				<div class="labler">
					<label for="">PassWord</label>
				</div>
				<form:input type="text" path="password" name="password"
					placeholder="Nhập Password" />
			</div>
			<div class="infor-input">
				<div class="labler">
					<label for="">FullName</label>
				</div>
				<form:input type="text" path="fullname" placeholder="Nhập Full Name"
					name="fullname" />
			</div>
			<div class="infor-input">
				<div class="labler">
					<label for="">Email</label>
				</div>
				<form:input path="email" type="text"
					placeholder="Nhập địa chỉ email của bạn" name="email" />
			</div>
			<div class="select-input">
				<div class="selecter">
					<div class="selecter-active">
						<label for="">Activated:</label>
						<form:radiobutton path="activated" name="activated" value="true"
							label="Đã kích hoạt" />
						<form:radiobutton path="activated" value="false" name="activated"
							label="Chờ kích hoạt" />
					</div>
					<div class="selecter-active">
						<label for="">Admin:</label>
						<form:radiobutton path="admin" name="admin" value="true"
							label="Admin" />
						<form:radiobutton path="admin" value="false" name="admin"
							label="User" />
					</div>
				</div>
				<div class="photo-image">
					<label for="">Photo:</label> 
					<form:input path="photo" name="photo"  type="file" />
				</div>
			</div>
		</div>
		<div class="dismiss-btn">
			<button formaction="createAccount">Insert</button>
			<button formaction="updateAccount">Update</button>
			<button type="button" onclick="deleteAccount(usernameId)">Delete</button>
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
					<th>Username</th>
					<th>Password</th>
					<th>Full Name</th>
					<th>Email Address</th>
					<th>Photo</th>
					<th>Role</th>
					<th>Activated</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${pageac.content}">
					<tr>
						<td>${item.username }</td>
						<td>${item.password }</td>
						<td>${item.fullname }</td>
						<td>${item.email }</td>
						<td>
						<img style="width: 40px" alt="" src="/fileImg/${item.photo}">
						</td>
						<td>${item.admin == true?"Admin":"User"}</td>
						<td>${item.activated == true?"Đã kích hoạt":"Chờ kích hoạt..."}</td>
						<td><a class="open-popup-btn" href="javascript:void(0)"
							onclick="updateAccount(`${item.username}`)"><i
								class='bx bxs-message-square-edit'></i></a> <a
							href="deleteAcc/${item.username}"><i
								class='bx bxs-message-square-x'></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<div class="page-content">
	<div class="page-content-first">
		<a href="/admin/qlaccount?pageac=${pageac.number -1 }">First</a>
	</div>
	<a class="soluong">${pageac.number + 1 }</a>
	<div class="page-content-first">

		<a href="/admin/qlaccount?pageac=${pageac.number + 1 }">Next</a>
	</div>
</div>
<script>
	let usernameId = "";

	// function deleteOne(){
	//	window.location.href = "/category/delete/" + categoryId;
	//	return false;
	//}
	function deleteAccount(usernameId) {
		console.log(usernameId)
		$.ajax({
			url : 'http://localhost:8080/admin/account-ajax/delete/'
					+ usernameId,
			method : 'DELETE',
			success : function() {

				alert('Xoá thành công');
			},
			error : function(error) {
				alert(error);
			}
		})
	}
	function updateAccount(username) {
		console.log(username)
		$.ajax({
			url : 'http://localhost:8080/admin/account-ajax/' + username,
			method : 'GET',
			dataType : 'json',
			success : function(data) {
				$('#username').val(data.username);
				$('#password').val(data.password);
				$('#fullname').val(data.fullname);
				$('#email').val(data.email);
				$('#photo').val(data.photo);
				//$('#activated').val(data.activated);
				$("input[name='"+ 'activated' +"'][value='"+ data.activated +"']").prop('checked', true);
				//$('#admin').val(data.admin);
				$("input[name='"+ 'admin' +"'][value='"+ data.admin +"']").prop('checked', true);
				usernameId = username;

			},
			error : function(error) {
				alert(error);
			}
		})
	}
</script>