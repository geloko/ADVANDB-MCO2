package Model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DBConnection 
{
	public static Connection connection;
	  public static String url = "jdbc:mysql://localhost:3306/db_mco2";
	  public static String username = "root";
	  public static String password = "12345";
	  
	  
	  public static Connection getConnection(){
		  
		  try{
	          Class.forName("com.mysql.jdbc.Driver");        
	          connection = DriverManager.getConnection(url, username, password);
	                          
	          }catch(Exception e){
	              System.out.print(e);
		} 
		  return connection;
	  }
	  
	  public static ResultSet queryDB(String query)
	  {
		  ResultSet rs = null;
		  try 
			{
				Statement stmt = getConnection().createStatement();
				rs = stmt.executeQuery(query);
			} catch (SQLException e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  return rs;
	  }
	  
	  public static void modifyDB(String sql)
	  {
		  Statement stmt;
		try 
		{
			stmt = getConnection().createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
		} catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  }

}
