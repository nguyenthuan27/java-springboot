
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css" />
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/form.css" />
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<title>Assiment Java 5</title>
</head>
<body>

 
<tiles:insertAttribute name="sidebar" />
			<section class="home-section">
				<tiles:insertAttribute name="nav" />
				<div class="home-content">
					<tiles:insertAttribute name="body" />
				</div>
			</section>

	<script>
		function myFunction() {
			var dropdownContent = document.querySelector('.dropdown-content');
			dropdownContent.classList.toggle('dropdown-toggle');
		}
		const openPopups = document.getElementsByClassName("open-popup-btn");
	    for(let idx= 0; idx < openPopups.length; idx++) {
	        openPopups[idx].addEventListener("click", () => {
	            document.getElementsByClassName("popup")[0].classList.add("active");
	        })
	    }
	    document.getElementById("dismiss-popup-btn").addEventListener("click", function () {
	    	console.log("CANCEL")
	        document.getElementsByClassName("popup")[0].classList.remove("active");
	    });
	</script>
</body>
</html>