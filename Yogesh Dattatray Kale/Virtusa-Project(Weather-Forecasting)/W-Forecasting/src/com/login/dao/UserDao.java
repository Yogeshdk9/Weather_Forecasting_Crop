package com.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.login.bean.User;

public class UserDao {
	public  int registerUser(User User) throws ClassNotFoundException {
		String INSERT_USER_SQL = "INSERT INTO user" + "(email,password,last_name,first_name,city,state) VALUES "
				+ "(?,?,?,?,?,?);";

		int result = 0;

		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/tecblog", "root",
				"yogileo@00223");

			PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL)) {

			preparedStatement.setString(1, User.getEmail());
			preparedStatement.setString(2, User.getPassword());
			preparedStatement.setString(3, User.getLastname());
			preparedStatement.setString(4, User.getFirstname());
			preparedStatement.setString(5, User.getCity());
			preparedStatement.setString(6, User.getState());

			System.out.println(preparedStatement);
			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
