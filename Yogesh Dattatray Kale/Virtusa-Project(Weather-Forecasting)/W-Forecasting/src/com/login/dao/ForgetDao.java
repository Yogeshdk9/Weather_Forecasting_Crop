package com.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class ForgetDao {
	
	String sql="update user set password=? where email=?";
	String url="jdbc:mysql://localhost:3306/tecblog";
	String username="root";
	String password="yogileo@00223";
	public boolean update(String email,String pass) {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con=DriverManager.getConnection(url,username,password);
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(2, email);
			st.setString(1, pass);
			int i=st.executeUpdate();
			if(i>0)
			{
				return true;
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return false;
	}

}
