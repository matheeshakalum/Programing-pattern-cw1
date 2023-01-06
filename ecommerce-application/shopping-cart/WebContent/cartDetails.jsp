<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.digitalvision.dao.*,com.digitalvision.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>My Cart</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  
 	
   	<link rel="stylesheet" href="css/changes.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
</head>
<body>

	<%
	/* Checking the user credentials */
		String userName = (String)session.getAttribute("username");
		String password = (String)session.getAttribute("password");
	
		if(userName == null || password==null){
	
			response.sendRedirect("loginFirst.jsp");
		}	
		
		String addS = request.getParameter("add");
		if(addS!=null){
			
			int add = Integer.parseInt(addS);
			String uid = request.getParameter("uid");
			String pid = request.getParameter("pid");
			
			CartDaoImpl cart = new CartDaoImpl();

			if(add == 1){
				//Add Product into the cart
				cart.addProductToCart(uid, pid,1);
			}
			else if(add == 0){
				//Remove Product from the cart
				cart.removeProductFromCart(uid, pid);
			}
		}
		
	%>



<%@ include file="userHeader.jsp" %>


				
		<section id="table" style="margin-top:100px;">
        <div class="container">
            <div class="table-responsive">
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th>Picture</th>
                            <th>Product</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Add</th>
                            <th>Remove</th>
                            <th>Amount</th>
                        </tr>
                    </thead>
                    <tbody>
		
		
  	
<%
    
		CartDaoImpl cart = new CartDaoImpl();
		List<CartBean> cartItems= new ArrayList<CartBean>();
		cartItems = cart.getAllCartItems(userName);
		double totAmount = 0;
		for(CartBean item : cartItems){
			
			String prodId = item.getProdId();
			
			int prodQuantity = item.getQuantity();
	
			ProductBean product = new ProductDaoImpl().getProductDetails(prodId);
			
			double currAmount = product.getProdPrice()*prodQuantity;
			
			totAmount += currAmount;
			
			if(prodQuantity>0){
%>
  	
  	   
		
		
		
						<tr>
                            <td><img src="./ShowImage?pid=<%=product.getProdId() %>"  style="width:50px;height:50px;"></td>
                            <td><%=product.getProdName() %></td>
                            <td><%=product.getProdPrice() %></td>
                            <td><input class="form-control" type="number" name="pqty" value="<%= prodQuantity %>" style="max-width:70px;" min="0" readonly=""></td>
                            <td><a href="cartDetails.jsp?add=1&uid=<%=userName %>&pid=<%= product.getProdId()%>"><i class="fa fa-plus" style="background-color: transparent !important"></i></a></td>
                            <td><a href="cartDetails.jsp?add=0&uid=<%=userName %>&pid=<%= product.getProdId()%>"><i class="fa fa-minus" style="background-color: transparent !important"></i></a>
                            <td><%=currAmount %></td>
                        </tr>
                        <tr></tr>
    
 					
     		
<%
  		} 
			}
  %>
  
  	
    
    
    
    <tr ><td colspan="6" style="text-align:center;">Total Amount to Pay (in Rupees)</td><td><%=totAmount %></td></tr>
    <% if(totAmount !=0) {%>
    <tr ><td colspan="4" style="text-align:center;">
    	
    	<td><form method="post"><button formaction="userHome.jsp" class="btn btn-dark">Keep Shopping</button></form></td>
    	<td colspan="2" align="center"><form method="post"><button class="btn btn-success" formaction="orderConfiramtion.jsp">Confirm Order</button></form></td>
    
    	
    </tr>
    
    
    
    <%} %>
 


					</tbody>
                </table>
			</div>  		
<!-- ENd of Product Items List -->


<%@ include file="footer2.html" %>

</body>
</html>