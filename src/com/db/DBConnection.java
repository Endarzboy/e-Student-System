package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	private static Connection con = null;
	
	public String abebe() {
		return "Hello World";
	}

	public static Connection createConnection() {

		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/oasesfinalprojectdb";
		String user = "root";
		String password = "";

		try {
			Class.forName(driver).newInstance();
			con = DriverManager.getConnection(url, user, password);
			// System.out.println("Connection Created");
		} catch (Exception e) {
			System.out.println("Unable to Connect to MySql DB: " + e.getMessage());
		}
		return con;
	}

	// public static void main(String[] args) {
	//
	// System.out.println(new DBConnection().createConnection());
	// }
}
