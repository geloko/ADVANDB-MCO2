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
	<div class="container">
		<h1>Table Name</h1>
		<h5>Total Row Count: </h5>
		<h5>Query Execution Time: </h5>
		<table>
			<tr>
				<th>Row 1</th>
				<th>Row 2</th>
				<th>Row 3</th>
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