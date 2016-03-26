<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADVANDB MCO2</title>
<link rel="stylesheet" href="<c:url value="mco2.css" />" />
</head>
<body>
	<jsp:include page="header.jsp"/>
	<jsp:include page="querySelect.jsp"/>
	<jsp:include page="queryResults.jsp"/>
</body>
</html>