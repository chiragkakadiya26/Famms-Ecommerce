package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Cart;
import com.util.FammsUtil;

public class CartDao {
	
	public static void addToCart(Cart c) {
		
		try {
			
			Connection con = FammsUtil.createConnection();
			
			PreparedStatement pstm = con.prepareStatement("insert into cart(pid,uid,c_price,c_qty,total_price) values(?,?,?,?,?)");
			
			pstm.setInt(1, c.getPid());
			pstm.setInt(2, c.getUid());
			pstm.setInt(3, c.getC_price());
			pstm.setInt(4, c.getC_qty());
			pstm.setInt(5, c.getTotal_price());
			
			pstm.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
	
	public static List<Cart> getCartByUser(int uid){
		
		List<Cart> list = new ArrayList<Cart>();
		
		try {
			
			Connection con = FammsUtil.createConnection();
			
			PreparedStatement pstm = con.prepareStatement("select * from Cart where uid=?");
			
			pstm.setInt(1, uid);
			
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next()) {
				
				Cart c = new Cart();
				
				c.setCid(rs.getInt(1));
				c.setPid(rs.getInt(2));
				c.setUid(rs.getInt(3));
				c.setC_price(rs.getInt(4));
				c.setC_qty(rs.getInt(5));
				c.setTotal_price(rs.getInt(6));
				
				list.add(c);
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public static boolean checkCart(int uid ,int pid) {
		
		boolean flag = false;
		
		try {
			
			Connection con = FammsUtil.createConnection();
			
			PreparedStatement pstm = con.prepareStatement("select * from cart where pid=? and uid=?");
			
			pstm.setInt(1, uid);
			pstm.setInt(2, pid);
			
			ResultSet rs = pstm.executeQuery();
			
			if(rs.next()) {
				
				flag = true;
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return flag;
	}
	
	public static void removeCart(Cart c) {
		
		try {
			
			Connection con = FammsUtil.createConnection();
			
			PreparedStatement pstm = con.prepareStatement("delete from cart where pid=? and uid=?");
			
			pstm.setInt(1, c.getPid());
			pstm.setInt(2, c.getUid());
			
			pstm.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
	
	public static Cart getCartById(int cid) {
		
		Cart c = null;
		
		try {
			
			Connection con = FammsUtil.createConnection();
			
			PreparedStatement pstm = con.prepareStatement("select * from cart where cid=?");
			
			pstm.setInt(1, cid);
			
			ResultSet rs = pstm.executeQuery();
			
			if(rs.next()) {
				
				c = new Cart();
				c.setCid(rs.getInt(1));
				c.setPid(rs.getInt(2));
				c.setUid(rs.getInt(3));
				c.setC_price(rs.getInt(4));
				c.setC_qty(rs.getInt(5));
				c.setTotal_price(rs.getInt(6));
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return c;
	}
	
	public static void updateCart(Cart c) {
		
		try {
			
			Connection con = FammsUtil.createConnection();
			
			PreparedStatement pstm = con.prepareStatement("update cart set c_qty=?,total_price=? where cid=?");
			
			pstm.setInt(1, c.getC_qty());
			pstm.setInt(2, c.getTotal_price());
			pstm.setInt(3, c.getCid());
			
			pstm.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

}
