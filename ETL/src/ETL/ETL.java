package ETL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.DBManager;

/**
 *
 * @author gelomatias
 */
public class ETL 
{
    public static String hpq = "db_hpq";
    
    public static int getLocationID(int mun, int zone, int brgy, int purok)
    {
        int ret = 0;
        Connection c = DBManager.getConnection("");
        try {
            
        String query = "SELECT id FROM location WHERE mun = ? AND zone = ? AND brgy = ? AND purok = ?";
            PreparedStatement ps = c.prepareStatement(query);
            ps.setInt(1, mun);
            ps.setInt(2, zone);
            ps.setInt(3, brgy);
            ps.setInt(4, purok);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next())
            {
                ret = rs.getInt("id");
            }
            c.close();
            return ret;
            
	} catch (SQLException e) {
            e.printStackTrace();
            System.out.println("DB error");
	}
        return ret;
    }
    
    public static int getHouseID(String housetype, String wall, String roof)
    {
        int ret = 0;
        Connection c = DBManager.getConnection("");
        try {
            
        String query = "SELECT id FROM house_mat WHERE housetype = ? wall_mat = ? AND roof_mat = ?";
            PreparedStatement ps = c.prepareStatement(query);
            ps.setString(1, housetype);
            ps.setString(2, wall);
            ps.setString(3, roof);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next())
            {
                ret = rs.getInt("id");
            }
            c.close();
            return ret;
            
	} catch (SQLException e) {
            e.printStackTrace();
            System.out.println("DB error");
	}
        return ret;
    }
    
    public static void insertHouse(int housetype, int wall, int roof)
    {
        Connection c = DBManager.getConnection("");
        try {
            
        String query = "INSERT INTO house VALUE(?, ?, ?)";
            PreparedStatement ps = c.prepareStatement(query);
            switch(housetype)
            {
                case 1: ps.setString(1, "Single House");
                        break;
                case 2: ps.setString(1, "Duplex");
                        break;
                case 3: ps.setString(1, "Multi-Unit Residential");
                        break;
                case 4: ps.setString(1, "Commercial/Agricultural/Industrial");
                        break;
            }
            switch(wall)
            {
                case 1: ps.setString(2, "Strong Materials");
                        break;
                case 2: ps.setString(2, "Light Materials");
                        break;
                case 3: ps.setString(2, "Makeshift Materials");
                        break;
                case 4: ps.setString(2, "Predominantly Strong");
                        break;
                case 5: ps.setString(2, "Predominantly Light");
                        break;
                case 6: ps.setString(2, "Predominantly Salvaged");
                        break;
                case 7: ps.setString(2, "N/A");
                        break;
            }
            switch(roof)
            {
                case 1: ps.setString(3, "Strong Materials");
                        break;
                case 2: ps.setString(3, "Light Materials");
                        break;
                case 3: ps.setString(3, "Makeshift Materials");
                        break;
                case 4: ps.setString(3, "Predominantly Strong");
                        break;
                case 5: ps.setString(3, "Predominantly Light");
                        break;
                case 6: ps.setString(3, "Predominantly Salvaged");
                        break;
                case 7: ps.setString(3, "N/A");
                        break;
            }
            ps.executeUpdate();
            c.close();
            
	} catch (SQLException e) {
            e.printStackTrace();
            System.out.println("DB error");
	}
    }
    
    public static void insertHousehold(int id, int location, int house)
    {
        Connection c = DBManager.getConnection("");
        try {
            
        String query = "INSERT INTO household VALUE(?, ?, ?)";
            PreparedStatement ps = c.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, location);
            ps.setInt(3, house);
            ps.executeUpdate();
            c.close();
            
	} catch (SQLException e) {
            e.printStackTrace();
            System.out.println("DB error");
	}
    }

    public static void main(String[] args) 
    {
        //TODO
    }
    
}
