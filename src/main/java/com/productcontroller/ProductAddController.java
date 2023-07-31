package com.productcontroller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bean.Product;
import com.dao.ProductDao;

@MultipartConfig
@WebServlet("/ProductAddController")
public class ProductAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String extractFileName(Part file) {
		
		String cd = file.getHeader("content-disposition");
//		System.out.println(cd);
		String[] items = cd.split(";");
		for(String str : items) {
			
			if(str.trim().startsWith("filename")) {
				return str.substring(str.indexOf("=") + 2, str.length()-1);
			}
		}
		
		return "";
	}
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String action = request.getParameter("action");
		
		if(action.equalsIgnoreCase("Add Product")) {
		
		
		String savePath = "E:\\eclips java edition\\PRACTICE PROJECTS\\Famms\\src\\main\\webapp\\Product_Images";
		
		File fileSaveDir=new File(savePath);
		
		if(!fileSaveDir.exists()){
            fileSaveDir.mkdir();
        }
		
		int uid = Integer.parseInt(request.getParameter("uid"));
		String p_category = request.getParameter("p_category");
		String p_name = request.getParameter("p_name");
		String p_model = request.getParameter("p_model");
		String price = request.getParameter("p_price");
		price = price.replaceAll("[^0-9]", "");
		int p_price = Integer.parseInt(price);
		Part part = request.getPart("p_image");
		String fileName = extractFileName(part);
        part.write(savePath + File.separator + fileName);
		String p_desc = request.getParameter("p_desc");
		
		Product p = new Product();
		p.setUid(uid);
		p.setP_category(p_category);
		p.setP_name(p_name);
		p.setP_model(p_model);
		p.setP_price(p_price);
		p.setP_image(fileName);
		p.setP_desc(p_desc);
		
		ProductDao.insertProduct(p);
		
//		System.out.println(fileSaveDir);
		
//		String path = request.getRealPath("Product_Images") + File.separator + filename;
//		
//		 FileOutputStream fos = new FileOutputStream(path);
//		 
//		 InputStream is = part.getInputStream();
//		 
//		 byte[] data = new byte[is.available()];
//		 
//		 is.read(data);
//		 fos.write(data);
//		 fos.close();
		
		
		request.setAttribute("msg", "Product Added Successfully...");
		request.getRequestDispatcher("seller_add_product.jsp").forward(request, response);
		
		
		
		}
		else if(action.equalsIgnoreCase("update product")) {
			
			Product p = new Product();
			 
				p.setPid(Integer.parseInt(request.getParameter("pid")));
				p.setP_category(request.getParameter("p_category"));
				p.setP_name(request.getParameter("p_name"));
				p.setP_model(request.getParameter("p_model"));
				p.setP_price(Integer.parseInt(request.getParameter("p_price")));
				Part part = request.getPart("p_image");
				String fileName = extractFileName(part);
				p.setP_image(fileName);
				p.setP_desc(request.getParameter("p_desc"));
				ProductDao.updateProduct(p);
				request.setAttribute("msg", "Product updated successfully.");
				request.getRequestDispatcher("seller_product_details.jsp").forward(request, response);
		}
		
		
	}

}
