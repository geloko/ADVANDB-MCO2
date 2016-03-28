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
	  
	  	<h2>Calamity</h2>
			<input type="checkbox" name="aggregates" value="calamity_id" checked>Count
			<select name = "calamity_id">
				<option value = "">No Aggregate Function</option>
				<option value = "COUNT(f.id)">Count</option>
			</select>
	  		<br>
	  		<input type="checkbox" name="aggregates" value="calamity_freq_year">freq_year
			<select name = "calamity_freq_year">
				<option value = "f.freq_year">No Aggregate Function</option>
				<option value = "AVG(f.freq_year)">Average</option>
				<option value = "SUM(f.freq_year)">Sum</option>
				<option value = "MIN(f.freq_year)">Min</option>
				<option value = "MAX(f.freq_year)">Max</option>
			</select>
	  		<br>
	  	
	  	<h3>calamity_type</h3>
	  		<input type="checkbox" name="calamity_type" value="calamity_type">calamity_type<br>

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