<%@page import="com.dao.WishlistDao"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.WhileStatement"%>
<%@page import="com.bean.Wishlist"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
   <head>
      
   </head>
   <body>
                
      <!-- product section -->
      <section class="product_section layout_padding">
         <div class="container">
            <div class="heading_container heading_center">
               <h2>
                  Wishlist <span>products</span>
               </h2>
            </div>
            <div class="row">
            
            <%
            	List<Wishlist> list = WishlistDao.getWishlistByUser(u.getId());
            	
            	/* System.out.println("List : " + list); */
            	            
            	for(Wishlist w : list){
            		
            		Product p = ProductDao.getProductById(w.getPid());
            %>
            
                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                        <div class="card product-item border-0 mb-4">
                             <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                 <img class="img-fluid w-100" src="Product_Images/<%=p.getP_image() %>" alt="" height="200px" width="200px"	>
                            </div> 
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                <h6 class="text-truncate mb-3"><%=p.getP_name() %></h6>
                                <div class="d-flex justify-content-center">
                                    <h6>Rs.<%= p.getP_price() %></h6><h6 class="text-muted ml-2"><del></del></h6>
                                </div>
                            </div>
                             <div class="card-footer d-flex justify-content-between bg-light border">
                                <a href="product_details.jsp?pid=<%=p.getPid() %>" class="btn btn-sm text-dark p-0"><i class="fa fa-eye"></i>View Detail</a>
                                <a href="remove_from_wishlist.jsp?pid=<%=p.getPid()%>&uid=<%=u.getId()%>"><i class="fa fa-times"></i></a>
                                <a href="" class="btn btn-sm text-dark p-0"><i class="fa fa-shopping-cart"></i>Add To Cart</a>
                            </div> 
                        </div>
                    </div> 
                    
                    
                   <%--  <div class="col-lg-4 col-md-6 pb-1">
                		<div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                    		<p class="text-right"></p>
                    		<a href="filter_product.jsp?p_category=<%= p.getP_category() %>" class="cat-img position-relative overflow-hidden mb-3">
                        		<img class="img-fluid" src="Product_Images/<%=p.getP_image() %>" alt="">
                    		</a>
                    	<h5 class="font-weight-semi-bold m-0"><%= p.getP_category() %></h5>
                	</div>
            	</div> --%>
             <%
            	}
             %>  
             
            </div>
            <div class="btn-box">
               <a href="product.jsp">
               View All products
               </a>
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
                        <p><strong>ADDRESS:</strong> 28 White tower, Street Name New York City, USA</p>
                        <p><strong>TELEPHONE:</strong> +91 987 654 3210</p>
                        <p><strong>EMAIL:</strong> yourmain@gmail.com</p>
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
                                    <input type="email" placeholder="Enter Your Mail" name="email" />
                                    <input type="submit" value="Subscribe" />
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
         <p class="mx-auto">© 2021 All Rights Reserved By <a href="https://html.design/">Free Html Templates</a><br>
         
            Distributed By <a href="https://themewagon.com/" target="_blank">ThemeWagon</a>
         
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