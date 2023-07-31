package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.FammsContact;
import com.dao.FammsDao;


@WebServlet("/ContactUs")
public class ContactUs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FammsContact f = new FammsContact();
		
		f.setName(request.getParameter("name"));
		f.setEmail(request.getParameter("email"));
		f.setSub(request.getParameter("subject"));
		f.setMsg(request.getParameter("textfiled"));
		
		FammsDao.insertContact(f);
		
		request.setAttribute("msg", "Contact Save SuccessFully");
		
		request.getRequestDispatcher("contact.jsp").forward(request, response);
	
	}

}
