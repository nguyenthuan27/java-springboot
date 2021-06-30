<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/csshome.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/form.css" />
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<title>Thiết kế layout</title>
</head>
<body>
			<tiles:insertAttribute name="menu" />
			<tiles:insertAttribute name="body-trangchu" />
			<tiles:insertAttribute name="footer" />

	<script type="text/javascript"
		src="/WEB-INF/views/customer/layout/script.js">
	const navBar = document.querySelector(".nav");
	const navHeight = navBar.getBoundingClientRect().height;
	window.addEventListener("scroll", () => {
	  const scrollHeight = window.pageYOffset;
	  if (scrollHeight > navHeight) {
	    navBar.classList.add("fix-nav");
	  } else {
	    navBar.classList.remove("fix-nav");
	  }
	});
	</script>
</body>
</html>
