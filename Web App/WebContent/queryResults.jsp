<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.sql.ResultSetMetaData" %>
<%@ page import = "java.sql.Types" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Results</title>
<link rel="stylesheet" href="<c:url value="mco2.css" />" />
</head>
<body>
<h1><%= session.getAttribute("query") %></h1>

<%
	ArrayList<String> aggregates = (ArrayList<String>) session.getAttribute("aggregates");
	ResultSet rs = (ResultSet)session.getAttribute("ResultSet");
	int counter = 0;
	
	if(aggregates != null && rs != null)
	{
%>		
	<div class="container">
		<table>
			<tr>
			<%
			//header
			for (String s: aggregates)
			{
				%>
				<th>
					<%= s %>	
				</th>
				<% 
			}
				%>
			</tr>
		
			<%
			try{
				while(rs.next())
				{
					counter++;
					ResultSetMetaData rsmd = rs.getMetaData();
				%>
					<tr>
				<%
					//rows
					for(int a = 0; a < aggregates.size(); a++)
					{
						int type = rsmd.getColumnType(a+1);
						 if (type == Types.VARCHAR || type == Types.CHAR) 
						 {
				%>
						<td>
							<%= rs.getString(a+1)%>
						</td>
				<%
						 }
						 else
						 {
				%>
						<td>
							<%= rs.getInt(a+1)%>
						</td>
				<%
						 }
					}
				%>
					</tr>
				<% 
				}
				}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}
				%>		
		</table>
		
		<h3> Row Count: 
			<%= counter %>
		</h3>
		
	</div>
		
<% 	
	}
%>
	


</body>
</html>
