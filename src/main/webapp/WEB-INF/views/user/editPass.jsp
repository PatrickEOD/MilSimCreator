<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Change password</title>
</head>
<body>

<jsp:include page="../fragments/header.jsp" />
<h1>Change your password</h1>
<form:form method="post" action="http://localhost:8080/MilSimCreator/user/editPass" modelAttribute="user">
	<form:hidden path="id"/>
	<form:hidden path="login"/>
	<form:hidden path="email"/>
	<form:hidden path="groupMember"/>
	<form:hidden path="primaryWeapon"/>
	<form:hidden path="backupWeapon"/>
	<form:hidden path="created"/>
	<form:hidden path="priviliges"/>
	<form:hidden path="active"/>
	<form:hidden path="password"/>
	
	Old Password:
	<input type="password" name="oldPassword"/><br/>
	
	New Password:
	<input type="password" name="newPassword"/><br/>
	
	Confirm Password:
	<input type="password" name="confirmPassword"/><br/>
	
	<input type="submit" value="save"/>
</form:form>
<br/>
<a href='<c:url value="/homePage"/>'>Go To HomePage</a><br/>

</body>
</html>