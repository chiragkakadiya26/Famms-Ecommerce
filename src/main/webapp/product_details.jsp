<%@page import="com.dao.CartDao"%>
<%@page import="com.dao.WishlistDao"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bean.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>EShopper - Bootstrap Shop Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
   


    <!-- Page Header Start -->
    <div class="container-fluid mb-5" style="background-color: #f7444e; color: #FFFFFF">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Product Detail</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="seller_index.jsp">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Shop Detail</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->
	
	<%
		int pid = Integer.parseInt(request.getParameter("pid"));
	
		Product p = ProductDao.getProductById(pid);
		
	
	%>
	

    <!-- Shop Detail Start -->
    <div class="container-fluid py-5">
        <div class="row px-xl-5">
            <div class="col-lg-5 pb-5">
                <div id="product-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner border">
                        <div class="carousel-item active">
                            <img class="w-100 h-100" src="Product_Images/<%=p.getP_image() %>" alt="Image">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                        <i class="fa fa-2x fa-angle-left text-dark"></i>
                    </a>
                    <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                        <i class="fa fa-2x fa-angle-right text-dark"></i>
                    </a>
                </div>
            </div>

            <div class="col-lg-7 pb-5">
            	<h3 class="font-weight-semi-bold">Category : <%= p.getP_category() %></h3>
                <h3 class="font-weight-semi-bold"><%= p.getP_name() %></h3>
                <div class="d-flex mb-3">
                    <div class="text-primary mr-2">
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star-half-alt"></small>
                        <small class="far fa-star"></small>
                    </div>
                    <small class="pt-1">(50 Reviews)</small>
                </div>
                <h3 class="font-weight-semi-bold mb-4">RS. <%= p.getP_price() %></h3>
                <p class="mb-4">Volup erat ipsum diam elitr rebum et dolor. Est nonumy elitr erat diam stet sit clita ea. Sanc invidunt ipsum et, labore clita lorem magna lorem ut. Erat lorem duo dolor no sea nonumy. Accus labore stet, est lorem sit diam sea et justo, amet at lorem et eirmod ipsum diam et rebum kasd rebum.</p>
                <div class="d-flex mb-3">
                    <p class="text-dark font-weight-medium mb-0 mr-3">Sizes:</p>
                    <form>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" id="size-1" name="size">
                            <label class="custom-control-label" for="size-1">XS</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" id="size-2" name="size">
                            <label class="custom-control-label" for="size-2">S</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" id="size-3" name="size">
                            <label class="custom-control-label" for="size-3">M</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" id="size-4" name="size">
                            <label class="custom-control-label" for="size-4">L</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" id="size-5" name="size">
                            <label class="custom-control-label" for="size-5">XL</label>
                        </div>
                    </form>
                </div>
                <div class="d-flex mb-4">
                    <p class="text-dark font-weight-medium mb-0 mr-3">Colors:</p>
                    <form>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" id="color-1" name="color">
                            <label class="custom-control-label" for="color-1">Black</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" id="color-2" name="color">
                            <label class="custom-control-label" for="color-2">White</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" id="color-3" name="color">
                            <label class="custom-control-label" for="color-3">Red</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" id="color-4" name="color">
                            <label class="custom-control-label" for="color-4">Blue</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" class="custom-control-input" id="color-5" name="color">
                            <label class="custom-control-label" for="color-5">Green</label>
                        </div>
                    </form>
                </div>
               <div class="d-flex align-items-center mb-4 pt-2">
                    <div class="input-group quantity mr-3" style="width: 130px;">
                        <div class="input-group-btn">
                            <button class="btn btn-primary btn-minus" >
                            <i class="fa fa-minus"></i>
                            </button>
                        </div>
                        <input type="text" class="form-control bg-secondary text-center" value="1">
                        <div class="input-group-btn">
                            <button class="btn btn-primary btn-plus">
                                <i class="fa fa-plus"></i>
                            </button>
                        </div>
                    </div>
                    

                    <%
                    	if(session.getAttribute("u") != null){
                    		
                    		boolean flag = WishlistDao.checkWishlist(u.getId(), p.getPid());
                    		boolean flag1 = CartDao.checkCart(u.getId(), p.getPid());
                    		
                    		if(flag == false){
         
                 	%> 
								<a href="add_to_wishlist.jsp?pid=<%= p.getPid()%>&id=<%= u.getId()%>">
                    				<button class="btn btn-primary px-3"><i class="fa fa-shopping-cart mr-1"></i> Add To Wishlist</button>
                   	    		</a> &nbsp;
                 	<%	
                    		}else{
                    %> 
								<a href="remove_from_wishlist.jsp?pid=<%= p.getPid()%>&id=<%= u.getId()%>">
                    				<button class="btn btn-primary px-3"><i class="fa fa-shopping-cart mr-1"></i> Remove To Wishlist</button>
                   	    		</a> &nbsp;
                    <%			
                    			
                    		}
                    		
                    		if(flag1 == false){
                    			
                    %>
                    
                    			<a href="add_to_cart.jsp?pid=<%=p.getPid()%>&uid=<%=u.getId()%>">
                    				<button class="btn btn-primary px-3"><i class="fa fa-shopping-cart mr-1"></i> Add To Cart</button>
								</a>
                    
                    <%			
                    		}else{
                    			
                    %>
                    
                    			<a href="remove_from_cart.jsp?pid=<%=p.getPid()%>&uid=<%=u.getId()%>">
                    				<button class="btn btn-primary px-3"><i class="fa fa-shopping-cart mr-1"></i> Remove To Cart</button>
								</a>
                    	
                    <%			
                    		}
                    
                    %>
                    	
                    	
                    	
                    <% 
                    	}else{
                    %>
                    	<a href="userlogin.jsp">
                    		<button class="btn btn-primary px-3"><i class="fa fa-shopping-cart mr-1"></i> Add To Cart</button>
                   	    </a> &nbsp;
                    	<a href="userlogin.jsp">
							<button class="btn btn-primary px-3"><i class="fa fa-shopping-cart mr-1"></i> Add To Wishlist</button>
						</a>
                    <% 		
                    	}
                    %>
                    
                    
                </div>
                <div class="d-flex pt-2">
                    <p class="text-dark font-weight-medium mb-0 mr-2">Share on:</p>
                    <div class="d-inline-flex">
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-pinterest"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                    <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Description</a>
                    <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-2">Information</a>
                    <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-3">Reviews (0)</a>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="tab-pane-1">
                        <h4 class="mb-3">Product Description</h4>
                        <p><%= p.getP_desc() %></p>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Shop Detail End -->
    <!-- footer start -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="full">
						<div class="logo_footer">
							<a href="#"><img width="210" src="images/logo.png" alt="#" /></a>
						</div>
						<div class="information_f">
							<p>
								<strong>ADDRESS:</strong> 28 White tower, Street Name New York
								City, USA
							</p>
							<p>
								<strong>TELEPHONE:</strong> +91 987 654 3210
							</p>
							<p>
								<strong>EMAIL:</strong> yourmain@gmail.com
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-8">
					<div class="row">
						<div class="col-md-7">
							<div class="row">
								<div class="col-md-6">
									<div class="widget_menu">
										<h3>Menu</h3>
										<ul>
											<li><a href="#">Home</a></li>
											<li><a href="#">About</a></li>
											<li><a href="#">Services</a></li>
											<li><a href="#">Testimonial</a></li>
											<li><a href="#">Blog</a></li>
											<li><a href="#">Contact</a></li>
										</ul>
									</div>
								</div>
								<div class="col-md-6">
									<div class="widget_menu">
										<h3>Account</h3>
										<ul>
											<li><a href="#">Account</a></li>
											<li><a href="#">Checkout</a></li>
											<li><a href="#">Login</a></li>
											<li><a href="#">Register</a></li>
											<li><a href="#">Shopping</a></li>
											<li><a href="#">Widget</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-5">
							<div class="widget_menu">
								<h3>Newsletter</h3>
								<div class="information_f">
									<p>Subscribe by our newsletter and get update protidin.</p>
								</div>
								<div class="form_sub">
									<form>
										<fieldset>
											<div class="field">
												<input type="email" placeholder="Enter Your Mail"
													name="email" /> <input type="submit" value="Subscribe" />
											</div>
										</fieldset>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- footer end -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>