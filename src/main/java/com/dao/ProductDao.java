package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Product;
import com.util.FammsUtil;

public class ProductDao {

	public static void insertProduct(Product p) {

		try {

			Connection con = FammsUtil.createConnection();

			PreparedStatement pstm = con.prepareStatement(
					"insert into product (uid,p_category,p_name,p_model,p_price,p_image,p_desc) values (?,?,?,?,?,?,?)");
			
			pstm.setInt(1, p.getUid());
			pstm.setString(2, p.getP_category());
			pstm.setString(3, p.getP_name());
			pstm.setString(4, p.getP_model());
			pstm.setInt(5, p.getP_price());
			pstm.setString(6, p.getP_image());
			pstm.setString(7, p.getP_desc());
			
			pstm.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();
		}

	}
	
	
	public static List<Product> getAllProduct(){
		
		List<Product> list = new ArrayList<Product>();
		
		try {
			
			Connection con = FammsUtil.createConnection();
			PreparedStatement pstm = con.prepareStatement("select * from product");
			
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next()) {
				
				Product p = new Product();
				
				p.setPid(rs.getInt(1));
				p.setUid(rs.getInt(2));
				p.setP_category(rs.getString(3));
				p.setP_name(rs.getString(4));
				p.setP_model(rs.getString(5));
				p.setP_price(rs.getInt(6));
				p.setP_image(rs.getString(7));
				p.setP_desc(rs.getString(8));
				
				list.add(p);
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	public static Product getProductById(int pid){
		
		Product p = null;
		
		try {
			
			Connection con = FammsUtil.createConnection();
			
			PreparedStatement pstm = con.prepareStatement("select * from product where pid=?");
			
			pstm.setInt(1, pid);
			
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next()) {
				
				p = new Product();
				
				p.setPid(rs.getInt(1));
				p.setUid(rs.getInt(2));
				p.setP_category(rs.getString(3));
				p.setP_name(rs.getString(4));
				p.setP_model(rs.getString(5));
				p.setP_price(rs.getInt(6));
				p.setP_image(rs.getString(7));
				p.setP_desc(rs.getString(8));
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return p;
	}
	
	public static void updateProduct(Product p) {

		try {

			Connection con = FammsUtil.createConnection();

			PreparedStatement pstm = con.prepareStatement(
					"update product set p_category=?,p_name=?,p_model=?,p_price=?,p_image=?,p_desc=? where pid=?");
			
			
			pstm.setString(1, p.getP_category());
			pstm.setString(2, p.getP_name());
			pstm.setString(3, p.getP_model());
			pstm.setInt(4, p.getP_price());
			pstm.setString(5, p.getP_image());
			pstm.setString(6, p.getP_desc());
			pstm.setInt(7, p.getPid());
			
//			System.out.println("Dao Product ID : " + p.getPid());
			
			pstm.executeUpdate();
			
			

		} catch (Exception e) {

			e.printStackTrace();
		}

	}
	
	public static void deleteProduct(int pid) {
		
		try {
			
			Connection con = FammsUtil.createConnection();
			
			PreparedStatement pstm = con.prepareStatement("delete from product where pid=?");
			
			pstm.setInt(1, pid);
			
			pstm.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
	
	public static List<Product> getProductByCategory(String p_category){
		
		List<Product> list = new ArrayList<Product>();
		
		try {
			
			Connection con = FammsUtil.createConnection();
			PreparedStatement pstm = con.prepareStatement("select * from product where p_category=?");
			
			pstm.setString(1, p_category);
			
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next()) {
				
				Product p = new Product();
				
				p.setPid(rs.getInt(1));
				p.setUid(rs.getInt(2));
				p.setP_category(rs.getString(3));
				p.setP_name(rs.getString(4));
				p.setP_model(rs.getString(5));
				p.setP_price(rs.getInt(6));
				p.setP_image(rs.getString(7));
				p.setP_desc(rs.getString(8));
				
				list.add(p);
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return list;
	}

}
