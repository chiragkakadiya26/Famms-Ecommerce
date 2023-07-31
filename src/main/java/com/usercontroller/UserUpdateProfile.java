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


@WebServlet("/UserUpdateProfile")
public class UserUpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("uid"));
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		long mobile = Long.parseLong(request.getParameter("mobile"));
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		String usertype = request.getParameter("usertype");
		
		User u = new User();
		
		u.setId(id);
		u.setFname(fname);
		u.setLname(lname);
		u.setEmail(email);
		u.setMobile(mobile);
		u.setGender(gender);
		u.setAddress(address);
		u.setUsertype(usertype);
		
		UserDao.updateProfile(u);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("u", u);
		
		if(u.getUsertype().equals("user")) {
			
			request.setAttribute("msg", "User Profile Update SuccessFully");
			request.getRequestDispatcher("myprofile.jsp").forward(request, response);
			
		}else {
			
			request.setAttribute("msg", "Seller Profile Update SuccessFully");
			request.getRequestDispatcher("seller_profile.jsp").forward(request, response);
		}
		
	}

}
