<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="overview-boxes">
	<div class="box">
		<div class="right-side">
			<div class="box-topic">Số lượng danh mục</div>
			<div class="number">${ fn:length(itemleg) }</div>
		</div>
		<i class='bx bx-category cart'></i>
	</div>

</div>
<div class="popup center">
	<div class="title">Thông tin danh mục sản phẩm</div>
	<h4>${message}</h4>
	<form:form class="popup-form" action="category" method="post"
		modelAttribute="item">
		<div class="form-infor1">
			<div class="infor-input1">
				<div class="labler">
					<label for="">ID</label>
				</div>
				<form:input path="categoryId" name="categoryId" type="text"
					placeholder="Nhập mã danh mục" />
				<form:errors path="categoryId" />
			</div>
			<div class="infor-input1">
				<div class="labler">
					<label for="">Name</label>
				</div>
				<form:input path="name" name="name" type="text"
					placeholder="Nhập tên danh mục" />
					<form:errors path="name" />
			</div>

		</div>
		<div class="dismiss-btn">
			<button formaction="category/create">Insert</button>
			<button formaction="update">Update</button>
			<button type="button" onclick="deleteCategory(categoryId)">Delete</button>
			<button id="dismiss-popup-btn">Cancel</button>
		</div>
	</form:form>
</div>
<div class="qlcategory">
	<div class="qlcategory-action">
		<div class="insert-category open-popup-btn">Thêm mới</div>
		<form action="category" method="post" class="wrapper">
			<button class="searchbtn" >
				<i class='bx bx-search-alt-2'></i>
			</button>
			<input name="keywords" value="${keywords }" class="input" placeholder="Search.....">

		</form>
	</div>
	<div class="pane-table">
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${page.content}">
					<tr>
						<td>${item.categoryId}</td>
						<td>${item.name}</td>
						<td><a class="open-popup-btn" href="javascript:void(0)"
							onclick="update(${item.categoryId})"><i
								class='bx bxs-message-square-edit'></i></a> <a
							href="delete/${item.categoryId}"><i class='bx bxs-message-square-x'></i></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<div class="page-content">
	<div class="page-content-first">
		<a href="/admin/category?page=${page.number -1 }">First</a>
	</div>
	<a class="soluong">${page.number + 1 }</a>
	<div class="page-content-first">

		<a href="/admin/category?page=${page.number + 1 }">Next</a>
	</div>
</div>
<script>
	let categoryId = "";
    function deleteCategory(categoryId){
        $.ajax({
            url: 'http://localhost:8080/admin/category-demo/delete/'+categoryId,
            method: 'DELETE',
            success: function () {
                alert('Xoá thành công');
            },
            error: function (error) {
                alert(error);
            }
        })
    }
    function update(categoryId){
        $.ajax({
            url: 'http://localhost:8080/admin/category-demo/'+categoryId,
            method: 'GET',
            dataType: 'json',
            success: function (data) {
                $('#categoryId').val(data.categoryId);
                $('#name').val(data.name);
             	categoryId = categoryId;
            },
            error: function (error) {
                alert(error);
            }
        })
    }
	
	

</script>
