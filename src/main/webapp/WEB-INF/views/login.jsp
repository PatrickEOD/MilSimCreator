<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!-- taglibs are not ignored -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<link href='<spring:url value="/resources/css/styleFront.css"/>'
	rel="stylesheet" />
<title>MilSim Creator: Sign in</title>
</head>
<body id="login-page">
<!-- 	<div> -->
<%-- 		<c:if test="${not empty newUser}"> --%>
<!-- 			<p> -->
<%-- 				<c:out value="${newUser}" /> --%>
<!-- 			</p> -->
<%-- 		</c:if> --%>
<!-- 	</div> -->
	<div class="container">
		<div class="logo"></div>
		<div class="row">
			<div class="col-md-12">
				<div class="pr-wrap"></div>
				<div class="wrap">
					<p class="form-title">Sign in!</p>
						<c:if test="${param.error != null}">
							<div class="alert alert-danger alert-dismissible fade in">
								<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
								<p>Invalid credentials!!!</p>
							</div>
						</c:if>
					<form class="login" method="post" action="/MilSimCreator/login">
						<input type="text" name="login" placeholder="Enter login">
						<input type="password" name="password" placeholder="Enter password"> 
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
						<input type="submit" value="Log in" class="btn btn-success btn-sm"/>
					</form>
					<div class="login">
						<p class="form-title">No account?</p>
						<a href='<c:url value="/register"/>'
							class="login btn btn-success btn-sm" role="button">Register</a>
					</div>
				</div>
			</div>
		</div>
		<c:if test="${param.loggedout != null}">
			<div class="posted-by">Successfully logged out</div>
		</c:if>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>