package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.bean.FammsContact;
import com.util.FammsUtil;

public class FammsDao {
	
	public static void insertContact(FammsContact f) {
		
		try {
			
			Connection con = FammsUtil.createConnection();
			
			PreparedStatement pstm = con.prepareStatement("insert into contact (name,email,subject,massege) values(?,?,?,?)");
			
			pstm.setString(1, f.getName());
			pstm.setString(2, f.getEmail());
			pstm.setString(3, f.getSub());
			pstm.setString(4, f.getMsg());
			
			int i = pstm.executeUpdate();
			
			if(i == 1) {
				
				System.out.println("insert Successfully..");
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

}
