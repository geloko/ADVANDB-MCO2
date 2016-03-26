package Model;

import java.util.ArrayList;

public class DBTable {

	private String name;
	private ArrayList<String> columns;
	
	public DBTable(){
		columns = new ArrayList();
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public void addColumn(String column){
		columns.add(column);
	}
	
	public ArrayList<String> getColumns(){
		return columns;
	}
	
	public boolean isChosen(){
		
		if(columns.size() == 0)
			return false;
		else
			return true;
		
	}
}
