<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins&amp;display=swap">
<link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
<link rel="stylesheet" href="assets/fonts/ionicons.min.css">
<link rel="stylesheet" href="assets/css/Footer-Clean.css">
<link rel="stylesheet" href="assets/css/Navigation-Clean.css">
<link rel="stylesheet" href="assets/css/styles.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/c66e84566e.js"
	crossorigin="anonymous"></script>

</head>
<body>

	<!-- Starting Navigation Bar -->
	<!-- <nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.jsp"><span class="glyphicon glyphicon-home">&nbsp;</span>Shopping Center</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="login.html">Login</a></li>
        <li><a href="register.html">Register</a></li>
        <li><a href="loginFirst.jsp"> <span class="glyphicon glyphicon-shopping-cart"></span>Cart html</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">CATEGORIES
            <span class="caret"></span>
          </a>
          <ul class="dropdown-menu">
            <li><a href="index.jsp">Mobiles</a></li>
            <li><a href="index.jsp">Tvs</a></li>
            <li><a href="index.jsp">Laptops</a></li>
          </ul>
        </li>
        <li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
      </ul>
    </div>
  </div>
</nav> -->
	<!-- End of Navigation Bar -->



	<nav
		class="navbar navbar-light navbar-expand-lg fixed-top navigation-clean">
		<div class="container">
			<a class="navbar-brand" href="index.jsp"
				style="font-size: 15px; letter-spacing: 2px;">Digital Vision</a>
			<button data-toggle="collapse" class="navbar-toggler"
				data-target="#navcol-1">
				<span class="sr-only">Toggle navigation</span><span
					class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navcol-1">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="loginFirst.jsp"><span
							class="fa-sharp fa-solid fa-cart-shopping"></span>&nbsp;cart </a></li>
					<li class="nav-item dropdown"><a
						class="dropdown-toggle nav-link" aria-expanded="false"
						data-toggle="dropdown" href="#">products</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="index.jsp">Mobiles</a><a
								class="dropdown-item" href="index.jsp">tv's</a><a
								class="dropdown-item" href="index.jsp">Laptops</a>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="register.html">register</a></li>
					<li class="nav-item"><a class="nav-link" href="login.html">login</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<section id="digital-header"
		style="background: url(assets/img/mesh-back-5.jpg) bottom/cover no-repeat; height: 50vh;">
		<div
			class="container d-flex flex-column justify-content-center align-items-center"
			style="height: 100%; max-width: 960px;">
			<h1 style="font-size: 50px; color: rgb(91, 89, 89);">Digital
				Vision</h1>
			<p>providing high quality digital products</p>
			<form>
				<div class="input-group">
					<input class="form-control" type="text">
					<div class="input-group-append">
						<button class="btn btn-success" type="button">Go!</button>
					</div>
				</div>
			</form>
		</div>
	</section>


	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>