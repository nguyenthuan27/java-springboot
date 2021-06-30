<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class=" cart">
	<table>
		<tr>
			<th>Tên sản phẩm</th>
			<th>Giá</th>
			<th>Ngày mua</th>
			<th>Số lượng</th>
			<th>Trạng thái</th>
		</tr>
		<tbody>
			<c:forEach var="item" items="${listmycart}">
				
				<tr>
					<td>${item.name}</td>
					<td>${item.priceproduct}</td>
					<td>${item.createDate}</td>
					<td>${item.countquantity}</td>
					<td>${item.statusde }</td>
				</tr>
				
			
			</c:forEach>
		</tbody>

	</table>


</div>