import java.io.BufferedReader;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class CSV
{
 	public static void main(String[] args){
		CSV c = new CSV();
		c.getEvents();
	}
		
	public CSV()
	{}
	
	public void getEvents() {
		
		Path path = Paths.get("hpq_alp.csv");
		Charset cs = StandardCharsets.UTF_8;
		String temp;
		
		String[] tempDetails;
		
		try (BufferedReader reader = Files.newBufferedReader(path, cs)) {

			while ((temp = reader.readLine()) != null) {
				tempDetails = temp.split(", ");
				
				for(int i=0; i < tempDetails.length; i++)
				{
					System.out.print(tempDetails[i] + " ");
					
				}
				
				System.out.println();
			}
		} catch (IOException x) {
			System.err.println(x);
		}
	}
	
}
