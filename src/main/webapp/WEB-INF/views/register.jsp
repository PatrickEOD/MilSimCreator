<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %> <!-- taglibs are not ignored -->
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
<title>Registration</title>
</head>
<body id="register-page">
<div class="container">
		<div class="logo"></div>
		<div class="row">
			<div class="col-md-12">
				<div class="pr-wrap"></div>
				<div class="wrap">
					<p class="form-title"> Sign up your data:</p>
					<form:form class="login" method="post" action="/MilSimCreator/register" modelAttribute="user">
		
						<form:hidden path="id"/>
						<form:hidden path="created"/>
						<form:hidden path="priviliges"/>
						<form:hidden path="active"/>
						
						<div class="form-group row">
							<form:input type="text" path="login" placeholder="Enter login"/>
							<form:errors path="login" class="alert alert-danger alert-dismissible fade in">
								<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
								</form:errors>
						</div>
						
						<div class="form-group row">
							<form:input type="password" path="password" placeholder="Enter password"/>
							<form:errors path="password" class="alert alert-danger alert-dismissible fade in">
								<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
								</form:errors>
						</div>
	
						<div class="form-group row">
							<form:input type="email" path="email" placeholder="Enter email"/>
							<form:errors path="email" class="alert alert-danger alert-dismissible fade in">
								<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
								</form:errors>
						</div>
						
						<div class="form-group row">
							<form:input type="text" path="groupMember" placeholder="Enter group you are a member of"/>
						</div>
	
						<div class="form-group row">
<!-- 							<label for="selectW" class="weapon">Primary weapon of choice:</label> -->
							<form:select class="weapon" path="primaryWeapon">
								<form:option value="" label="Primary weapon of choice:"/>
								<form:options items="${WeaponType}"/>
							</form:select>
							<form:errors path="primaryWeapon" class="alert alert-danger alert-dismissible fade in">
								<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
								</form:errors>
						</div>
						
						<div class="form-group row">
<!-- 							Backup weapon of choice: -->
							<form:select class="weapon" path="backupWeapon">
								<form:option value="" label="Backup weapon of choice"/>
								<form:options items="${WeaponType}"/>
							</form:select>
						</div>
	
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<input type="submit" value="Register" class="login btn btn-success btn-sm">
					</form:form>
					<div class="login">
					<a href='<c:url value="/login"/>' class="login btn btn-success btn-sm" role="button">Login page</a>
					</div>
				</div>
			</div>
		</div>
		<c:if test="${param.loggedout != null}">
			<div class="posted-by">Successfully logged out</div>
		</c:if>
	</div>
	
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>