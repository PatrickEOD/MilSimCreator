<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit User</title>
</head>
<body>
<h1>Edit User</h1>
<form:form method="post" action="http://localhost:8080/MilSimCreator/user/add" modelAttribute="user">
	<form:hidden path="id"/>
	<sec:authorize access="hasRole('USER')">
	Login:
	<form:input type="text" path="login"/><br/>
	<form:hidden path="password"/><br/>
	Email:
	<form:input type="email" path="email"/><br/>
	Group Member:
	<form:input type="text" path="groupMember"/><br/>
	Primary weapon of choice:
	<form:checkboxes items="${WeaponType}" path="primaryWeapon"/><br/>
	Backup weapon of choice:
	<form:checkboxes items="${WeaponType}" path="backupWeapon"/><br/>
	</sec:authorize>
	<sec:authorize access="hasRole('ADMINISTRATOR')">
	Ban user:
	<form:checkbox path="active" value="true"/><br/>
	</sec:authorize>
	<form:errors path="*" />
		<input type="submit" value="save"/>
</form:form>
<a href='<c:url value="/user/list"/>'>Users</a><br/>
<a href='<c:url value="/homePage"/>'>Go To HomePage</a><br/>
</body>
</html>