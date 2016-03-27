<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
	<div id="querySelect" class="container">
		<h1 id="selectLabel">Select Query</h1>
		
		<form action="Servlet1" method="post">
	  	
	  	<h3>crop type</h3>
			<input type="checkbox" name="crop_type" value="id">id<br>
	  		<input type="checkbox" name="crop_type" value="crop_type">type<br>
	  	
	  	<h3>crop</h3>
			<input type="checkbox" name="crop" value="id">id<br>
	  		<input type="checkbox" name="crop" value="volume">volume<br>
	  		<input type="checkbox" name="crop" value="line">line<br>
	  		<input type="checkbox" name="crop" value="typeID">typeID<br>
	  		<input type="checkbox" name="crop" value="locationID">locationID<br>
	  		
	  	<h3>aquani</h3>
			<input type="checkbox" name="aquani" value="id">id<br>
	  		<input type="checkbox" name="aquani" value="line">line<br>
	  		<input type="checkbox" name="aquani" value="volume">volume<br>
	  		<input type="checkbox" name="aquani" value="typeID">typeID<br>
	  		<input type="checkbox" name="aquani" value="locationID">locationID<br>
	  
	  	<h3>roof</h3>
			<input type="checkbox" name="roof" value="id">id<br>
	  		<input type="checkbox" name="roof" value="roof_mat">roof_mat<br>
	  		
	  	<h3>location</h3>
			<input type="checkbox" name="location" value="id">id<br>
	  		<input type="checkbox" name="location" value="mun">mun<br>
	  		<input type="checkbox" name="location" value="zone">zone<br>
	  		<input type="checkbox" name="location" value="brgy">brgy<br>
	  		<input type="checkbox" name="location" value="purok">purok<br>
	  	
	  	<h3>household</h3>
			<input type="checkbox" name="household" value="id">id<br>
	  		<input type="checkbox" name="household" value="locationID">locationID<br>
	  		<input type="checkbox" name="household" value="housetypeID">housetypeID<br>
	  		<input type="checkbox" name="household" value="wallID">wallID<br>
	  		<input type="checkbox" name="household" value="roofID">roofID<br>
	  	
	  	<h3>housetype</h3>
			<input type="checkbox" name="housetype" value="id">id<br>
	  		<input type="checkbox" name="housetype" value="housetype">housetype<br>
	  	
	  	<h3>aquani_type</h3>
			<input type="checkbox" name="aquani_type" value="id">id<br>
	  		<input type="checkbox" name="aquani_type" value="aquani_type">aquani_type<br>
	  	
	  	<h3>calamity</h3>
			<input type="checkbox" name="calamity" value="id">id<br>
	  		<input type="checkbox" name="calamity" value="typeID">typeID<br>
	  		<input type="checkbox" name="calamity" value="freq_year">freq_year<br>
	  		<input type="checkbox" name="calamity" value="locationID">locationID<br>
	  	
	  	<h3>calamity_type</h3>
			<input type="checkbox" name="calamity_type" value="id">id<br>
	  		<input type="checkbox" name="calamity_type" value="calamity_type">calamity_type<br>
	  		
	  	<h3>wall</h3>
			<input type="checkbox" name="wall" value="id">id<br>
	  		<input type="checkbox" name="wall" value="wall_mat">wall_mat<br>
	  		
	  	<input type="submit" value="Run Query">
	  		
		</form>
		
		
	</div>
