<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %> <!-- taglibs are not ignored -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
</head>
<body>
<div>
	<c:if test="${param.loggedout != null}">
		<p>Successfully logged out</p>
	</c:if>
</div>
<div>
	<h2>Login!</h2>
	<c:if test="${param.error != null}">
		<p>Invalid credentials!!!</p>
	</c:if>
	<form method="post" action="/MilSimCreator/login">
		<input type="text" name="login" placeholder="Enter login">
		<input type="password" name="password" placeholder="Enter password">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="submit" value="Log in">
	</form>
</div>
</body>
</html>