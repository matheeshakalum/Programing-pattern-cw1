<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.digitalvision.dao.*,com.digitalvision.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Online Shopping Card</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  

  
  
  	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins&amp;display=swap">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/Footer-Clean.css">
    <link rel="stylesheet" href="assets/css/Navigation-Clean.css">
    <link rel="stylesheet" href="assets/css/styles.css">
  
</head>
<body>

	<%
	/* Checking the user credentials */
		String userName = (String)session.getAttribute("username");
		String password = (String)session.getAttribute("password");
	
		if(userName == null || password==null){
	
			response.sendRedirect("loginFirst.jsp");
		}	
		
		String sAmount = request.getParameter("amount");
		
		String totalAmount = request.getParameter("Totalamount");
		
		String addresss = request.getParameter("txtaddress");
		
		double amount = 0;
		
		if(totalAmount != null){
			amount = Double.parseDouble(totalAmount);
		}
		
		
		
	%>


 <%@ include file="userHeader2.jsp" %>

<%-- <%@ include file="userHeader.jsp" %> --%>

	<!-- <script>document.getElementById('mycart').innerHTML='<i data-count="20" class="fa fa-shopping-cart fa-3x icon-white badge" style="background-color:#333;margin:0px;padding:0px; margin-top:5px;"></i>'</script>
 -->
<!-- Start of Product Items List -->

<%-- <div class="products" style="background-color: #E6F9E6;">
	<p class="tab"  align="center" style="color:brown;" id="message">Credit Card Payment</p>

  <div class="tab"  align="center">
    
    <div style="margin: 5px">
      
        <form action="./OrderServlet" method="post">
          <table border="0">
            <tr><td>Name on Card: </td><td><input type="text" name"cardname" style="font-size: 15px;font-weight: normal;" placeholder="John More Doe" required>
</td></tr>
            <tr><td><br></td><td><br></td></tr>
            <tr><td>Credit Card Number:</td><td><input type="number" name="ccnum"style="font-size: 15px; font-weight: normal;" placeholder="1111-2222-3333-4444" required></td></tr>
            <tr><td><br></td><td><br></td></tr>            
            <tr><td>Exp Month: </td><td><input type="number" name="expm"style="font-size: 15px; font-weight: normal;" placeholder="12" maxlength="2" required></td></tr>
            <tr><td><br></td><td><br></td></tr>
            <tr><td> CVV:</td><td><input type="number" name="cvv"style="font-size: 15px; font-weight: normal;" placeholder="325" maxlength="3" required></td></tr>
            <tr><td><br></td><td><br></td></tr>
            <tr><td>Exp Year: </td><td><input type="number" name="expyr"style="font-size: 15px; font-weight: normal;" placeholder="2026" maxlength="4" required></td></tr>
            <tr><td><br></td><td><input type="hidden" name="amount" value="<%=amount%>"/><br></td></tr>
            <tr colspan="2" align="center"><td>&nbsp;</td><td><input type="submit" name="submit" value="Pay :Rs <%=amount%>" style="background-color:red;color:white;"></td></tr>
		    <tr><td><br></td><td><input type="hidden" name="shippingaddress" value="<%=addresss%>"/><br></td></tr>
		     
		   
          </table>
        
        </form>
    </div>  
  </div>
 </div> --%>
 
 
 
 <section id="transaction">
        <div class="container">
            <div class="row py-5">
                <div class="col-8 offset-2 text-center">
                    <h1 style="font-size: 35px;">Online Transaction</h1>
                    <p style="font-size: 14px;">You can pay using debit or credit card payment here</p>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <form action="./OrderServlet" method="post">
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-8 offset-2">
                                    <form class="d-lg-flex flex-column justify-content-center" style="padding: 40px;background: #ffffff;box-shadow: 0px 0px 1px 0px rgb(84,84,84);letter-spacing: 1px;font-size: 14px;">
                                        <div class="form-group"><label style="color: rgb(50,50,50);">Name on card</label><input class="form-control form-control-sm" type="text" name="cardname" placeholder="card name" autocomplete="on"  required=""></div>
                                        <div class="form-group"><label style="color: rgb(50,50,50);">Card number</label><input class="form-control form-control-sm" type="number" name="ccnum" autocomplete="on" placeholder="1111-2222-3333-4444" required=""></div>
                                        <div class="form-group"><label style="color: rgb(50,50,50);">Expire month</label><input class="form-control form-control-sm" type="number" name="expm" autocomplete="on" placeholder="12" required=""></div>
                                        <div class="form-group"><label style="color: rgb(50,50,50);">Expire year</label><input class="form-control form-control-sm" type="number" name="expyr" placeholder="2026" autocomplete="on" required=""></div>
                                        <div class="form-group"><label style="color: rgb(50,50,50);">cvv</label><input class="form-control form-control-sm" type="number" name="cvv" placeholder="325" autocomplete="on" required=""></div>
                                        <div class="form-group"><label style="color: rgb(50,50,50);">Amount</label><input class="form-control form-control-sm" type="text" name="amount" value="<%=amount%>" required="" readonly=""></div>
                                        <div class="form-group"><label style="color: rgb(50,50,50);"></label><input class="form-control form-control-sm" type="hidden" name="shippingaddress" value="<%=addresss%>" required="" readonly=""></div>
                                        <div class="form-group"><button class="btn btn-success btn-block btn-login" type="submit" style="font-size: 14px;letter-spacing: 3px;">PAY NOW&nbsp;<i class="fa fa-chevron-circle-right"></i></button></div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row row-cols-1">
                <div class="col-8 offset-2 text-center">
                    <ul class="list-inline">
                        <li class="list-inline-item"><a class="btn btn-warning btn-sm" role="button" href="cartDetails.jsp"><i class="fa fa-shopping-cart"></i>&nbsp; Cart</a></li>
                        <li class="list-inline-item"><a class="btn btn-dark btn-sm" role="button" href="orderConfiramtion.jsp"><i class="fa fa-chevron-left"></i>&nbsp; Back</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </section>


    
    
<!-- ENd of Product Items List -->


<%-- <%@ include file="footer.html" %> --%>

</body>
</html>