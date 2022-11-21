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
	
  <%-- <div class="products" style="background-color: #E6F9E6;">
	
	<div class="tab" align="center" style="color:brown;">
			<%=request.getAttribute("message") %>
	</div>
	<br>
	
  	<div class="tab"  align="center">
    
    <div style="margin: 5px">
      
        <form action="./RegisterSrv" method="post">
          <table border="0">
            <tr><td>Name: </td><td><input type="text" name="username"style="font-size: 15px;font-weight: normal; width:100%" required></td></tr>
            <tr><td><br></td><td><br></td></tr>
            <tr><td>Mobile No.&nbsp;</td><td><input type="Phone" name="mobile"style="font-size: 15px;font-weight: normal;" required></td></tr>
            <tr><td><br></td><td><br></td></tr>            
            <tr><td>Email Id</td><td><input type="email" name="email"style="font-size: 15px;font-weight: normal;" required></td></tr>
            <tr><td><br></td><td><br></td></tr>
            <tr><td>Address</td><td><textarea name="address"style="font-size: 15px;font-weight: normal;width: 100%; height: 80px" required></textarea></td></tr>
            <tr><td><br></td><td><br></td></tr>
            <tr><td>PinCode</td><td><input type="text" name="pincode"style="font-size: 15px;font-weight: normal;" required></td></tr>
            <tr><td><br></td><td><br></td></tr>
            <tr><td>Password</td><td><input type="password" name="password"style="font-size: 15px;font-weight: normal;" required></td></tr>
            <tr><td><br></td><td><br></td></tr>
            <tr colspan="2" align="center"><td>&nbsp;</td><td><input type="submit" name="submit" value="Register"></td></tr>

          </table>
        
        </form>
    </div>  
  </div>
  <div class="tab" style="margin-top: 10px;text-align: center">
      <a href="login.html">Registered User Login Here</a>

  </div>
  
</div> --%>


<div class="container">
            <div class="row justify-content-center py-5 mt-5">
                <div class="col col-12 col-md-8">
                    <form action="./RegisterSrv" method="post" class="d-lg-flex flex-column justify-content-center" style="padding: 40px;background: #ffffff;box-shadow: 0px 0px 1px rgb(84,84,84);">
                         <p style="color:#078747;" ><%=request.getAttribute("message") %></p>
                        <h1 class="login-heading">New here?</h1>
                        <p class="login-para">Signing up is easy. It only takes a few steps<br></p>
                        <div class="form-row">
                            <div class="form-group col-md-6"><label style="color: rgb(50,50,50);">Name</label><input class="form-control" type="text" name="username" placeholder="name" required></div>
                            <div class="form-group col-md-6"><label style="color: rgb(50,50,50);">Email</label><input class="form-control" type="email" name="email" placeholder="email" style="width: px;" required></div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6"><label style="color: rgb(50,50,50);">Password</label><input class="form-control" type="password" name="password" placeholder="Password" required></div>
                            <div class="form-group col-md-6"><label style="color: rgb(50,50,50);">Postal Code</label><input class="form-control" type="text" name="pincode" placeholder="Postal Code" required></div>
                        </div>
                        
                        <!-- <div class="form-row">
                            <div class="form-group col-md-6"><label style="color: rgb(50,50,50);">Mobile No</label><input class="form-control" type="Phone" name="mobile" required></div>
                            <div class="form-group col-md-6"><label style="color: rgb(50,50,50);">Address</label><textarea class="form-control" name="address"  required></textarea></div>
                        </div> -->
                        
                        <div class="form-group"><label style="color: rgb(50,50,50);">Mobile No</label><input class="form-control" type="Phone" name="mobile" placeholder="Mobile number" required></div>
                        <div class="form-group"><label style="color: rgb(50,50,50);">Address</label><textarea class="form-control" name="address"  required></textarea></div>
                        
                        
                        <div class="form-group"><button class="btn btn-success btn-block btn-login" type="submit" name="submit">&nbsp;Register</button></div>
                        <div class="form-group text-center"><a class="create-account-link" href="login.html">Already have an account? Login</a></div>
                    </form>
                </div>
            </div>
        </div>
	
	
	
	<%@ include file="footer2.html" %>
</body>
</html>