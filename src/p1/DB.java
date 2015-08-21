package p1;

import java.sql.*;
public class DB 
{
	public static Connection getConnect()
	{
		Connection con=null;
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@127.1.3.3:1521:xe","Admin","thundereagle");
			//System.out.println("Connected");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}
	public static void main(String[] args)
	{
		DB.getConnect();
	}

}
