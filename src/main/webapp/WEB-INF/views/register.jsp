<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %> <!-- taglibs are not ignored -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration</title>
</head>
<body>
<h1>Registration</h1>

<div>
	<h2>Register!</h2>
	<h4>if you do not have login...</h4>
	<form:form method="post" action="/MilSimCreator/register" modelAttribute="user">
<%-- 		<form:input type="text" path="userName" placeholder="Enter username"/> --%>
<%-- 		<form:input type="password" path="password" placeholder="Enter password"/> --%>
<%-- 		<form:input type="text" path="email" placeholder="Enter email"/> --%>
		
		<form:hidden path="id"/>
		<form:hidden path="created"/>
		<form:hidden path="priviliges"/>
		<form:hidden path="active"/>
		
		Login:
		<form:input type="text" path="login" placeholder="Enter login"/>
		<form:errors path="login"/><br/>
	
		Password:
		<form:input type="password" path="password" placeholder="Enter password"/>
		<form:errors path="password"/><br/>
	
		Email:
		<form:input type="email" path="email" placeholder="Enter email"/>
		<form:errors path="email"/><br/>
	
		Group Member:
		<form:input type="text" path="groupMember" placeholder="Enter group you are a member of"/><br/>
	
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
	
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		
		<input type="submit" value="Register">
	</form:form>
	
<%-- 	<form method="post" action="/MilSimCreator/register"> --%>
<!-- 		<input type="text" name="login" placeholder="Enter login"> -->
<!-- 		<input type="password" name="password" placeholder="Enter password"> -->
<%-- 		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
<!-- 		<input type="submit" value="Register"> -->
<%-- 	</form> --%>
</div>
<a href='<c:url value="/login"/>'>Go back to login page</a><br/>
</body>
</html>