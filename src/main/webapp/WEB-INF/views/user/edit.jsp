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
<jsp:include page="../fragments/header.jsp" />
<h1>Edit User</h1>
<form:form method="post" action="http://localhost:8080/MilSimCreator/user/edit" modelAttribute="user">
	<form:hidden path="id"/>
	<form:hidden path="created"/>
	<form:hidden path="priviliges"/>
	<form:hidden path="password"/>
<%-- 	<form:hidden path="active"/> --%>
	
	Login:
	<form:input type="text" path="login"/>
	<form:errors path="login"/><br/>
	
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
		<form:option value="" label="Choose option"/>
		<form:options items="${WeaponType}"/>
	</form:select><br/>
	
	<sec:authorize access="hasRole('ADMINISTRATOR')">
	User active:
	<form:checkbox path="active"/><br/>
	</sec:authorize>
	
		<input type="submit" value="save"/>
</form:form>
<a href='<c:url value="/user/list"/>'>Users</a><br/>
<a href='<c:url value="/homePage"/>'>Go To HomePage</a><br/>
</body>
</html>