<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.digitalvision.dao.*,com.digitalvision.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Order Confirmation</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 
   <link rel="stylesheet" href="css/changes.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
  

</head>
<body onload="myFunction()">

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


<%@ include file="userHeader2.jsp" %>


<section id="table" style="margin-top:100px;">
        <div class="container">
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Picture</th>
                            <th>Product</th>
                            <th>Price</th>
                            <th>Quantity</th>
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
                            <td><%=currAmount %></td>
                        </tr>
                        <tr></tr>
    
 					
		
			
     		
<%
  		} 
			}
  %>
  
  					</tbody>
                </table>
			</div>
  
  <%
  
  	String username = (String)session.getAttribute("username");
  	String userAddress = new UserDaoImpl().getUserAddr(username);
  
  	
  		
  %>
  
  
  
  
  <div class="row py-5">
                <div class="col">
                    <form>
                        
                        <div class="form-row row-cols-1 row-cols-sm-2 py-1">
                            <div class="col"><label class="col-form-label">Rs : 100 charge for change the delivery address</label></div>
                            <div class="col"><input type="checkbox" name="checkAddress" id="chkAddress" onclick="EnableDisableTextBox(this)" value="addressNew"><label>&nbsp; add different shipping address</label></div>
                        </div>
                        <div class="form-row row-cols-1 row-cols-sm-2 py-1">
                            <div class="col"><label class="col-form-label">Shipping Address&nbsp; &nbsp; &nbsp;:</label></div>
                            <div class="col"><textarea class="form-control" name="txtaddress" rows="5" id="txtAddress"  ><%=userAddress %></textarea></div>
                        </div>
                        <div class="form-row row-cols-1 row-cols-sm-2 py-1">
                            <div class="col"><label class="col-form-label">Product Amount to Pay :</label></div>
                            <div class="col"><input class="form-control" id="productAmount" type="text" value="<%=totAmount %>" style="text-align: right;" name="amount" readonly=""></div>
                        </div>
                         <div class="form-row row-cols-1 row-cols-sm-2 py-1">
                            <div class="col"><label class="col-form-label">Delivery Charges :</label></div>
                            <div class="col"><input class="form-control" id="deleveryCharge" type="text" value="0" style="text-align: right;" name="amount" readonly=""></div>
                        </div>
                        <div class="form-row row-cols-1 row-cols-sm-2 py-1">
                            <div class="col"><label class="col-form-label">Total Amount :</label></div>
                            <div class="col"><input class="form-control" type="text" id="totalAmount" value="0" style="text-align: right;" name="Totalamount" readonly=""></div>
                        </div>
                        <div class="form-row row-cols-1 row-cols-sm-2 py-3">
                            <div class="col mb-2"><a href= cartDetails.jsp><button class="btn btn-warning btn-sm" type="button">back to cart</button></a></div>
                            <div class="col mb-2"><form method="post"><button class="btn btn-success btn-sm"  formaction="payment.jsp?amount=<%=totAmount %>?txtaddress=<%=userAddress%>">pay now</button></form></div>
                        </div>
                    </form>
                </div>
            </div>


	


 		 </div>
  </section> <!-- section end -->

<!-- ENd of Product Items List -->


<!-- added table -->


  
  <script type="text/javascript">
  
    function EnableDisableTextBox(chkAddress) {
        var txtShipAddress = document.getElementById("txtAddress");
        
        var txtProdAmount = parseFloat(document.getElementById("productAmount").value);
             
       	var user;
       	 
       	user = '<%=new UserDaoImpl().getUserAddr(username) %>';
             
        txtShipAddress.disabled = chkAddress.checked ? false : true;
        
        if (!txtShipAddress.disabled) {
        	txtShipAddress.focus();
        	
        	var totalamount=txtProdAmount+100;
        	document.getElementById("totalAmount").value = totalamount;	
        	document.getElementById("deleveryCharge").value = 100 ;
        	      	
        }
        
        else{
        	
        	document.getElementById("totalAmount").value = txtProdAmount;    	
        	document.getElementById("deleveryCharge").value = 0;
        	document.getElementById("txtAddress").value=user;
        	
        	txtShipAddress.disabled = chkAddress.checked ? false : false;
        }
    }
    
    
    function myFunction(){
    	
    	 var txtProdAmount = parseFloat(document.getElementById("productAmount").value);
    	 document.getElementById("totalAmount").value = txtProdAmount; 
    }
    
    
</script>





</body>
</html>