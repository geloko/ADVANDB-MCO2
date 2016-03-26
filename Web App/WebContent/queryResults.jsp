<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
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

<%
	ResultSet rs = (ResultSet)session.getAttribute("ResultSet");
	
if(rs != null)
	try{
		while(rs.next())
		{
			%>
			<%= rs.getInt("id")%>
	<% 	}
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	%>


	<div class="container">
		<h1>Table Name</h1>
		<table>
			<tr>
				<th>column 1</th>
				<th>column 2</th>
				<th>column 3</th>
			</tr>
			<c:forEach var="item" items="itemSelected">
				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
