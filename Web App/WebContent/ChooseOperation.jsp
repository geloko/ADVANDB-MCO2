<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Choose Operation</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div class="container">
	<h1>Query Operation</h1><br>
	<form action = "SelectOperation" method = "POST">
	
	<h2>Roll-Up</h2><br>
	<%
		ArrayList<String> aggregates = (ArrayList<String>)session.getAttribute("aggregates");
		for(int i = 0; i < aggregates.size(); i++)
		{
	%>
	<input type="checkbox" name="location" value= <%= aggregates.get(i)%> ><%=aggregates.get(i)%><br>
	<%} %>
	<h2>Drill Down</h2><br>
	<% String factTable = (String)session.getAttribute("factTable"); 
	
		//switch(factTable)
		//{
		//case "crop": 
	%>
	
	<h2>Slice</h2><br>
	
	<h2>Dice</h2><br>
	
	
		<input type="submit" value="Run Query">
	
	</form>
	</div>
	
	<jsp:include page="queryResults.jsp"/>
</body>
</html>