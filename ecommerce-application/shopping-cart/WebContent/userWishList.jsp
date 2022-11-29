<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.digitalvision.dao.*,com.digitalvision.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Digital Vision</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
  
</head>
<body>

	<%
	/* Checking the user credentials */
		String userName = (String)session.getAttribute("username");
		String password = (String)session.getAttribute("password");
	
		if(userName == null || password==null){
	
			response.sendRedirect("loginFirst.jsp");
		}	
		
		
	%>



<%@ include file="userHeader.jsp" %>

	

<div class="container">	<!-- Start of new Product Items List -->

		<div class="row row-cols-1 row-cols-md-2 row-cols-lg-4">
		
		
		
		<%
		WishListDao wishlist = new WishListDaoImpl();
	  	
	  	List<WishListBean> items = new ArrayList<WishListBean>();
	  	
	  	items = wishlist.getList(userName);
	  	
	  	for(WishListBean list : items){
	  	
	  		String prodId = list.getPid();

			ProductBean product = new ProductDaoImpl().getProductDetails(prodId);
		
  		
  	%>
		
                <div class="col mb-1">
                    <div class="card">
                        <div style="padding: 5px;"><img src="./ShowImage?pid=<%=product.getProdId() %>" style="width: 200px;height: 150px;"></div>
                        <div class="card-body">
                            <h4 class="card-title"><%=product.getProdName() %> </h4>
                            <h6 class="text-muted card-subtitle mb-2"><%=product.getProdInfo() %></h6>
                            <p class="card-text">Rs <%=product.getProdPrice() %></p>
                            <form method="post">
                                <div class="btn-group btn-group-sm" role="group"><button class="btn btn-success" type="submit" formaction="./AddtoCart?uid=<%=userName %>&pid=<%=product.getProdId() %>&pqty=1" style="font-size: 12px;margin-right: 5px;">add to cart</button><a class="btn btn-dark btn-sm" role="button" href="#" style="font-size: 12px; margin-right: 5px;">check out</a>
                                
                                <a href="./AddtoWishList?uid=<%=userName %>&pid=<%=product.getProdId()%>&type=removeFromList"><i class="fa fa-heart fa-heart fa-2x" style="cursor:pointer;"></i></a>
                                
                                                         
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                
                
      <%}%>
               
                          
   </div>

</div><!-- ENd of new Product Items List -->


<%@ include file="footer2.html" %>

</body>
</html>