<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="seller_header.jsp" %>
<!DOCTYPE html>
<html>
   <head>
     
   </head>
   <body class="sub_page">
      <div class="hero_area">
         
      </div>
      <!-- inner page section -->
      <section class="inner_page_head">
         <div class="container_fuild">
            <div class="row">
               <div class="col-md-12">
                  <div class="full">
                     <h3>Edit Products</h3>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- end inner page section -->
      <!-- why section -->
      <section class="why_section layout_padding">
         <div class="container">
     <h6>    
         <%
         	if(request.getAttribute("msg")!=null)
         	{
         		out.println(request.getAttribute("msg"));
         	}
         	
         %>
      </h6>
            <div class="row">
               <div class="col-lg-8 offset-lg-2">
                  <div class="full">
                  
                  <%
            		int pid = Integer.parseInt(request.getParameter("pid"));
                  	
                  	/* System.out.println("Edit Product Id : "+pid); */
            			
            		Product p = ProductDao.getProductById(pid);
            		
          		  %>
                     <form action="ProductAddController" method="post" enctype="multipart/form-data">
                     <input type="hidden" name="uid" value="<%=u.getId()%>">
                     <input type="hidden" name="pid" value="<%=p.getPid()%>">
                     	<table>
                           <tr>
                           <td><b>Product Category : </b></td>
                           <td></td>
                          <td>
                           		 <%
                           		if(p.getP_category() != null && p.getP_category().equals("children")){
                           			
                           %>
                           		<td>
                           		<input type="radio" name="p_category" value="children" checked="checked"/>Childrens
                           		</td>
                           		<td>
                           			<input type="radio" name="p_category" value="women"/>Women's 
                          		 </td>
                           		<td>
                          		 <input type="radio" name="p_category" value="men"/>Men's
                          		 </td>
                           <%
                           		}else if(p.getP_category() != null && p.getP_category().equals("women")){
                           	%>
                           		
                           		<td>
                           		<input type="radio" name="p_category" value="children"/>Childrens
                           		</td>
                           		<td>
                           			<input type="radio" name="p_category" value="women" checked="checked"/>Women's 
                          		 </td>
                           		<td>
                          		 <input type="radio" name="p_category" value="men"/>Men's
                          		 </td>
                           		
                           	<%
                           		} else if(p.getP_category() != null && p.getP_category().equals("men")){
                           	%>
                           		
                           		<td>
                           		<input type="radio" name="p_category" value="children"/>Childrens
                           		</td>
                           		<td>
                           			<input type="radio" name="p_category" value="women" />Women's 
                          		 </td>
                           		<td>
                          		 <input type="radio" name="p_category" value="men" checked="checked"/>Men's
                          		 </td>
                           		
                           	<%
                           		}else{
                           	%>
                           		
                           		<td>
                           		<input type="radio" name="p_category" value="children"/>Childrens
                           		</td>
                           		<td>
                           			<input type="radio" name="p_category" value="women" />Women's 
                          		 </td>
                           		<td>
                          		 <input type="radio" name="p_category" value="men"/>Men's
                          		 </td>
                           			
                           	<%
                           		}
                           	%>
                           </tr>
                           </table>
                           <br>
                        <fieldset>
                           <input type="text" name="p_name" value="<%= p.getP_name() %>" />
                           <input type="text" name="p_model" value="<%= p.getP_model()%>" />
                           <input type="text" name="p_price" value="<%= p.getP_price()%>" />
                           <%-- <img src="Product_Images/<%= p.getP_image() %>" alt="" height="100px" width="100px">  --%> 
                           <input type="file" name="p_image">                                                   
                           <textarea name="p_desc"><%= p.getP_desc()%></textarea>
                       <!--  <button type="submit" class="btn bg-success text-white">Edit Product</button> -->
                            <input type="submit" value="Update Product" name="action" class="primary-btn order-submit">
                        </fieldset>
                     </form>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- end why section -->
    
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