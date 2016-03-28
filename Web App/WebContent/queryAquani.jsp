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
	  
			<h2>Aquani</h2>
			<input type="checkbox" name="aquani" value="COUNT(*)" checked>Count
			<select name = "aquani_id">
				<option value = "">No Aggregate Function</option>
				<option value = "COUNT(f.id)">Count</option>
			</select>
	  		<br>
	  		<input type="checkbox" name="aggregates" value="aquani_line">line
			<select name = "aquani_line">
				<option value = "f.line">No Aggregate Function</option>
				<option value = "AVG(f.line)">Average</option>
				<option value = "SUM(f.line)">Sum</option>
				<option value = "MIN(f.line)">Min</option>
				<option value = "MAX(f.line)">Max</option>
			</select>
	  		<br>
	  		<input type="checkbox" name="aggregates" value="aquani_volume">volume
			<select name = "aquani_volume">
				<option value = "f.volume">No Aggregate Function</option>
				<option value = "AVG(f.volume)">Average</option>
				<option value = "SUM(f.volume)">Sum</option>
				<option value = "MIN(f.volume)">Min</option>
				<option value = "MAX(f.volume)">Max</option>
			</select>
	  		<br>
	  
	  	<h3>aquani_type</h3>
	  		<input type="checkbox" name="aquani_type" value="aquani_type">aquani_type<br>
	  	
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