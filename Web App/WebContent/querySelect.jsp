<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
	<div id="querySelect" class="container">
		<h1 id="selectLabel">Select Query</h1>
		<form action="theForm" method="get">
	  		<input type="checkbox" name="query" value="uh">Uh<br>
	  		<input type="checkbox" name="query" value="what">What<br>
	  		<input type="submit" value="Run Query">
		</form>
	</div>