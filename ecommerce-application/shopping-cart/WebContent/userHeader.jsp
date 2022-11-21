<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.digitalvision.dao.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<title>Digital Vision</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
   
    <link rel="stylesheet" href="css/changes.css">
    
 <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
  <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> -->
  
  	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins&amp;display=swap">
    
  
    <link rel="stylesheet" href="assets/css/Navigation-Clean.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/c66e84566e.js" crossorigin="anonymous"></script>
    
    
</head>
<body>

	<%
		 
		int notf = new CartDaoImpl().getCartCount((String)session.getAttribute("username"));
	
	%>
	
<!--Company Header Starting  -->
<!-- <div class="jumbotron text-center">
  <h1>Digital Vision</h1>
  <p>Mobile Solution Provider</p>
  <form class="form-inline">
    <div class="input-group">
      <input type="text" class="form-control" size="50" placeholder="Search Items" required>
      <div class="input-group-btn">
        <button type="button" class="btn btn-danger">Search</button>
      </div>
    </div>
  </form>
  <p  align="center" style="color:blue;font-weight:bold;margin-top:15px;margin-bottom:-15px;" id="message"></p>
</div> -->
<!-- Company Header Ending -->



<!-- Starting Navigation Bar -->
<%-- <nav class="navbar navbar-default navbar-fixed-top">
	
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="userHome.jsp"><span class="glyphicon glyphicon-home">&nbsp;</span>Shopping Center</a>  
	</div>      
	
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
              <li><a href="userHome.jsp"><span class="glyphicon glyphicon-home">Home</span></a></li>
<!--         <li><a href="./ProfileSrv">Profile</a></li> -->
			<% 
				if(notf == 0) {
				
			%>
			
			<li> <a href="cartDetails.jsp" style="margin:0px;padding:0px;" id="mycart"><i class="fa fa-shopping-cart fa-3x icon-white" style="background-color:#333;margin:0px;padding:0px; margin-top:5px;" > 
 </i>Cart</a></li>
			
			<%
				}
				else{
			%>
         <li> <a href="cartDetails.jsp" style="margin:0px;padding:0px;" id="mycart"><i data-count="<%=notf %>" class="fa fa-shopping-cart fa-3x icon-white badge" style="background-color:#333;margin:0px;padding:0px; margin-top:5px;" > 
 </i>Cart</a></li>
 				<% 
 					} 
 				%>
 
 		
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">CATEGORIES
            <span class="caret"></span>
          </a>
          <ul class="dropdown-menu">
            <li><a href="userHome.jsp">Mobiles</a></li>
            <li><a href="userHome.jsp">Tvs</a></li>
            <li><a href="userHome.jsp">Laptops</a></li>
          </ul>
        </li>
        <li><a href="userWishList.jsp">WISH LIST</a></li>
        <li><a href="userHome.jsp">Profile</a></li>
        <li><a href="./LogoutSrv">Logout</a></li>
<!--         <li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
 -->      </ul>
    </div>
  </div>
</nav> --%>



<!-- newly added -->
<nav class="navbar navbar-light navbar-expand-lg fixed-top navigation-clean">
        <div class="container"><a class="navbar-brand" href="userHome.jsp" style="font-size: 15px;letter-spacing: 2px;">Digital Vision</a><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav ml-auto">
                
                	<% 
				if(notf == 0) {
				
					%>
                
                    <li class="nav-item"><a class="nav-link" href="cartDetails.jsp" id="mycart"><span class="fa-sharp fa-solid fa-cart-shopping"></span>&nbsp;cart </a></li>
                    
                    <%
						}
						else	{
					%>
					
					 <li class="nav-item"><a class="nav-link" href="cartDetails.jsp" id="mycart"><i class="fa fa-shopping-cart" aria-hidden="true"></i><i data-count="<%=notf %>" class="badge" aria-hidden="true"> </i></a></li>
					 
					 <% 
 						} 
 					 %>
					 
                    
                    <li class="nav-item dropdown"><a class="dropdown-toggle nav-link" aria-expanded="false" data-toggle="dropdown" href="#">products</a>
                        <div class="dropdown-menu"><a class="dropdown-item" href="userHome.jsp">Mobiles</a><a class="dropdown-item" href="userHome.jsp">tv's</a><a class="dropdown-item" href="userHome.jsp">Laptops</a></div>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="userWishList.jsp">Wish List</a></li>
                    <li class="nav-item"><a class="nav-link" href="userOrders.jsp">My Orders</a></li>
                    <li class="nav-item"><a class="nav-link" href="userHome.jsp">Profile</a></li>
                    <li class="nav-item"><a class="nav-link" href="./LogoutSrv">logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
    <section id="digital-header" style="background: url(&quot;assets/img/mesh-back-5.jpg&quot;) bottom / cover no-repeat;height: 50vh;">
        <div class="container d-flex flex-column justify-content-center align-items-center" style="height: 100%;max-width: 960px;">
            <h1 style="font-size: 50px;color: rgb(91,89,89);">Digital Vision</h1>
            <p>providing high quality digital products</p>
            <form>
                <div class="input-group">
                    <input class="form-control" type="text">
                    <div class="input-group-append"><button class="btn btn-success" type="button">Go!</button></div>
                </div>
            </form>
 		<p  align="center" style="color:blue;font-weight:bold;margin-top:15px;" id="message"></p>           
        </div>
        
    </section>

	<script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>