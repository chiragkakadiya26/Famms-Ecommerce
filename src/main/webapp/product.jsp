<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body class="sub_page">
	<div class="hero_area"></div>
	<!-- inner page section -->
	<section class="inner_page_head">
		<div class="container_fuild">
			<div class="row">
				<div class="col-md-12">
					<div class="full">
						<h3>Product Grid</h3>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end inner page section -->
	<!-- product section -->
	<section class="product_section layout_padding">
		<div class="container">
			<div class="heading_container heading_center">
				<h2>
					Our <span>products</span>
				</h2>
			</div>
			<div class="row">
			
			<%
			
				List<Product> list = ProductDao.getAllProduct();
			
				for(Product p : list){
					
			%>
				<%-- <div class="col-sm-6 col-md-4 col-lg-3">
					<div class="box">
						<div class="option_container">
							<div class="options">
								<a href="" class="option1"> Men's Shirt </a> <a href=""
									class="option2"> Buy Now </a>
							</div>
						</div>
						<div class="img-box">
							<img src="Product_Images/<%=p.getP_image() %>" alt="">
						</div>
						<div class="detail-box">
							<h5><%= p.getP_category() %></h5>
							<h5><%= p.getP_name() %></h5>
							<h6>Rs.<%=p.getP_price() %></h6>
						</div>
					</div>
				</div> --%>
				
				<div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                        <div class="card product-item border-0 mb-4">
                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                <img class="img-fluid w-100" src="Product_Images/<%=p.getP_image() %>" alt="">
                            </div>
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                <h6 class="text-truncate mb-3"><%=p.getP_name() %></h6>
                                <div class="d-flex justify-content-center">
                                    <h6>Rs.<%= p.getP_price() %></h6><h6 class="text-muted ml-2"><del></del></h6>
                                </div>
                            </div>
                            <div class="card-footer d-flex justify-content-between bg-light border">
                                <a href="product_details.jsp?pid=<%=p.getPid() %>" class="btn btn-sm text-dark p-0"><i class="fa fa-eye"></i>View Detail</a>
                                <a href="add_to_wishlist.jsp?pid=<%= p.getPid()%>&uid=<%= u.getId()%>"><i class="fa fa-heart-o"></i></a>
                                <a href="add_to_cart.jsp?pid=<%=p.getPid()%>&uid=<%=u.getId() %>" class="btn btn-sm text-dark p-0"><i class="fa fa-shopping-cart"></i>Add To Cart</a>
                            </div>
                        </div>
                    </div>
			
			<%	
				}
			%>
		
				</div>
			</div>
			<div class="btn-box">
				<a href=""> View All products </a>
			</div>
		</div>
	</section>
	<!-- end product section -->
	<!-- footer section -->
	<footer class="footer_section">
		<div class="container">
			<div class="row">
				<div class="col-md-4 footer-col">
					<div class="footer_contact">
						<h4>Reach at..</h4>
						<div class="contact_link_box">
							<a href=""> <i class="fa fa-map-marker" aria-hidden="true"></i>
								<span> Location </span>
							</a> <a href=""> <i class="fa fa-phone" aria-hidden="true"></i> <span>
									Call +01 1234567890 </span>
							</a> <a href=""> <i class="fa fa-envelope" aria-hidden="true"></i>
								<span> demo@gmail.com </span>
							</a>
						</div>
					</div>
				</div>
				<div class="col-md-4 footer-col">
					<div class="footer_detail">
						<a href="index.html" class="footer-logo"> Famms </a>
						<p>Necessary, making this the first true generator on the
							Internet. It uses a dictionary of over 200 Latin words, combined
							with</p>
						<div class="footer_social">
							<a href=""> <i class="fa fa-facebook" aria-hidden="true"></i>
							</a> <a href=""> <i class="fa fa-twitter" aria-hidden="true"></i>
							</a> <a href=""> <i class="fa fa-linkedin" aria-hidden="true"></i>
							</a> <a href=""> <i class="fa fa-instagram" aria-hidden="true"></i>
							</a> <a href=""> <i class="fa fa-pinterest" aria-hidden="true"></i>
							</a>
						</div>
					</div>
				</div>
				<div class="col-md-4 footer-col">
					<div class="map_container">
						<div class="map">
							<div id="googleMap"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="footer-info">
				<div class="col-lg-7 mx-auto px-0">
					<p>
						&copy; <span id="displayYear"></span> All Rights Reserved By <a
							href="https://html.design/">Free Html Templates</a><br>

						Distributed By <a href="https://themewagon.com/" target="_blank">ThemeWagon</a>	
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- footer section -->
	<!-- jQery -->
	<script src="js/jquery-3.4.1.min.js"></script>
	<!-- popper js -->
	<script src="js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="js/bootstrap.js"></script>
	<!-- custom js -->
	<script src="js/custom.js"></script>
</body>
</html>