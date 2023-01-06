<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Digital Vision-Register</title>
<link href="../css/changes.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="header.html" %>
	



<div class="container">
            <div class="row justify-content-center py-5 mt-5">
                <div class="col col-12 col-md-8">
                    <form action="./RegisterSrv" method="post" class="d-lg-flex flex-column justify-content-center" style="padding: 40px;background: #ffffff;box-shadow: 0px 0px 1px rgb(84,84,84);">
                    
                       <!--  <p style="color:#078747;" id="message"></p> -->
                        
                        <%
								String msg="";
								if(request.getAttribute("message")!=null)
								{%>
									<p style="color:#078747;" ><%=request.getAttribute("message") %></p>
														
								<%}
						%>
                        
                        <h1 class="login-heading">New here?</h1>
                        <p class="login-para">Signing up is easy. It only takes a few steps<br></p>
                        <div class="form-row">
                            <div class="form-group col-md-6"><label style="color: rgb(50,50,50);">Name</label><input class="form-control" type="text" name="username" placeholder="name" required></div>
                            <div class="form-group col-md-6"><label style="color: rgb(50,50,50);">Email</label><input class="form-control" type="email" name="email" placeholder="email" style="width: px;" required></div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6"><label style="color: rgb(50,50,50);">Password</label><input class="form-control" type="password" name="password" placeholder="Password" required></div>
                            <div class="form-group col-md-6"><label style="color: rgb(50,50,50);">Postal Code</label><input class="form-control" type="number" name="pincode" placeholder="Postal Code" required></div>
                        </div>
                        
                        <!-- <div class="form-row">
                            <div class="form-group col-md-6"><label style="color: rgb(50,50,50);">Mobile No</label><input class="form-control" type="Phone" name="mobile" required></div>
                            <div class="form-group col-md-6"><label style="color: rgb(50,50,50);">Address</label><textarea class="form-control" name="address"  required></textarea></div>
                        </div> -->
                        
                        <div class="form-group"><label style="color: rgb(50,50,50);">Mobile No</label><input class="form-control" type="number" maxlength="10" name="mobile" placeholder="Mobile number" required></div>
                        <div class="form-group"><label style="color: rgb(50,50,50);">Delivery Address</label><textarea class="form-control" name="address"  required></textarea></div>
                        <div class="form-group"><label style="color: rgb(50,50,50);">Billing Address</label><textarea class="form-control" name="billaddress"  required></textarea></div>
                        
                        <div class="form-group"><button class="btn btn-success btn-block btn-login" type="submit" name="submit">&nbsp;Register</button></div>
                        <div class="form-group text-center"><a class="create-account-link" href="login.html">Already have an account? Login</a></div>
                    </form>
                </div>
            </div>
        </div>
	
	
	
	<%@ include file="footer2.html" %>
</body>
</html>