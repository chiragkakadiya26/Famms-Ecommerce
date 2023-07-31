package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Wishlist;
import com.util.FammsUtil;

public class WishlistDao {
	
	public static void addToWishlist(Wishlist w) {
		
		try {
			
			Connection con = FammsUtil.createConnection();
			
			PreparedStatement pstm = con.prepareStatement("insert into wishlist (pid,uid) values(?,?)");
			
			pstm.setInt(1, w.getPid());
			pstm.setInt(2, w.getUid());
			
			pstm.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
	}
	
	
	public static List<Wishlist> getWishlistByUser(int uid){
		
		List<Wishlist> list = new ArrayList<Wishlist>();
		
		try {
			
			Connection con = FammsUtil.createConnection();
			
			PreparedStatement pstm = con.prepareStatement("select * from wishlist where uid=?");
			
			pstm.setInt(1, uid);
			
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next()) {
				
				Wishlist w = new Wishlist();
		
				w.setWid(rs.getInt(1));
				w.setPid(rs.getInt(2));
				w.setUid(rs.getInt(3));
				
				list.add(w);
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static boolean checkWishlist(int uid,int pid) {
		
		boolean flag = false;
		
		try {
			
			Connection con = FammsUtil.createConnection();
			PreparedStatement pstm = con.prepareStatement("select * from wishlist where uid=? and pid=?");
			
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
	
	
	public static void removeWishlist(Wishlist w) {
		
		try {
			
			Connection con = FammsUtil.createConnection();
			
			PreparedStatement pstm = con.prepareStatement("delete from wishlist where pid=? and uid=?");
			
			pstm.setInt(1, w.getPid());
			pstm.setInt(2, w.getUid());
			
			pstm.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

}
