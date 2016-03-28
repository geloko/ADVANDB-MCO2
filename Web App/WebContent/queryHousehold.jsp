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
	  	<h2>Roll-Up/Drill Down</h2>
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
	  		
	  	<h2>Slice and Dice</h2>
			Wall Material:
									<select name = "slicedice">
										<option value="" disabled selected>Select your option</option>
										<option value = "wall.wall_mat.Strong Materials">Strong Materials</option>
										<option value = "wall.wall_mat.Light Materials">Light Materials</option>
										<option value = "wall.wall_mat.Makeshift Materials">Makeshift Materials</option>
										<option value = "wall.wall_mat.Predominantly Strong">Predominantly Strong</option>
										<option value = "wall.wall_mat.Predominantly Light">Predominantly Light</option>
										<option value = "wall.wall_mat.Predominantly Makeshift">Predominantly Makeshift</option>
										<option value = "wall.wall_mat.N/A">N/A</option>
									</select>
									<br>
									Roof Material:
									<select name = "slicedice">
										<option value="" disabled selected>Select your option</option>
										<option value = "roof.roof_mat.Strong Materials">Strong Materials</option>
										<option value = "roof.roof_mat.Light Materials">Light Materials</option>
										<option value = "roof.roof_mat.Makeshift Materials">Makeshift Materials</option>
										<option value = "roof.roof_mat.Predominantly Strong">Predominantly Strong</option>
										<option value = "roof.roof_mat.Predominantly Light">Predominantly Light</option>
										<option value = "roof.roof_mat.Predominantly Makeshift">Predominantly Makeshift</option>
										<option value = "roof.roof_mat.N/A">N/A</option>
									</select>
									<br>
									House Type:
									<select name = "slicedice">
										<option value="" disabled selected>Select your option</option>
										<option value = "housetype.housetype.Single House">Single House</option>
										<option value = "housetype.housetype.Duplex">Duplex</option>
										<option value = "housetype.housetype.Multi-Unit Residential">Multi-Unit Residential</option>
										<option value = "housetype.housetype.Commercial/Agricultural/Industrial">Commercial/Agricultural/Industrial</option>
										<option value = "housetype.housetype.Others">Others</option>
									</select>
		<br>
	  	
	  	<a href="index.jsp" class = "button">Back</a>
	  	<input type="submit" value="Continue">
	  
	 </div>
	  		
	<jsp:include page="queryResults.jsp"/>
</body>
</html>