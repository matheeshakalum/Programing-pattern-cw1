<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.digitalvision.dao.*,com.digitalvision.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Digital Vision</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  

     	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      	<script src="https://kit.fontawesome.com/c66e84566e.js" crossorigin="anonymous"></script>
      
  
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

 
 <section id="items">
        <div style="background: #8d84f8;padding-top: 1px;padding-bottom: 1px;padding-left: 5px;padding-right: 5px;">
            <div class="row row-cols-1 row-cols-md-2" style="margin-right: 0px;margin-left: 0px;">
                <div class="col">
                    <ul class="list-inline text-center" style="color: rgb(255,255,255);padding-right: 5px;padding-left: 5px;padding-top: 0px;margin-top: 10px;">
                        <li class="list-inline-item" style="font-size: 13px;padding-right: 15px;color: rgb(224,224,224);"><i class="fa fa-envelope" style="color: rgb(228,228,228);font-size: 15px; background-color: transparent !important"></i>&nbsp; &nbsp;Email Us : digitalvision@gmail.com</li>
                        <li class="list-inline-item" style="font-size: 13px;padding-right: 10px;color: rgb(224,224,224);"><i class="fa fa-phone" style="color: rgb(228,228,228);font-size: 15px;background-color: transparent !important""></i>&nbsp; Call us : +94114569872</li>
                    </ul>
                </div>
                <div class="col">
                    <ul class="list-inline text-center" style="color: rgb(255,255,255);margin-bottom: 0px;margin-top: 10px;text-align: right;">
                        <li class="list-inline-item" style="padding-right: 10px;padding-left: 10px;"><i class="fa fa-facebook" style="background-color: transparent !important"></i></li>
                        <li class="list-inline-item" style="padding-right: 10px;padding-left: 10px;"><i class="fa fa-instagram"style="background-color: transparent !important"></i></li>
                        <li class="list-inline-item" style="padding-right: 10px;padding-left: 10px;"><i class="fa fa-twitter" style="background-color: transparent !important"></i></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row py-5">
                <div class="col-8 offset-2 text-center align-self-center">
                    <h1 style="color: rgb(91,89,89);">Best sellings</h1>
                    <p style="color: rgb(120,119,119);">Here are our best selling's products</p>
                </div>
            </div>
            
        </div>
    </section>
 
 
 


<div class="container">	<!-- Start of new Product Items List -->

		<div class="row row-cols-1 row-cols-md-2 row-cols-lg-4">
		
		
		
		<%
  	WishListDao wishlist = new WishListDaoImpl();
	
  	ProductDaoImpl prodDao = new ProductDaoImpl(); 
  	List<ProductBean> products = new ArrayList<ProductBean>();
  	products = prodDao.getAllProducts();
  	
  	for(ProductBean product : products){
  		
  	boolean isWishListAdded=wishlist.isAvailable(userName, product.getProdId()); 
  		
  	%>
		
                <div class="col mb-1">
                    <div class="card">
                        <div style="padding: 5px;"><img src="./ShowImage?pid=<%=product.getProdId() %>" style="width: 200px;height: 150px;"></div>
                        <div class="card-body">
                            <h4 class="card-title"><%=product.getProdName() %></h4>
                            <h6 class="text-muted card-subtitle mb-2"><%=product.getProdInfo() %></h6>
                            <p class="card-text">Rs <%=product.getProdPrice() %></p>
                            <form method="post">
                                <div class="btn-group btn-group-sm" role="group"><button class="btn btn-success" type="submit" formaction="./AddtoCart?uid=<%=userName %>&pid=<%=product.getProdId() %>&pqty=1" style="font-size: 12px;margin-right: 5px;">add to cart</button><a class="btn btn-dark btn-sm" role="button" href="#" style="font-size: 12px; margin-right: 5px;">check out</a>
                                <%if(isWishListAdded==true){%>
                                <a href="./AddtoWishList?uid=<%=userName %>&pid=<%=product.getProdId()%>&type=remove"><i class="fa fa-heart fa-heart fa-2x" style="cursor:pointer;"></i></a>
                                <%}else{%>
                                <a href="./AddtoWishList?uid=<%=userName %>&pid=<%=product.getProdId()%>&type=add"><i class="fa-regular fa-heart fa-2x" style="cursor:pointer;"></i></a>
                                 <%} %>
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