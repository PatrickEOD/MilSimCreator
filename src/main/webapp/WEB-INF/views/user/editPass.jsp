<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<link href='<spring:url value="/resources/css/styleHome.css"/>'	rel="stylesheet" />
<link href='<spring:url value="/resources/css/styleFront.css"/>' rel="stylesheet" />
<title>Change password</title>
</head>
<body>
<div class="wrapper">
		<div class="box">
			<div class="row row-offcanvas row-offcanvas-left">


				<!-- sidebar -->
				<div class="column col-sm-2 col-xs-1 sidebar-offcanvas" id="sidebar">

					<ul class="nav">
						<li><a href="#" data-toggle="offcanvas"
							class="visible-xs text-center"><i
								class="glyphicon glyphicon-chevron-right"></i></a></li>
					</ul>


					<ul class="nav hidden-xs" id="lg-menu">
						<li class="active"><a href='<c:url value="/user/edit/${authorizedUser.id}"/>'><i class="glyphicon glyphicon-cog"></i> Edit account</a></li>
						<li><a href='<c:url value="/tweet/userTweetList/${authorizedUser.id}"/>'><i	class="glyphicon glyphicon-align-left"></i> Your conversations</a></li>
						<sec:authorize access="hasRole('ADMINISTRATOR')">
							<li><a href='<c:url value="/user/add"/>'><i
									class="glyphicon glyphicon-plus"></i> Add User</a></li>
							<li><a href='<c:url value="/user/list"/>'><i
									class="glyphicon glyphicon-list"></i> Users</a></li>
							<li><a href='<c:url value="/admin/status"/>'><i
									class="glyphicon glyphicon-hourglass"></i> MilSim status</a></li>
						</sec:authorize>
					</ul>

					<jsp:include page="../fragments/header.jsp" />

				</div>
				<!-- /sidebar -->

				<!-- main right col -->
				<div class="column col-sm-10 col-xs-11" id="main">

					<!-- top nav -->
					<div class="navbar navbar-dark">
						<div class="navbar-header">
							<button class="navbar-toggle" type="button"
								data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle</span> <span class="icon-bar"></span>
								<span class="icon-bar"></span> <span class="icon-bar"></span>
							</button>
							<a href="http://www.pretorians.pl/" class="navbar-brand hq">logo</a>
						</div>
						<nav class="collapse navbar-collapse" role="navigation">
						<ul class="nav navbar-nav">
							<li><a href="http://localhost:8080/MilSimCreator/homePage"><i
									class="glyphicon glyphicon-home"></i> Home</a></li>
							<li><a href="#postModal" role="button" data-toggle="modal"><i
									class="glyphicon glyphicon-screenshot"></i> Mil Sims</a></li>
						</ul>
						</nav>
					</div>
					<!-- /top nav -->

					<div class="padding">
						<div class="full col-sm-9">

							<!-- content -->
							<div class="row">


								<!-- main col -->
								<div class="col-sm-3">
								</div>
								<div class="col-sm-6">
									<div class="wrap">
										<p class="form-title">Change Password:</p>
										<form:form class="login" method="post" action="http://localhost:8080/MilSimCreator/user/editPass" modelAttribute="user">
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
											
											
											<div class="form-group row">
												<c:if test="${not empty wrongPassword}">
													<div class="alert alert-danger alert-dismissible fade in">
														<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
														<p ><c:out value="${wrongPassword}"/></p>
													</div>
												</c:if>
											</div>
											
											<div class="form-group row">
												<c:if test="${not empty wrongConfirm}">
													<div class="alert alert-danger alert-dismissible fade in">
														<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
														<p><c:out value="${wrongConfirm}"/></p>
													</div>
												</c:if>
											</div>
											
											<div class="form-group row">
												<input type="password" name="oldPassword" placeholder="Old password"/>
											</div>
											
											<div class="form-group row">
												<input type="password" name="newPassword" placeholder="New password"/>
											</div>
											
											<div class="form-group row">
												<input type="password" name="confirmPassword" placeholder="Confirm password"/>
											</div>
											
											<input type="submit" value="save" class="login btn btn-success btn-sm"/>
										</form:form>
									</div>
								</div>
								<div class="col-sm-3">
								</div>
							</div>

						</div>
						<!-- /col-9 -->
					</div>
					<!-- /padding -->
				</div>
				<!-- /main -->

			</div>
		</div>
	</div>








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
	
	<div>
		<c:if test="${not empty wrongPassword}">
			<p><c:out value="${wrongPassword}"/></p>
		</c:if>
	</div>
	<div>
		<c:if test="${not empty wrongConfirm}">
			<p><c:out value="${wrongConfirm}"/></p>
		</c:if>
	</div>
	
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
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>