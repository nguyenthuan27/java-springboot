<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<nav>
	<div class="sidebar-button">
		<i class='bx bx-menu sidebarBtn'></i> <span class="dashboard">Code ASM</span>
	</div>

	<div class="dropdown-item">
		<div class="profile-details" onclick="myFunction()">
			<img style="width: 40px" alt="" src="/fileImg/${imguser}"> <span class="admin_name">${sessionScope.username}</span> <i class='bx bx-chevron-down'></i>
		</div>
		<div class="dropdown-content">
			<ul class="links">
				<li><a href="javascript:void(0)" class="open-popup-btn" onclick="updateAccount(`${sessionScope.username}`)" ><i class="bx bx-user" aria-hidden="true"></i>
						My Profile</a></li>
				<li><a href="#"><i class='bx bxs-message-rounded-edit'></i>
						Edit Profile</a></li>
				<li><a href="#"><i class='bx bx-help-circle'></i> Help</a></li>
				<li><a href="#"><i class='bx bx-log-out-circle'></i> Logout</a></li>
			</ul>
		</div>
	</div>
</nav>

<script>
	let usernameId = "";

	// function deleteOne(){
	//	window.location.href = "/category/delete/" + categoryId;
	//	return false;
	//}
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
