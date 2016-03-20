package ETL;

import java.io.BufferedReader;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
    
    public static int getHouseID(int housetype, int wall, int roof)
    {
        int ret = 0;
        Connection c = DBManager.getConnection("");
        try {
            
        String query = "SELECT id FROM house WHERE housetype = ? wall_mat = ? AND roof_mat = ?";
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
    
    public static void insertCalamity(int mun, int zone, int brgy, int purok, int locationID)
    {
        Connection c = DBManager.getConnection("");
        try {
            
            for(int i = 1; i < 11; i++)
            {
                String query = "SELECT AVG(calam" + i + "_hwmny) as freq_year FROM db_hpq.hpq_hh WHERE mun = ? AND zone = ? AND brgy = ? AND purok = ?";
                PreparedStatement ps = c.prepareStatement(query);
                ps.setInt(1, mun);
                ps.setInt(2, zone);
                ps.setInt(3, brgy);
                ps.setInt(4, purok);
                ResultSet rs = ps.executeQuery();
                Double ave = 0.0;
                while(rs.next())
                {
                    ave = rs.getDouble("freq_year");
                }
                
                query = "INSERT INTO calamity(typeID, freq_year, locationID) VALUE(?, ?, ?)";
                ps.setInt(1, i);
                ps.setDouble(2, ave);
                ps.setInt(3, locationID);
                ps = c.prepareStatement(query);
                ps.executeUpdate();
                
            }
            c.close();
            
	} catch (SQLException e) {
            e.printStackTrace();
            System.out.println("DB error");
	}
    }

    public static void main(String[] args) 
    {
        //TODO
        Path path = Paths.get("C:\\Users\\gelomatias\\Documents\\NetBeansProjects\\ADVANDB MCO2\\src\\ETL\\hpq_hh.csv");
        Charset cs = StandardCharsets.UTF_8;
        String temp;
        int id, locationID, houseID, mun, zone, brgy, purok;

        String[] tempDetails;

        try (BufferedReader reader = Files.newBufferedReader(path, cs)) {

                while ((temp = reader.readLine()) != null) {
                        tempDetails = temp.split(",");
                    if(!tempDetails[0].equals("main.id"))
                    {
                        id = Integer.parseInt(tempDetails[0]);
                        mun = Integer.parseInt(tempDetails[9]);
                        zone = Integer.parseInt(tempDetails[10]);
                        brgy = Integer.parseInt(tempDetails[11]);
                        purok = Integer.parseInt(tempDetails[12]);
                        locationID = getLocationID(mun, zone, brgy, purok);
                        houseID = getHouseID(Integer.parseInt(tempDetails[16]), Integer.parseInt(tempDetails[18]), Integer.parseInt(tempDetails[19]));
                        
                        System.out.print(tempDetails[0]);
                        System.out.print(tempDetails[9]);
                        System.out.print(tempDetails[10]);
                        System.out.print(tempDetails[11]);
                        System.out.print(tempDetails[12]);
                        System.out.print(tempDetails[16]);
                        System.out.print(tempDetails[18]);
                        System.out.println(tempDetails[19]);


                    }
                }
        } catch (IOException x) {
                System.err.println(x);
        }
        
    }
    
}
