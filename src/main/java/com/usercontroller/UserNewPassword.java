package com.usercontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDao;


@WebServlet("/UserNewPassword")
public class UserNewPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String np = request.getParameter("npassword");
		String cp = request.getParameter("cpassword");
		
		if(np.equals(cp)) {
			
			UserDao.changePassword(email, np);
			response.sendRedirect("userlogin.jsp");
			
		}else {
			
			request.setAttribute("email", email);
			request.setAttribute("msg", "New And Confirm Password Doesn't Match");
			request.getRequestDispatcher("new_password.jsp").forward(request, response);
		}
	}

}
