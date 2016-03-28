<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Choose Operation</title>
<link rel="stylesheet" href="<c:url value="mco2.css" />" />
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div class="container">
	<h1>Query Operation</h1><br>
	<h1><%= session.getAttribute("factTable") + " Table" %></h1><br>
	<form action = "SelectOperation" method = "POST">
	
	<h2>Roll-Up/Drill Down</h2><br>
	<%
		ArrayList<String> aggregates = (ArrayList<String>)session.getAttribute("aggregates");
		for(int i = 0; i < aggregates.size(); i++)
		{
	%>
	<input type="checkbox" name="checkedBoxes" value= <%= aggregates.get(i)%> checked><%=aggregates.get(i)%><br>
	<% } %>
	<h2>Slice and Dice</h2><br>
	<%
			switch((String)session.getAttribute("factTable"))
			{
				case "crop":%> 		Crop Type:
									<select name = "slicedice">
										<option value="" disabled selected>Select your option</option>
										<option value = "crop_type.crop_type.Sugar Cane">Sugar Cane</option>
										<option value = "crop_type.crop_type.Palay">Palay/Rice</option>
										<option value = "crop_type.crop_type.Corn">Corn</option>
										<option value = "crop_type.crop_type.Coffee">Coffee</option>
										<option value = "crop_type.crop_type.Other Crops">Other Crops</option>
										<option value = "crop_type.crop_type.Undefined">Undefined</option>
									</select>
			<%						break;
				case "aquani":%>	Aquatic Animal Type:
									<select name = "slicedice">
										<option value="" disabled selected>Select your option</option>
										<option value = "aquani_type.aquani_type.Tilapia">Tilapia</option>
										<option value = "aquani_type.aquani_type.Milkfish">Milkfish</option>
										<option value = "aquani_type.aquani_type.Catfish">Catfish</option>
										<option value = "aquani_type.aquani_type.Mudfish">Mudfish</option>
										<option value = "aquani_type.aquani_type.Carp">Carp</option>
										<option value = "aquani_type.aquani_type.Others">Others</option>
										<option value = "aquani_type.aquani_type.Undefined">Undefined</option>
									</select>
			<%						break;
				case "calamity":%>	Calamity Type:
									<select name = "slicedice">
										<option value="" disabled selected>Select your option</option>
										<option value = "calamity_type.calamity_type.typhoon">Typhoon</option>
										<option value = "calamity_type.calamity_type.flood">Flood</option>
										<option value = "calamity_type.calamity_type.drought">Drought</option>
										<option value = "calamity_type.calamity_type.earthquake">Earthquake</option>
										<option value = "calamity_type.calamity_type.volcanic eruption">Volcanic Eruption</option>
										<option value = "calamity_type.calamity_type.landslide">Landslide</option>
										<option value = "calamity_type.calamity_type.tsunami">Tsunami</option>
										<option value = "calamity_type.calamity_type.fire">Fire</option>
										<option value = "calamity_type.calamity_type.forest fire">Forest Fire</option>
									</select>
			<%						break;
				case "household":%>	Wall Material:
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
			<%						break;
			}
		%>
	
		<br>
		<input type="submit" value="Apply">
	
	</form>
	</div>
	
	<jsp:include page="queryResults.jsp"/>
</body>
</html>