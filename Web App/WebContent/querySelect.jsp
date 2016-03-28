<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
	<div id="querySelect" class="container">
		<h1 id="selectLabel">Select Columns</h1>
		
		<form action="SelectCols" method="post">
	  
	  	<h2>Crop</h2>
			<input type="checkbox" name = "aggregates" value = "crop_id">id
			<select name = "crop_id">
				<option value = "f.id">No Aggregate Function</option>
				<option value = "AVG(f.id)">Average</option>
				<option value = "SUM(f.id)">Sum</option>
				<option value = "MIN(f.id)">Min</option>
				<option value = "MAX(f.id)">Max</option>
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
	  		
	  	<h2>Aquani</h2>
			<input type="checkbox" name="aggregates" value="aquani_id">id
			<select name = "aquani_id">
				<option value = "f.id">No Aggregate Function</option>
				<option value = "AVG(f.id)">Average</option>
				<option value = "SUM(f.id)">Sum</option>
				<option value = "MIN(f.id)">Min</option>
				<option value = "MAX(f.id)">Max</option>
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
				<option value = "COUNT(f.line)">Count</option>
			</select>
	  		<br>
	  		<input type="checkbox" name="aggregates" value="aquani_volume">volume
			<select name = "aquani_volume">
				<option value = "f.volume">No Aggregate Function</option>
				<option value = "AVG(f.volume)">Average</option>
				<option value = "SUM(f.volume)">Sum</option>
				<option value = "MIN(f.volume)">Min</option>
				<option value = "MAX(f.volume)">Max</option>
				<option value = "COUNT(f.volume)">Count</option>
			</select>
	  		<br>
	  
	  	<h3>aquani_type</h3>
	  		<input type="checkbox" name="aquani_type" value="aquani_type">aquani_type<br>
	  	
	  	<h3>location</h3>
	  		<input type="checkbox" name="location" value="mun">mun<br>
	  		<input type="checkbox" name="location" value="zone">zone<br>
	  		<input type="checkbox" name="location" value="brgy">brgy<br>
	  		<input type="checkbox" name="location" value="purok">purok<br>
	  	
	  	<h2>Calamity</h2>
			<input type="checkbox" name="aggregates" value="calamity_id">id
			<select name = "calamity_id">
				<option value = "f.id">No Aggregate Function</option>
				<option value = "AVG(f.id)">Average</option>
				<option value = "SUM(f.id)">Sum</option>
				<option value = "MIN(f.id)">Min</option>
				<option value = "MAX(f.id)">Max</option>
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
				<option value = "COUNT(f.freq_year)">Count</option>
			</select>
	  		<br>
	  	
	  	<h3>calamity_type</h3>
	  		<input type="checkbox" name="calamity_type" value="calamity_type">calamity_type<br>

	  	<h3>location</h3>
	  		<input type="checkbox" name="location" value="mun">mun<br>
	  		<input type="checkbox" name="location" value="zone">zone<br>
	  		<input type="checkbox" name="location" value="brgy">brgy<br>
	  		<input type="checkbox" name="location" value="purok">purok<br>
	  			  	
	  	<h2>Household</h2>
			<input type="checkbox" name="aggregates" value="household_id">id
			<select name = "household_id">
				<option value = "f.id">No Aggregate Function</option>
				<option value = "AVG(f.id)">Average</option>
				<option value = "SUM(f.id)">Sum</option>
				<option value = "MIN(f.id)">Min</option>
				<option value = "MAX(f.id)">Max</option>
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
	  		
		</form>
		
		
	</div>
