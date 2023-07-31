package com.usercontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.User;
import com.bean.Wishlist;
import com.dao.UserDao;
import com.dao.WishlistDao;


@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		String email = request.getParameter("email");
//		String password = request.getParameter("password");
		
		
		
		User u = UserDao.checkUser(request.getParameter("email"), request.getParameter("password"));
		
		if(u == null) {
			
			request.setAttribute("msg", "Invalid Email and Password");
			request.getRequestDispatcher("userlogin.jsp").forward(request, response);
			
		}else if(u.getUsertype().equals("user")) {
			
			HttpSession session =  request.getSession();
			List<Wishlist> w_list = WishlistDao.getWishlistByUser(u.getId());
			session.setAttribute("wishlist_count", w_list.size());
			session.setAttribute("u", u);
			response.sendRedirect("index.jsp");
			
		}else {
			
			HttpSession session =  request.getSession();
			session.setAttribute("u", u);
			response.sendRedirect("seller_index.jsp");
		}
	}

}
