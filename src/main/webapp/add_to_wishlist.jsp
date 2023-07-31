<%@page import="java.util.List"%>
<%@page import="com.dao.WishlistDao"%>
<%@page import="com.bean.Wishlist"%>
<%
	
	int pid = Integer.parseInt(request.getParameter("pid"));
	int uid = Integer.parseInt(request.getParameter("uid"));
	
	/* System.out.println("Product Id Add Wishlist : " + pid );
	System.out.println("User Id Add Wishlist : " + uid ); */
	
	Wishlist w = new Wishlist();
	
	w.setPid(pid);
	w.setUid(uid);
	
	WishlistDao.addToWishlist(w);
	List<Wishlist> w_list = WishlistDao.getWishlistByUser(uid);
	session.setAttribute("wishlist_count", w_list.size());
	request.getRequestDispatcher("mywishlist.jsp").forward(request, response);
	
%>