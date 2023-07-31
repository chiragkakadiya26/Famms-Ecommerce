package com.usercontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.User;
import com.dao.UserDao;


@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		long mobile = Long.parseLong(request.getParameter("mobile"));
		String password = request.getParameter("password");
		String cpassword = request.getParameter("cpassword");
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		String usertype = request.getParameter("usertype");
		
		System.out.println("U : " + usertype);
		
		User u = new User();
		
		System.out.println(email);
		
		boolean checkEmail = UserDao.checkEmail(email);
		
//		System.out.println(checkEmail);
		
		if(checkEmail == true) {
			
			request.setAttribute("msg", "Email-Id Already Register");
			request.getRequestDispatcher("register.jsp").forward(request, response);
			
		}else if(password.equals(cpassword)) {
			
			u.setFname(fname);
			u.setLname(lname);
			u.setEmail(email);
			u.setMobile(mobile);
			u.setPassword(password);
			u.setGender(gender);
			u.setAddress(address);
			
			if(usertype == null) {
				
				u.setUsertype("user");
				
			}else {
				
				u.setUsertype(usertype);
			}
			
			
			UserDao.insertUser(u);
			
			System.out.println("User  : " + usertype);
			
			request.setAttribute("msg", "Register SuccessFully");
			
			request.getRequestDispatcher("userlogin.jsp").forward(request, response);

		}else {
			
			request.setAttribute("msg", "Password And Confirm Password Dosen't Match");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}
		
		
		
	}

}
