<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div class = "container">
	<form action="SelectCols" method="post">
	  
	  	<h2>Crop</h2>
			<input type="checkbox" name = "aggregates" value = "crop_id" checked>Count(*)
			<select name = "crop_id">
				<option value = "f.id">No Aggregate Function</option>
				<option value = "COUNT(f.id)">Count</option>
			</select>
			<br>
	  		<input type="checkbox" name="aggregates" value="crop_volume">volume
	  		<select name = "crop_volume">
				<option value = "f.volume">No Aggregate Function</option>
				<option value = "AVG(f.volume)">Average</option>
				<option value = "SUM(f.volume)">Sum</option>
				<option value = "MIN(f.volume)">Min</option>
				<option value = "MAX(f.volume)">Max</option>
				<option value = "COUNT(f.volume)">Count</option>
			</select>
	  		<br>
	  		<input type="checkbox" name="aggregates" value="crop_line">line
	  		<select name = "crop_line">
				<option value = "f.line">No Aggregate Function</option>
				<option value = "AVG(f.line)">Average</option>
				<option value = "SUM(f.line)">Sum</option>
				<option value = "MIN(f.line)">Min</option>
				<option value = "MAX(f.line)">Max</option>
				<option value = "COUNT(f.line)">Count</option>
			</select>
	  		<br>
	  	<h3>crop type</h3>
	  		<input type="checkbox" name="crop_type" value="crop_type">type<br>
	  	
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