package com.digitalvision.srv;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.digitalvision.beans.DemandBean;
import com.digitalvision.beans.ProductBean;
import com.digitalvision.beans.WishListBean;
import com.digitalvision.dao.CartDaoImpl;
import com.digitalvision.dao.DemandDaoImpl;
import com.digitalvision.dao.ProductDaoImpl;
import com.digitalvision.dao.UserDaoImpl;
import com.digitalvision.dao.WishListDao;
import com.digitalvision.dao.WishListDaoImpl;

/**
 * Servlet implementation class AddtoCart
 */
@WebServlet("/AddtoWishList")
public class AddtoWishListSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public AddtoWishListSrv() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		HttpSession session = request.getSession();
		String userName = (String)session.getAttribute("username");
		String password = (String)session.getAttribute("password");
	
		if(userName == null || password==null){
	
			response.sendRedirect("loginFirst.jsp");
		}	
		
		//login Check Successfull
		
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		
		String username = userName;
		String prodId = request.getParameter("pid");		
		String status="Product added failed to the wishlist";
		
		WishListBean wishList = new WishListBean();
		WishListDao list = new WishListDaoImpl();
		
		wishList.setPid(prodId);
		
		boolean isAdded=list.isAvailable(username,prodId);
		
		if(isAdded==false)
		{
			status=list.addItemtoWishList(username,prodId);
			
		}
		else
		{
			status="Product alredy added to the wishlist";
		}
		
		
		System.out.print(status);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
