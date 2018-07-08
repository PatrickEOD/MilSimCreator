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
<jsp:include page="../fragments/header.jsp" />
<h1>User creator</h1>
<form:form method="post" action="http://localhost:8080/MilSimCreator/user/add" modelAttribute="user">
	<form:hidden path="id"/>
	<form:hidden path="created"/>
	<form:hidden path="priviliges"/>
	<form:hidden path="active"/>
	
	Login:
	<form:input type="text" path="login"/>
	<form:errors path="login"/><br/>
	
	Password:
	<form:input type="password" path="password"/>
	<form:errors path="password"/><br/>
	
	Email:
	<form:input type="email" path="email"/>
	<form:errors path="email"/><br/>
	
	Group Member:
	<form:input type="text" path="groupMember"/><br/>
	
	Primary weapon of choice:
	<form:select path="primaryWeapon">
		<form:option value="" label="Choose option"/>
		<form:options items="${WeaponType}"/>
	</form:select>
	<form:errors path="primaryWeapon"/><br/>
	
	Backup weapon of choice:
	<form:select path="backupWeapon">
		<form:option value="" label="Not used"/>
		<form:options items="${WeaponType}"/>
	</form:select><br/>
	
	<input type="submit" value="save"/>
</form:form>
<a href='<c:url value="/user/list"/>'>Users</a><br/>
<a href='<c:url value="/homePage"/>'>Go To HomePage</a><br/>

</body>
</html>