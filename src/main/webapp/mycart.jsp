<%@page import="com.dao.CartDao"%>
<%@page import="com.bean.Cart"%>
<%@page import="com.dao.WishlistDao"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.WhileStatement"%>
<%@page import="com.bean.Wishlist"%>
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
<body>

	<!-- product section -->
	<section class="product_section layout_padding">

		<div class="container-fluid mb-5"
			style="background-color: #f7444e; color: #FFFFFF">
			<div
				class="d-flex flex-column align-items-center justify-content-center"
				style="min-height: 300px">
				<h1 class="font-weight-semi-bold text-uppercase mb-3">Shopping
					Cart</h1>
				<div class="d-inline-flex">
					<p class="m-0">
						<a href="index.jsp">Home</a>
					</p>
					<p class="m-0 px-2">-</p>
					<p class="m-0">Shopping Cart</p>
				</div>
			</div>
		</div>
		<div class="container-fluid pt-5">
			<div class="row px-xl-5">
			
			<div class="col-lg-8 table-responsive mb-5">
					<table class="table table-bordered text-center mb-0">
						<thead class="text-dark"
							style="background-color: #f7444e; color: #FFFFFF">
							<tr>
								<th>Products</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>Total</th>
								<th>Remove</th>
							</tr>
						</thead>

				<%
				List<Cart> list = CartDao.getCartByUser(u.getId());

				/* System.out.println("List : " + list); */

				for (Cart c : list) {

					Product p = ProductDao.getProductById(c.getPid());
				%>
				
						<tbody class="align-middle">
							<tr>
								<td><img src="Product_Images/<%=p.getP_image()%>" alt=""
									style="width: 50px;"> <%=p.getP_name()%></td>
								<td class="align-middle"><%=c.getC_price()%></td>
								<td class="align-middle">
									<div class="input-group quantity mx-auto" style="width: 100px;">
										<!-- <div class="input-group-btn">
											<button class="btn btn-sm btn-primary btn-minus">
												<i class="fa fa-minus"></i>
											</button>
										</div> -->
										<form action="CartController" name="qty" method="post">
										<input type="number" name="p_qty"
											class="form-control form-control-sm bg-secondary text-center"
											value="<%= c.getC_qty()%>">
										<!-- <div class="input-group-btn">
											<button class="btn btn-sm btn-primary btn-plus">
												<i class="fa fa-plus"></i>
											</button>
										</div> -->
										</form>
									</div>
								</td>
								<td class="align-middle">$150</td>
								<td class="align-middle"><a href="remove_from_cart.jsp?pid=<%= p.getPid()%>&uid=<%= u.getId()%>"><button
										class="btn btn-sm btn-primary">
										<i class="fa fa-times"></i>
									</button></a></td>
							</tr>

						</tbody>

				<%
				}
				%>
				</table>
				</div>
				<div class="col-lg-4">
					<form class="mb-5" action="">
						<div class="input-group">
							<input type="text" class="form-control p-4"
								placeholder="Coupon Code">
							<div class="input-group-append">
								<button class="btn btn-primary">Apply Coupon</button>
							</div>
						</div>
					</form>
					<div class="card border-secondary mb-5">
						<div class="card-header bg-secondary border-0">
							<h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
						</div>
						<div class="card-body">
							<div class="d-flex justify-content-between mb-3 pt-1">
								<h6 class="font-weight-medium">Subtotal</h6>
								<h6 class="font-weight-medium">$150</h6>
							</div>
							<div class="d-flex justify-content-between">
								<h6 class="font-weight-medium">Shipping</h6>
								<h6 class="font-weight-medium">$10</h6>
							</div>
						</div>
						<div class="card-footer border-secondary bg-transparent">
							<div class="d-flex justify-content-between mt-2">
								<h5 class="font-weight-bold">Total</h5>
								<h5 class="font-weight-bold">$160</h5>
							</div>
							<button class="btn btn-block btn-primary my-3 py-3">Proceed
								To Checkout</button>
						</div>
					</div>
				</div>
			</div>
		</div>





	</section>
	<!-- end product section -->



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
	<div class="cpy_">
		<p class="mx-auto">
			© 2021 All Rights Reserved By <a href="https://html.design/">Free
				Html Templates</a><br> Distributed By <a
				href="https://themewagon.com/" target="_blank">ThemeWagon</a>

		</p>
	</div>
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