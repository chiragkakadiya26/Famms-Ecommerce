<%@page import="com.dao.CartDao"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.Product"%>
<%@page import="com.bean.Cart"%>
<%

	int pid = Integer.parseInt(request.getParameter("pid"));
	int uid = Integer.parseInt(request.getParameter("uid"));
	
	Product p = ProductDao.getProductById(pid);	
	
	Cart c = new Cart();
	
	c.setPid(pid);
	c.setUid(uid);
	c.setC_price(p.getP_price());
	c.setC_qty(1);
	c.setTotal_price(p.getP_price());
	
	CartDao.addToCart(c);
	response.sendRedirect("mycart.jsp");
	

%>