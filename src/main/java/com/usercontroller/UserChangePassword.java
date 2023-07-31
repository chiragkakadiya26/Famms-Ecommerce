package com.usercontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.User;
import com.dao.UserDao;


@WebServlet("/UserChangePassword")
public class UserChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String opassword = request.getParameter("opassword");
		String npassword = request.getParameter("npassword");
		String cpassword = request.getParameter("cpassword");
		
		HttpSession session = request.getSession();
		
		User u = (User)session.getAttribute("u");
		
		if(u.getPassword().equals(opassword)) {
			
			if(npassword.equals(cpassword)) {
				
				UserDao.changePassword(u.getEmail(), npassword);
				response.sendRedirect("logout.jsp");
				
			}else {
				
				request.setAttribute("msg", "New Password And Confirm Password Dosen't Match");
				request.getRequestDispatcher("changepassword.jsp").forward(request, response);
			}
			
		}else {
			
			request.setAttribute("msg", "Old Password Is Incorrect");
			request.getRequestDispatcher("changepassword.jsp").forward(request, response);
			
		}
	}

}
