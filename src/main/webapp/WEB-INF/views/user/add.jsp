<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add User</title>
</head>
<body>
<h1>User creator</h1>
<form:form method="post" action="http://localhost:8080/MilSimCreator/user/add" modelAttribute="user">
	<form:hidden path="id"/>
	Login:
	<form:input type="text" path="login"/><br/>
	Password:
	<form:input type="password" path="password"/><br/>
	Email:
	<form:input type="email" path="email"/><br/>
	Group Member:
	<form:input type="text" path="groupMember"/><br/>
	<input type="submit" value="save"/>
	Primary weapon of choice:
	<form:checkboxes items="${WeaponType}" path="primaryWeapon"/><br/>
	
</form:form>
<br/>
<a href='<c:url value="/user/list"/>'>Users</a>

</body>
</html>