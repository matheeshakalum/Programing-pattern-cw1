package com.digitalvision.utility;

import javax.mail.MessagingException;

public class MailMessage {
	public static void registrationSuccess(String emailId,String name){
		String recipient = emailId;
		String subject = "Registration Successfull";
		String htmlTextMessage = ""
				+ "<html>"
				+ "<body>"
				+ "<h2 style='color:red;'>Welcome to Digital Vision</h2>"
				+ ""
				+ "Hi "+name+","
				+ "<br><br>Thanks for singing up with Digital Vision<br>"
				+ "We are glad that you choose us. We invite you to check out our latest collection of new electonics appliances. <br>"
				+ "Have a good day!<br>"
				+ ""
				+ "</body>"
				+ "</html>";
				try {
					JavaMailUtil.sendMail(recipient,subject,htmlTextMessage);
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	}
	public static void transactionSuccess(String recipientEmail,String name,String transId,double transAmount) {
		String recipient = recipientEmail;
		String subject = "Order Placed at Digital Vision";
		String htmlTextMessage = 
				"<!DOCTYPE html>"+
				"<html>" +
				"<head>"+
				"<meta charset=\"utf-8\">"+
				"<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, shrink-to-fit=no\">"+
				"<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css\" integrity=\"sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N\" crossorigin=\"anonymous\">" +
				"</head>"+
				
				"<body>" + 
				"<div class=\"container\">"+
				"<div class=\"card\" style=\"width: 18rem;\">"+
				"<img src=\"https://source.unsplash.com/user/c_v_r/1900x800\" class=\"card-img-top\" alt=\"...\" style=\"width:400px; height:200px\"> " +
				
				"<div class=\"card-body\">"+
				"<h3 class=\"card-title\" style=\"color: #696969\">Digital Vision</h3>" +
				"<p style=\"color: #696969\">" + "hi " + name +"</p>" +
				"<p class=\"card-text lead\" style=\"color: #696969\">We are happy that you shop with Digital Vision!</p>" +
				"<p style=\"color: #696969\">Your order has been placed successfully and under process to be shipped.</p>" +
				"</div>" +
				
 				"<hr>" +
 				
				"<div class=\"card-body\">" +
				"<p style=\"color:green;\">Here is Your Transaction Details</p>"+
				"<p style=\"color:#1f7ef2;\">" + "Order Id : " + transId + "</p>" +
				"<p style=\"color:green;\">" + "Amount Paid : " + transAmount + "</p>" +
				"<p style=\"color: #696969\"> Thanks for shopping with us! <br> Come Shop Again! <br> Digital vision.</p>" +
				"</div>"+
				
				"<hr>" +
				
				"<div class=\"card-body\">" +
				"<p style=\"color: #696969\"> Digital vision - Colombo road, Godagama. <br> Tel : +94772654783 </p>" +
				"</div>"+
				
				"</div>" +
				
				"</div>" +
				
				"</body>" +
				
				"</html>";
				
		
		
		try {
			JavaMailUtil.sendMail(recipient,subject,htmlTextMessage);
		}
		catch(MessagingException e) {
			e.printStackTrace();
		}
	}
	
	public static void productAvailableNow(String recipientEmail,String name,String prodName, String prodId) {
		String recipient = recipientEmail;
		String subject = "Product "+prodName+" is Now Available at Digital Vision";
		String htmlTextMessage = 
				"<html>" + 
				"  <body>" + 
				"    <p>" + 
				"      Hey "+name+",<br/><br/>" + 
				"      We are glad that you shop with Digital Vision!" + 
				"      <br/><br/>" + 
				"      As per your recent browsing history, we seen that you were searching for an item that was not available in sufficient amount"
				+ " at that time. <br/><br/>"
				+ "We are glad to say that the product named <font style=\"color:green;font-weight:bold;\">"+prodName+"</font> with "
						+ "product Id <font style=\"color:green;font-weight:bold;\">"+prodId+"</font> is now available to shop in our store!"
				+ 		"<br/><h6>Please Note that this is a demo projet Email and you have not made any real transaction with us and not ordered anything till now!</h6>" + 
				"      <br/>" + 
				"      Here is The product detail which is now available to shop:<br/>" + 
				"      <br/>" + 
				"      <font style=\"color:red;font-weight:bold;\">Product Id: </font><font style=\"color:green;font-weight:bold;\">" +prodId+" "+
				"      </font><br/>" + 
				"      <br/>" + 
				"      <font style=\"color:red;font-weight:bold;\">Product Name: </font> <font style=\"color:green;font-weight:bold;\">"+prodName+"</font>" + 
				"      <br/><br/>" + 
				"      Thanks for shopping with us!<br/><br/>" + 
				"      Come Shop Again! <br/<br/><br/> <font style=\"color:green;font-weight:bold;\">Digital Vision</font>" + 
				"    </p>" + 
				"    " + 
				"  </body>" + 
				"</html>";
		
		try {
			JavaMailUtil.sendMail(recipient,subject,htmlTextMessage);
		}
		catch(MessagingException e) {
			e.printStackTrace();
		}
	}
	
	
}
