package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBManager {
    
    private static String url = "jdbc:mysql://localhost:3306/";
    private static String dbName = "calamity_wh";
    private static String driver = "com.mysql.jdbc.Driver";
    private static String userName = "root";
    private static String pass = "";

    public static Connection getConnection(String db)
    {        
        Connection conn = null;
	try 
        {    
            Class.forName(driver).newInstance();
            if(db.equals("db_hpq"))
               return DriverManager.getConnection(url + db, userName, pass);
            else
                return DriverManager.getConnection(url + dbName, userName, pass);
            
	} catch (Exception e) 
        {
            e.printStackTrace();
	}
	return conn; 
    }
	
    public static void executeStatement(String statement)
    {
        Connection conn = getConnection(dbName);
	ResultSet res = null;
	try 
        {
            Statement st = conn.createStatement();
            st.execute(statement);
            conn.close();
	} catch (SQLException e) 
        {
            e.printStackTrace();
            System.out.println("DB error");
	}
    }
    
    public static ResultSet executeQuery(String query)
    {
            ResultSet result = null;
            Connection conn = DBManager.getConnection(dbName);
        try 
        {
            Statement st = conn.createStatement();
            result = st.executeQuery(query);
        } catch (SQLException ex) 
        {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}
