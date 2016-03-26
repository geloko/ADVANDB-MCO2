package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DBTable;

/**
 * Servlet implementation class Servlet1
 */
@WebServlet("/Servlet1")
public class Servlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		/*
		String[] strings = request.getParameterValues("wall");
		
		if(strings != null)
		{
			for(int a=0; a < strings.length; a++)
			message += "\n" + strings[a];
		}
		*/
		
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
				
				if(s != null)
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
		
	/*	
		message += wall.getColumns().size();
		
		for(int a=0; a<wall.getColumns().size(); a++)
		{
			String s = wall.getColumns().get(a);
			message += s + " ";
			
		}

		
		*/
		
		for(DBTable d : dbTables)
		{
			message += "<br>" + d.getName();
			
			if(d.getColumns().size()!=0)
			{
				ArrayList<String> strings = d.getColumns();
				
				for(String s: strings)
				{
					message += "<br>" + s;
				}
			}
			else
			{
				message += "<br>" + "none";
			}
			
		}
		
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.print("<html>" + message + "</html>");
		
		
		//response.getWriter().append(message);
		
	}

}
=======
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DBConnection;
import Model.DBTable;

/**
 * Servlet implementation class Servlet1
 */
@WebServlet("/Servlet1")
public class Servlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		/*
		String[] strings = request.getParameterValues("wall");
		
		if(strings != null)
		{
			for(int a=0; a < strings.length; a++)
			message += "\n" + strings[a];
		}
		*/
		
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
				
				if(s != null)
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
		
	/*	
		message += wall.getColumns().size();
		
		for(int a=0; a<wall.getColumns().size(); a++)
		{
			String s = wall.getColumns().get(a);
			message += s + " ";
			
		}
	
		for(DBTable d : dbTables)
		{
			message += "<br>" + d.getName();
			
			if(d.getColumns().size()!=0)
			{
				ArrayList<String> strings = d.getColumns();
				
				for(String s: strings)
				{
					message += "<br>" + s;
				}
			}
			else
			{
				message += "<br>" + "none";
			}
			
		}
		
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.print("<html>" + message + "</html>");
		
*/		
		//response.getWriter().append(message);

		
		ResultSet rs = DBConnection.queryDB("select * from crop;");
		
		request.getSession().setAttribute("ResultSet", rs);
		request.getRequestDispatcher("queryResults.jsp").forward(request, response);

		
	}

}
>>>>>>> origin/master
=======
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DBTable;

/**
 * Servlet implementation class Servlet1
 */
@WebServlet("/Servlet1")
public class Servlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		/*
		String[] strings = request.getParameterValues("wall");
		
		if(strings != null)
		{
			for(int a=0; a < strings.length; a++)
			message += "\n" + strings[a];
		}
		*/
		
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
				
				if(s != null)
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
		
	/*	
		message += wall.getColumns().size();
		
		for(int a=0; a<wall.getColumns().size(); a++)
		{
			String s = wall.getColumns().get(a);
			message += s + " ";
			
		}

		
		*/
		
		for(DBTable d : dbTables)
		{
			message += "<br>" + d.getName();
			
			if(d.getColumns().size()!=0)
			{
				ArrayList<String> strings = d.getColumns();
				
				for(String s: strings)
				{
					message += "<br>" + s;
				}
			}
			else
			{
				message += "<br>" + "none";
			}
			
		}
		
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.print("<html>" + message + "</html>");
		
		
		//response.getWriter().append(message);
		
	}

}
