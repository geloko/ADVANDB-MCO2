<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="<c:url value="mco2.css" />" />
</head>
<body>
<jsp:include page="header.jsp"/>
	<div class = "container">
	<form action="SelectCols" method="post">
	  
			
	  	
	  	<h2>Household</h2>
			<input type="checkbox" name="aggregates" value="household_id" checked>Count
			<select name = "household_id">
				<option value = "">No Aggregate Function</option>
				<option value = "COUNT(f.id)">Count</option>
			</select>
	  		<br>
	  	
	  	<h3>roof</h3>
	  		<input type="checkbox" name="roof" value="roof_mat">roof_mat<br>
	  	
	  	<h3>housetype</h3>
	  		<input type="checkbox" name="housetype" value="housetype">housetype<br>
	  	
	  	<h3>wall</h3>
	  		<input type="checkbox" name="wall" value="wall_mat">wall_mat<br>
	  			
	  	<h3>location</h3>
	  		<input type="checkbox" name="location" value="mun">mun<br>
	  		<input type="checkbox" name="location" value="zone">zone<br>
	  		<input type="checkbox" name="location" value="brgy">brgy<br>
	  		<input type="checkbox" name="location" value="purok">purok<br>
	  	
	  	
	  	<input type="submit" value="Continue">
	  
	 </div>
	  		
	<jsp:include page="queryResults.jsp"/>
</body>
</html>