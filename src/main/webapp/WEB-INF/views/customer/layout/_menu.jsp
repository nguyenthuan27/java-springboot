<%@ page pageEncoding="utf-8"%>


<header id="home" class="header">
	<!-- Navigation -->
	<nav class="nav">
		<div class="navigation container">
			<div class="logo">
				<h1>Code ASM</h1>
			</div>

			<div class="menu">
				<div class="top-nav">
					<div class="logo">
						<h1>Codevo</h1>
					</div>
					<div class="close">
						<i class="bx bx-x"></i>
					</div>
				</div>

				<ul class="nav-list">
					<li class="nav-item"><a href="home"
						class="nav-link scroll-link">Home</a></li>
					<li class="nav-item"><a href="list-products" class="nav-link">Products</a>
					</li>
					<li class="nav-item"><a href="#about"
						class="nav-link scroll-link">About</a></li>
					<li class="nav-item"><a href="#contact"
						class="nav-link scroll-link">Contact</a></li>
					<li class="nav-item dropdown-item">
						<div class="nav-link scroll-link" onclick="myFunction()">Account</div>
						<div class="dropdown-content">
							<ul class="links">
								<li><a  href="profile"><i class="bx bx-user"
										aria-hidden="true"></i> My Profile :  ${sessionScope.username}</a></li>
								<li><a href="oderDetails"><i class='bx bxs-message-rounded-edit'></i>
										Đơn hàng của bạn</a></li>
								<li><a href="#"><i class='bx bx-help-circle'></i> Help</a></li>
								<li><a href="/logout"><i class='bx bx-log-out-circle'></i>
										Logout</a></li>
							</ul>
						</div>
					</li>
					<li class="nav-item"><a href="shopcart" class="nav-link icon"><i
							class="bx bx-shopping-bag"></i></a></li>
				</ul>
			</div>

			<a href="cart.html" class="cart-icon"> <i
				class="bx bx-shopping-bag"></i>
			</a>

			<div class="hamburger">
				F <i class="bx bx-menu"></i>
			</div>
		</div>
	</nav>

	<!-- Hero -->
<img src="//artist-mtp.png"
		style="height: 92%; padding-right: 100px" alt="" class="hero-img" /> -

	<div class="hero-content">
		<h2>
			<span class="discount">70% </span> SALE OFF
		</h2>
		<h1>
			<span>Summer Vibes</span> <span>mode on</span>
		</h1>
		<a class="btn" href="#">shop now</a>
	</div>
</header>

<script type="text/javascript">

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
	
	
		function myFunction() {
			var dropdownContent = document.querySelector('.dropdown-content');
			dropdownContent.classList.toggle('dropdown-toggle');
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