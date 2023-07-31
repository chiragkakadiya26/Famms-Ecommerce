package com.usercontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDao;
import com.service.Services;


@WebServlet("/UserForgotPassword")
public class UserForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		
		boolean flag = UserDao.checkEmail(email);
		
		if(flag == true) {
		
			int min = 100000;
			int max = 999999;
			
			int otp = (int) (Math.random()*(max -min+1)+min);
			
			Services.sendMail(email, otp);
			request.setAttribute("email", email);
			request.setAttribute("otp", otp);
			request.getRequestDispatcher("otp.jsp").forward(request, response);
			
			
		}else {
			
			request.setAttribute("msg", "Email-Id Note Register");
			request.getRequestDispatcher("forgot_password.jsp").forward(request, response);
		}
	}

}
