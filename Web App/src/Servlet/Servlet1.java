package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DBConnection;
import Model.DBTable;
import Model.QueryBuilder;

/**
 * Servlet implementation class Servlet1
 */
@WebServlet(urlPatterns={"/SelectCols", "/SelectOperation"})
public class Servlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private HttpServletRequest request;
    private HttpServletResponse response;
    ArrayList<String> dimensions;
	ArrayList<String> aggregates;
	ArrayList<String> groupbys;
	String factTable;

    /**
     * Default constructor. 
     */
    public Servlet1() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.request = request;
		this.response = response;
		
		String message = "DoGet\n" + "Served at: " + request.getContextPath();
		
		response.getWriter().append(message);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String message = "DoPost\n" + "Served at: " + request.getContextPath();
		this.request = request;
		this.response = response;
		
		switch(request.getServletPath())
		{
			case "/SelectCols": processColumns();
								break;
			case "/SelectOperation": processOperation();
									 break;
			default: request.getRequestDispatcher("index.jsp").forward(request, response);
								break;
								
		}
		//String cropid = (String)request.getParameter("cropid");
		//System.out.println("Crop ID: " + cropid);
		
	}
	
	private void processColumns() throws ServletException, IOException
	{
		ArrayList<DBTable> dbTables = new ArrayList();
		ArrayList<String> paramValues = new ArrayList();
		paramValues.add("crop_type");
		paramValues.add("crop");
		paramValues.add("aquani");
		paramValues.add("roof");
		paramValues.add("location");
		paramValues.add("household");
		paramValues.add("housetype");
		paramValues.add("aquani_type");
		paramValues.add("calamity");
		paramValues.add("calamity_type");
		paramValues.add("wall");
		
		
		
		
		for(int a=0; a < paramValues.size(); a++)
		{
			String[] strings = request.getParameterValues(paramValues.get(a));
			DBTable table = new DBTable();
			
			if(strings != null)
			for(int b=0; b < strings.length; b++)
			{
				String s = strings[b];
				System.out.println(s);
				
				if(s != null && s.length() > 0)
				{
					table.addColumn(s);
				}
			}
			dbTables.add(table);
		}
		
		DBTable crop_type = dbTables.get(0);
		crop_type.setName("crop_type");
		DBTable crop = dbTables.get(1);
		crop.setName("crop");
		DBTable aquani = dbTables.get(2);
		aquani.setName("aquani");
		DBTable roof = dbTables.get(3);
		roof.setName("roof");
		DBTable location = dbTables.get(4);
		location.setName("location");
		DBTable household = dbTables.get(5);
		household.setName("household");
		DBTable housetype = dbTables.get(6);
		housetype.setName("housetype");
		DBTable aquani_type = dbTables.get(7);
		aquani_type.setName("aquani_type");
		DBTable calamity = dbTables.get(8);
		calamity.setName("calamity");
		DBTable calamity_type = dbTables.get(9);
		calamity_type.setName("calamity_type");
		DBTable wall = dbTables.get(10);
		wall.setName("wall");
		
		factTable = null;
		aggregates = new ArrayList<String>();
		dimensions = new ArrayList<String>();
		groupbys = new ArrayList<String>();
		
		if(household.getColumns().size() != 0)
		{
			factTable = "household";
		}
		else if(calamity.getColumns().size() != 0)
		{
			factTable = "calamity";
		}
		else if(crop.getColumns().size() != 0)
		{
			factTable = "crop";
		}
		else if(aquani.getColumns().size() != 0)
		{
			factTable = "aquani";
		}
		
		for(int a =0; a < crop.getColumns().size(); a++)
		{
			aggregates.add(crop.getColumns().get(a));
		}
		
		//crop fact table
		for(int a = 0; a < crop.getColumns().size(); a++)
		{
			aggregates.add("f." + crop.getColumns().get(a));
		}
		if(crop_type.getColumns().size() != 0)
		{
			dimensions.add("crop_type");
			
			for(int a =0; a < crop_type.getColumns().size(); a++)
			{
				aggregates.add("crop_type." + crop_type.getColumns().get(a));
			}
		}
		
		//aquani fact table
		for(int a =0; a < aquani.getColumns().size(); a++)
		{
			aggregates.add("f." + aquani.getColumns().get(a));
		}
		
		if(aquani_type.getColumns().size() != 0)
		{
			dimensions.add("aquani_type");
			
			for(int a = 0; a < aquani_type.getColumns().size(); a++)
			{
				aggregates.add("aquani_type." + aquani_type.getColumns().get(a));
			}
		}
		//household fact table
		for(int a =0; a < household.getColumns().size(); a++)
		{
			aggregates.add("f." + household.getColumns().get(a));
		}
		
		if(roof.getColumns().size() != 0)
		{
			dimensions.add("roof");
			
			for(int a =0; a < roof.getColumns().size(); a++)
			{
				aggregates.add("roof." + roof.getColumns().get(a));
			}
		}
		
		if(wall.getColumns().size() != 0)
		{
			dimensions.add("wall");				
		
			for(int a =0; a < wall.getColumns().size(); a++)
			{
				aggregates.add("wall." + wall.getColumns().get(a));
			}
		}
		
		if(housetype.getColumns().size() != 0)
		{
			dimensions.add("housetype");
		
			for(int a =0; a < housetype.getColumns().size(); a++)
			{
				aggregates.add("housetype." + housetype.getColumns().get(a));
			}
		}
		
		//calamity fact table
		for(int a =0; a < calamity.getColumns().size(); a++)
		{
			aggregates.add("f." + calamity.getColumns().get(a));
		}
		
		//check for dimensions table
		if(location.getColumns().size() != 0)
		{
			dimensions.add("location");
		
			for(int a =0; a < location.getColumns().size(); a++)
			{
				aggregates.add("location." + location.getColumns().get(a));
			}
		}
		
		if(calamity_type.getColumns().size() != 0)
		{
			dimensions.add("calamity_type");
			
			for(int a =0; a < calamity_type.getColumns().size(); a++)
			{
				aggregates.add("calamity_type." + calamity_type.getColumns().get(a));
			}
		}
		
		//groupby
		for(String s : aggregates)
		{
			groupbys.add(s);
		}
		
		//for aggregate functions
				String[] checkboxValues = request.getParameterValues("aggregates");
				System.out.println("Checkboxes: ");
				if(checkboxValues != null)
				{
					for(int i = 0; i < checkboxValues.length; i++)
					{
						aggregates.add(request.getParameter(checkboxValues[i]));
						String[] temp = checkboxValues[i].split("_");
						factTable = temp[0];
						
					}
				}
		
		if(factTable != null && aggregates.size() != 0)
		{
			QueryBuilder q = new QueryBuilder(factTable);
				
			for (String s: aggregates)
			{
				q.addAggregate(s);
			}
			
			for (String s: groupbys)
			{
				q.addGroupBy(s);
			}
			
			for(String s: dimensions)
			{
				q.addDimension(s);
			}
			
			String s = q.buildQuery();
			System.out.println("Query: " + s);
			request.getSession().setAttribute("query", s);
			
			ResultSet rs = DBConnection.queryDB(s);
			
			request.getSession().setAttribute("ResultSet", rs);
			request.getSession().setAttribute("aggregates", aggregates);
	
			
		}
		
		request.getSession().setAttribute("aggregates", aggregates);
		request.getSession().setAttribute("dimensions", dimensions);
		request.getSession().setAttribute("factTable", factTable);
		request.getRequestDispatcher("ChooseOperation.jsp").forward(request, response);
		
		
	}

		
	
	private void processOperation() throws ServletException, IOException
	{
		
		//for the aggregate functions
		aggregates = new ArrayList<String>();
		groupbys = new ArrayList<String>();
		String[] strings = request.getParameterValues("checkedBoxes");
		if(strings != null)
		{
			for(int i = 0; i < strings.length; i++)
			{
				aggregates.add(strings[i]);
				if(!strings[i].contains("AVG") && 
				   !strings[i].contains("MIN") && 
				   !strings[i].contains("MAX") && 
				   !strings[i].contains("SUM") && 
				   !strings[i].contains("COUNT"))
				{
					System.out.println(strings[i]);
					System.out.println("OK");
					groupbys.add(strings[i]);
					
				}
			}
		}
		
		if(factTable != null && aggregates.size() != 0)
		{
			QueryBuilder q = new QueryBuilder(factTable);
				
			for (String s: aggregates)
			{
				q.addAggregate(s);
			}
			
			for (String s: groupbys)
			{
				q.addGroupBy(s);
			}
			
			for(String s: dimensions)
			{
				q.addDimension(s);
			}
			String[] slicendice = request.getParameterValues("slicedice");
			String[] temp;
			
			if(slicendice != null)
			{
				for(int i = 0; i < slicendice.length; i++)
				{
					temp = slicendice[i].split("\\.");
					if(temp.length > 1)
					{
						q.addSelection(temp[0]+ "." + temp[1], false);
					}
					if(!dimensions.contains(temp[0]))
					{
						q.addDimension(temp[0]);
					}
				}
			}
			
			
			String s = q.buildQuery();
			request.getSession().setAttribute("query", s);
			System.out.println(s);
				
			Connection c = DBConnection.getConnection();
			PreparedStatement ps;
			try {
				ps = c.prepareStatement(s);
			if(slicendice != null)
			{
				for(int i = 0; i < slicendice.length; i++)
				{
					temp = slicendice[i].split("\\.");
					if(temp.length == 3)
						ps.setString(i+1, temp[2]);
				}
			}
			ResultSet rs;
			
			rs = ps.executeQuery();
			request.getSession().setAttribute("ResultSet", rs);
			request.getSession().setAttribute("aggregates", aggregates);
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		

		request.getRequestDispatcher("ChooseOperation.jsp").forward(request, response);
	}

}
