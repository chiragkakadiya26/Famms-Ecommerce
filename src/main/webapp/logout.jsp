<%
	session.removeAttribute("u");
	session.invalidate();
	response.sendRedirect("userlogin.jsp");

%>