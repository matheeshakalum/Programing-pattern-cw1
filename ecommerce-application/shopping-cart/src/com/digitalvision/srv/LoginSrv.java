package com.digitalvision.srv;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.digitalvision.beans.UserBean;
import com.digitalvision.dao.UserDaoImpl;

/**
 * Servlet implementation class LoginSrv
 */
@WebServlet("/LoginSrv")
public class LoginSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public LoginSrv() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String userType = request.getParameter("usertype");
		
		PrintWriter pw = response.getWriter();
		
		response.setContentType("text/html");
		
		String status = "Login Denied! Invalid Username or password.";
		
		if(userType.equals("admin")){  //Login as Admin
			
			if(password.equals("Admin") && userName.equals("Admin")) {
				//valid
				
				RequestDispatcher rd = request.getRequestDispatcher("adminViewProduct.jsp");
				
				HttpSession session = request.getSession();
				
				session.setAttribute("username", userName);
				session.setAttribute("password", password);
				session.setAttribute("usertype", userType);
				
				rd.forward(request, response);
				
			}
			else {
				//Invalid;
				RequestDispatcher rd = request.getRequestDispatcher("login.html");
				
				rd.include(request, response);
				pw.println("<script>document.getElementById('message').innerHTML='"+status+"'</script>");
			}
			
			
		}
		else {  //Login as customer
			
			HttpSession session = request.getSession();
			int loginAttempt;
			boolean isLoginPossible=false;
			
            if (session.getAttribute("loginCount") == null)
            {
            	session.setAttribute("loginCount", 0);
                loginAttempt = 0;
            }
            else
            {
                loginAttempt = (Integer)session.getAttribute("loginCount");
              
            }
            System.out.print(loginAttempt);
            if (loginAttempt >= 2 )
            {
            	
                long lastAccessedTime =  session.getLastAccessedTime();
                Date date = new Date();
                long currentTime = date.getTime();
                long timeDiff = currentTime - lastAccessedTime;
                // 10 minutes in milliseconds
                if (timeDiff >= 600000)
                {
                    //invalidate user session, so they can try again
                	isLoginPossible=true;
                	session.setAttribute("loginCount", 0);
                }
                else
                {
                    // Error message
                    status="You have  exceeded the 3 failed login attempt. Please try loggin in in 10 minutes.";
                    isLoginPossible=false;
                }
                
            }
            else
            {
            	loginAttempt++;   
            	session.setAttribute("loginCount", loginAttempt);
            	isLoginPossible=true;
            }
			
			
			 if (isLoginPossible==true)
	         {
				 UserDaoImpl udao = new UserDaoImpl();
				 UserBean user = udao.getUserDetails(userName, password);
				 status = udao.isValidCredential(userName, password);

				 if(status.equalsIgnoreCase("valid")) {
					 //valid user
					 
					 session.setAttribute("userdata", user);
					 
					 session.setAttribute("username", userName);
					 session.setAttribute("password", password);
					 session.setAttribute("usertype", userType);
					 
					 session.setAttribute("loginCount", 0);
					 
//					 RequestDispatcher rd = request.getRequestDispatcher("userHome.jsp");
//					 rd.forward(request, response);
					 
					 response.sendRedirect("userHome.jsp");
					 
				 }
				 else {
					 //invalid user;
					RequestDispatcher rd = request.getRequestDispatcher("login.html");	
					rd.include(request, response);
					pw.println("<script>document.getElementById('message').innerHTML='"+status+"'</script>");
					 
					 
				 }
	         }
			 else
			 {
				RequestDispatcher rd = request.getRequestDispatcher("login.html");	
				rd.include(request, response);	
				pw.println("<script>document.getElementById('message').innerHTML='"+status+"'</script>");
			 }
			
			
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
