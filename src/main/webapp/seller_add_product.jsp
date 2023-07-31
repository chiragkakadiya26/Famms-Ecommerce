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
                     <h3>Add Products</h3>
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
                     <form action="ProductAddController" name="add_product" method="post" enctype="multipart/form-data">
                     <input type="hidden" name="uid" value="<%=u.getId()%>">
                     	<table>
                           <tr>
                           <td><b>Product Category : </b></td>
                           <td></td>
                           <td>
                           		<input type="radio" name="p_category" value="children"/>Childrens
                           		</td>
                           		<td>
                           <input type="radio" name="p_category" value="women"/>Women's 
                           </td>
                           <td>
                           <input type="radio" name="p_category" value="men"/>Men's
                           </td>
                           </tr>
                           
                           </table>
                           <br>
                        <fieldset>
                           <input type="text" placeholder="Enter Product Name" name="p_name" required />
                           <input type="text" placeholder="Enter Product Model" name="p_model" required />
                           <input type="text" placeholder="Enter Product Price" name="p_price" required />
                           <input type="file"  name="p_image" />                                                     
                           <textarea placeholder="Enter Product Description" name="p_desc"></textarea>
                           <input type="submit" value="Add Product" name="action"/>
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