package web;

import java.sql.DriverManager;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Driver;


public class DBConnnect {
	public static Connection getConnnection() {
		Connection conn=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/db_banhang","root","");
			System.out.println("Connect success !");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("Connect fail !");
		}
		return conn;
	}
	public static void main(String[] args) {
		getConnnection();
	}
}
