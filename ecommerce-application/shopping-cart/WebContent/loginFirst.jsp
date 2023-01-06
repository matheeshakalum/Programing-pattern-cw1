<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Denied</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

	<%@ include file="header.html" %>
	
	<!-- <div class="product">
	
		<div class="tab" align="center" style="color:red">
			
			<h1>Login Credentials Failed, Please Login First!</h1>
		
		</div>
	</div>
	 -->
	 
<!-- <div class="products" style="background-color: #E6F9E6;">

	<p class="tab"  align="center" style="color:brown;" id="message">Login Credential Failed, Please Login First!</p><br>
  <div class="tab"  align="center">
    
    <div style="margin: 5px">
      
        <form action="./LoginSrv" method="post">
          Username: <input type="text" name="username"style="font-size: 15px;font-weight: normal;" placeholder="Enter Email-Id" required><br/><br/>
          Password: <input type="password" name="password"style="font-size: 15px;font-weight: normal;" placeholder="Enter Password" required><br/><br/>
          Login As: <select name="usertype" style="font-size: 16px;" required>
                      <option value="customer">Customer</option>
                      <option value="admin">Admin</option>
                    </select> 
                    &nbsp;&nbsp;
                    <input type="submit" value=" Login ">
        </form>
    </div>  
  </div>
  <div class="tab" style="margin-top: 10px;text-align: center">
      <a href="register.html">New User ? Register Here</a>

  </div>
</div> -->



<!-- login start -->
<div class="container">
            <div class="row justify-content-center py-5 mt-5">
                <div class="col col-12 col-md-6">
                    <form action="./LoginSrv" method="post" class="d-lg-flex flex-column justify-content-center" style="padding: 40px;background: #ffffff;box-shadow: 0px 0px 1px rgb(84,84,84);">
                        
                        <p style="color:#b0b0b0;" id="message">Login  Failed, Please Login First!</p>
                        <h1 class="login-heading">Hello! let's get started</h1>
                        <p class="login-para">Sign in to&nbsp; continue.</p>
                        <div class="form-group"><input class="form-control" type="email" name="username" placeholder="email" style="width: px;" required></div>
                        <div class="form-group"><input class="form-control" type="password" name="password" placeholder="Password" required></div>
                        
                        <div class="form-group"><select class="form-control" name="usertype"  required>
                        					<option value="">Select user type..</option>
                      						<option value="customer">Customer</option>
                      						<option value="admin">Admin</option>
                   							 </select> </div>
                        
                        <div class="form-group"><button class="btn btn-success btn-block btn-login" type="submit">&nbsp; Log in</button></div>
                        
                        <div class="form-group text-center"><a class="create-account-link" href="register.html">Don't have an account? create</a></div>
                    </form>
                </div>
            </div>
        </div>

<!-- login end -->
	
	<%@ include file="footer2.html" %>

</body>
</html>