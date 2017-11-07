package com.iu.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class DBConnector {

	public static Connection getConnect() throws Exception{
		String user="user03";
		String password="user03";
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		String driver ="oracle.jdbc.driver.OracleDriver";

		Class.forName(driver);

		Connection con = DriverManager.getConnection(url, user, password);

		return con;
	}
	
	//excuteUpdate
	public static void disConnect(PreparedStatement st, Connection con) throws Exception {
		st.close();
		con.close();
	}

	//excuteQuery
	public static void disConnect(ResultSet rs, PreparedStatement st, Connection con) throws Exception {
		rs.close();
		DBConnector.disConnect(st, con);
	}

}
