<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HomePage - testPage</title>
</head>
<body>
<div>
	<h2>User</h2>
	<a href='<c:url value="/user/add"/>'>Add User</a><br/>
	<a href='<c:url value="/user/list"/>'>Users</a><br/>
	<sec:authorize access="hasRole('ADMINISTRATOR')">
	<a href='<c:url value="/admin/status"/>'>MilSim status</a><br/>
	</sec:authorize>
</div>

</body>
</html>