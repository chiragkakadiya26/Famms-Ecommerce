<%@page import="com.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Site Metas -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="shortcut icon" href="images/favicon.png" type="">
<title>Famms - Fashion HTML Template</title>
<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<!-- font awesome style -->
<link href="css/font-awesome.min.css" rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="css/responsive.css" rel="stylesheet" />
</head>
<body>
	<!-- header section strats -->
	<header class="header_section">
		<div class="container">
			<nav class="navbar navbar-expand-lg custom_nav-container ">
				<a class="navbar-brand" href="index.html"><img width="250"
					src="images/logo.png" alt="#" /></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class=""> </span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav">
						<li class="nav-item active"><a class="nav-link"
							href="index.jsp">Home <span class="sr-only">(current)</span></a>
						</li>

						<li class="nav-item dropdown"><a class="nav-link" href="product.jsp">Products</a></li>
						<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>

						<%
						User u = null;
						if (session != null) {

							if ((session.getAttribute("u")) != null) {

								u = (User) session.getAttribute("u");
						%>
							<!--  	<li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li> -->
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
									role="button" aria-haspopup="true" aria-expanded="true"> <span
										class="nav-label"><%=u.getFname() %> <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a class="nav-link" href="myprofile.jsp">My Profile</a></li>
										<li><a class="nav-link" href="changepassword.jsp">Change Password</a></li>
										<li><a class="nav-link" href="logout.jsp">Logout</a></li>
									</ul></li>

						<%
						} else {
						%>
							<li class="nav-item"><a class="nav-link" href="userlogin.jsp">Sing
									up</a></li>
						<%
						}
						} else {
						%>
						<li class="nav-item"><a class="nav-link" href="userlogin.jsp">Sing
								up</a></li>
						<%
						}
						%>
						
						

						<!-- <li class="nav-item"><a class="nav-link" href="#"> </a></li> -->
					
						
						 <form class="form-inline">
							<button class="btn  my-2 my-sm-0 nav_search-btn" type="submit">
								<i class="fa fa-search" aria-hidden="true"></i>
							</button>
						</form> 
					</ul>
				<!-- 	<div>
						<a href="#"> <i class="fa fa-heart-o"></i> <span>
								</span>
						<div class="qty">2</div>
						</a>
						<div><span>Your Wishlist</span></div>
				  </div> -->
				  <div class="col-lg-3 col-6 text-right">
                <a href="mywishlist.jsp" class="btn border">
                    <i class="fa fa-heart-o"></i>
                    <span class="badge">
                    
                    <%
                    	
                    	if(session != null){
                    		
                    		if(session.getAttribute("wishlist_count") != null){
                    			
                    			out.println(session.getAttribute("wishlist_count"));
                    		}
                    	}
                    
                    
                    %>
                    
                    </span>
                </a>
                <a href="mycart.jsp" class="btn border">
                    <i class="fa fa-shopping-cart"></i>
                    <span class="badge">0</span>
                </a>
            </div>
            <div class="col-lg-3 d-none d-lg-block">
                <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -px; padding: 0 30px; width: 200px;">
                    <h6 class="m-0">Categories</h6>
                    <i class="fa fa-angle-down text-dark"></i>
                </a>
                <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: 200px; z-index: 1; color: #000000;">
                	<ul class="nav-item dropdown">
                    	<li class="nav-item dropdown"><a class="nav-link" href="filter_product.jsp?p_category=children">Children</a></li>
                    	<li class="nav-item dropdown"><a class="nav-link" href="filter_product.jsp?p_category=women">Women</a></li>
                    	<li class="nav-item dropdown"><a class="nav-link" href="filter_product.jsp?p_category=men">Men's</a></li>
					</ul>
                </nav>
            </div>
				</div>
			</nav>
		</div>
	</header>
	<!-- end header section -->
</body>
</html>