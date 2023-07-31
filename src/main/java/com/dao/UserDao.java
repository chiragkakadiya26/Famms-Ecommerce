package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bean.User;
import com.util.FammsUtil;

public class UserDao {

	public static void insertUser(User u) {

		try {

			Connection con = FammsUtil.createConnection();

			PreparedStatement pstm = con.prepareStatement(
					"insert into user(fname,lname,email,mobile,password,gender,address,usertype) values(?,?,?,?,?,?,?,?)");
			
			pstm.setString(1, u.getFname());
			pstm.setString(2, u.getLname());
			pstm.setString(3, u.getEmail());
			pstm.setLong(4, u.getMobile());
			pstm.setString(5, u.getPassword());
			pstm.setString(6, u.getGender());
			pstm.setString(7, u.getAddress());
			pstm.setString(8, u.getUsertype());
			
			int i = pstm.executeUpdate();
			
			if(i ==1) {
				
				System.out.println("Insert Data SuccessFully...");
			}else {
				
				System.out.println("Spomething Wrong.....");
			}
			

		} catch (Exception e) {

			e.printStackTrace();
		}
	}
	
	public static boolean checkEmail(String email) {
		
		boolean f = false;
		
		try {
			
			Connection con = FammsUtil.createConnection();
			
			PreparedStatement pstm = con.prepareStatement("select * from user where email=?");
			
			pstm.setString(1, email);
			
			System.out.println("pstm : "+pstm);
			
			ResultSet rs = pstm.executeQuery();
			
//			System.out.println("rs : "+rs);
//			System.out.println("next : "+rs.next());
			
			if(rs.next()) {
				
//				System.out.println("testing");
				f = true;
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return f;
		
	}
	
	public static User checkUser(String email, String password) {
		
		User u = null;
		
		try {
			
			Connection con = FammsUtil.createConnection();
			
			PreparedStatement pstm = con.prepareStatement("select * from user where email=? and password=?");
			
			pstm.setString(1, email);
			pstm.setString(2, password);
			
			ResultSet rs = pstm.executeQuery();
			
			if(rs.next()) {
				
//				System.out.println("result : " + rs.getString(9));
				
				 u = new User();
				
				u.setId(rs.getInt(1));
				u.setFname(rs.getString(2));
				u.setLname(rs.getString(3));
				u.setEmail(rs.getString(4));
				u.setMobile(rs.getLong(5));
				u.setPassword(rs.getString(6));
				u.setGender(rs.getString(7));
				u.setAddress(rs.getString(8));
				u.setUsertype(rs.getString(9));
			}
			
			
		} catch (Exception e) {
			
			 e.printStackTrace();
		}
		
		
		return u;
	}
	
	public static void changePassword(String email, String password) {
		
		try {
			
			Connection con = FammsUtil.createConnection();
			
			PreparedStatement pstm = con.prepareStatement("update user set password=? where email=?");
			
			pstm.setString(1, password);
			pstm.setString(2, email);
			
			pstm.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
	
	public static void updateProfile(User u) {
		
		try {
			
			Connection con = FammsUtil.createConnection();
			
			PreparedStatement pstm = con.prepareStatement("update user set fname=?,lname=?,mobile=?,gender=?,address=?,usertype=? where email=?");
			
			pstm.setString(1, u.getFname());
			pstm.setString(2, u.getLname());
			pstm.setLong(3, u.getMobile());
			pstm.setString(4, u.getGender());
			pstm.setString(5, u.getAddress());
			pstm.setString(6, u.getUsertype());
			pstm.setString(7, u.getEmail());
			
			
			pstm.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

}
