package com.usercontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/VerifyOtpUser")
public class VerifyOtpUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		int otp1 = Integer.parseInt(request.getParameter("otp1"));
		int otp2 = Integer.parseInt(request.getParameter("otp2"));
		
		
		
		if(otp1 == otp2) {
			
			request.setAttribute("email", email);
			request.getRequestDispatcher("new_password.jsp").forward(request, response);
			
		}else {
			
			request.setAttribute("email", email);
			request.setAttribute("otp", otp1);
			request.setAttribute("msg", "Invalid otp");
			request.getRequestDispatcher("otp.jsp").forward(request, response);
		}
		
	}

}
