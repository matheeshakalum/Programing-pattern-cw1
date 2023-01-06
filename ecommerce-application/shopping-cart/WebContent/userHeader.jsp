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
                    <li class="nav-item"><a class="nav-link" href="./LogoutSrv">logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
    <section id="digital-header" style="background: url(&quot;assets/img/mesh-back-5.jpg&quot;) bottom / cover no-repeat;height: 50vh;">
        <div class="container d-flex flex-column justify-content-center align-items-center" style="height: 100%;max-width: 960px;">
            <h1 style="font-size: 50px;color: rgb(91,89,89);">Digital Vision</h1>
            <p>providing high quality digital products</p>
           <!--   <form>
                <div class="input-group">
                    <input class="form-control" type="text">
        
                    
                    <div class="input-group-append"><button class="btn btn-success" type="button">Go!</button></div>
                </div>
            </form>  -->
             <form>
              <div class="input-group">
                    <input class="form-control" id="searchProductUser" type="text" name="searchProductUser">
                    <div class="input-group-append"><a ><button class="btn btn-success" style="margin-left: 8px !important" onClick="searchProduct()">Go!</button></a></div>
                </div>
                </form>
 		<p  align="center" style="color:blue;font-weight:bold;margin-top:15px;" id="message"></p>           
        </div>
        
    </section>
    

	<script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>