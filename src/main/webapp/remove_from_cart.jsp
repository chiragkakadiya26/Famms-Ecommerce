<%@page import="com.dao.CartDao"%>
<%@page import="com.bean.Cart"%>
<%

	int pid = Integer.parseInt(request.getParameter("pid"));
	int uid = Integer.parseInt(request.getParameter("uid"));
	
	Cart c = new Cart();
	
	c.setPid(pid);
	c.setUid(uid);
	
	CartDao.removeCart(c);
	response.sendRedirect("mycart.jsp");

%>