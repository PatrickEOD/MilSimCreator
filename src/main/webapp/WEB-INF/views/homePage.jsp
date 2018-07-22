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
<title>HomePage</title>
</head>
<body id="home-page">
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
						<li class="active"><a
							href='<c:url value="/user/edit/${authorizedUser.id}"/>'><i
								class="glyphicon glyphicon-cog"></i> Edit account</a></li>
						<li><a
							href='<c:url value="/tweet/userTweetList/${authorizedUser.id}"/>'><i
								class="glyphicon glyphicon-align-left"></i> Your conversations</a></li>
						<sec:authorize access="hasRole('ADMINISTRATOR')">
							<li><a href='<c:url value="/user/add"/>'><i
									class="glyphicon glyphicon-plus"></i> Add User</a></li>
							<li><a href='<c:url value="/user/list"/>'><i
									class="glyphicon glyphicon-list"></i> Users</a></li>
							<li><a href='<c:url value="/admin/status"/>'><i
									class="glyphicon glyphicon-hourglass"></i> MilSim status</a></li>
						</sec:authorize>
					</ul>

					<jsp:include page="fragments/header.jsp" />

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

								<!-- main col left -->
								<div class="col-sm-5">

									<div class="panel panel-default">
										<div class="panel-body">
											<p class="lead">Organizators</p>
											<p>
												<img src="static/assets/png/logo.png" width=auto height=auto>
											</p>
											<p class="lead">Sponsors</p>
											<p>
												<img src="static/assets/png/logo.png" width=auto height=auto>
											</p>
										</div>
									</div>


									<div class="panel panel-default">
										<div class="panel-heading">
											<h4>Available ${authorizedUser.groupMember} Team
												Operators:</h4>
										</div>
										<div class="panel-body">
											<div class="list-group">
												<table class="table table-striped table-hover">
													<tr>
														<th scope="col">${authorizedUser.groupMember}</th>
														<th scope="col">Primary</th>
														<th scope="col">Backup</th>
													</tr>
													<c:forEach items="${groupMembers}" var="m">
														<tr>
															<td scope="row">${m.login}</td>
															<td>${m.primaryWeapon}</td>
															<td>${m.backupWeapon}</td>
														</tr>
													</c:forEach>
												</table>
											</div>
										</div>
									</div>

									<div class="panel panel-default">
										<div class="panel-heading">
											<a href="#" class="pull-right">View all</a>
											<h4>More Templates</h4>
										</div>
										<div class="panel-body">
											<img src="//placehold.it/150x150"
												class="img-circle pull-right"> <a href="#">Free
												@Bootply</a>
											<div class="clearfix"></div>
											There a load of new free Bootstrap 3 ready templates at
											Bootply. All of these templates are free and don't require
											extensive customization to the Bootstrap baseline.
											<hr>
											<ul class="list-unstyled">
												<li><a href="http://www.bootply.com/templates">Dashboard</a></li>
												<li><a href="http://www.bootply.com/templates">Darkside</a></li>
												<li><a href="http://www.bootply.com/templates">Greenfield</a></li>
											</ul>
										</div>
									</div>

									<div class="panel panel-default">
										<div class="panel-heading">
											<h4>What Is Bootstrap?</h4>
										</div>
										<div class="panel-body">Bootstrap is front end
											frameworkto build custom web applications that are fast,
											responsive &amp; intuitive. It consist of CSS and HTML for
											typography, forms, buttons, tables, grids, and navigation
											along with custom-built jQuery plug-ins and support for
											responsive layouts. With dozens of reusable components for
											navigation, pagination, labels, alerts etc..</div>
									</div>


									<div class="panel panel-default">
										<div class="panel-heading">
											<a href="#" class="pull-right">View all</a>
											<h4>Portlet Heading</h4>
										</div>
										<div class="panel-body">
											<ul class="list-group">
												<li class="list-group-item">Modals</li>
												<li class="list-group-item">Sliders / Carousel</li>
												<li class="list-group-item">Thumbnails</li>
											</ul>
										</div>
									</div>

									<div class="panel panel-default">
										<div class="panel-thumbnail">
											<img src="/assets/example/bg_4.jpg" class="img-responsive">
										</div>
										<div class="panel-body">
											<p class="lead">Social Good</p>
											<p>1,200 Followers, 83 Posts</p>

											<p>
												<img
													src="https://lh6.googleusercontent.com/-5cTTMHjjnzs/AAAAAAAAAAI/AAAAAAAAAFk/vgza68M4p2s/s28-c-k-no/photo.jpg"
													width="28px" height="28px"> 
												<img
													src="https://lh4.googleusercontent.com/-6aFMDiaLg5M/AAAAAAAAAAI/AAAAAAAABdM/XjnG8z60Ug0/s28-c-k-no/photo.jpg"
													width="28px" height="28px"> 
												<img
													src="https://lh4.googleusercontent.com/-9Yw2jNffJlE/AAAAAAAAAAI/AAAAAAAAAAA/u3WcFXvK-g8/s28-c-k-no/photo.jpg"
													width="28px" height="28px">
											</p>
										</div>
									</div>

								</div>

								<!-- main col right -->
								<div class="col-sm-7">

									<div class="well">
										<form:form class="orm-horizontal" method="post"
											action="http://localhost:8080/MilSimCreator/tweet/add"
											modelAttribute="addTweet">
											<h4>Let your team know what are You planning...</h4>
											<div class="form-group" style="padding: 14px;">
												<form:hidden path="id" />
												<form:hidden path="created" />
												<form:textarea class="form-control" type="text" rows="4"
													cols="50" path="text" placeholder="Put your message here" />
												<form:errors path="text" />
												<input type="submit" value="Send"
													class="btn btn-primary pull-right" style="margin: 10px" />
											</div>
											<!-- <input type="submit" value="Send" class="btn btn-primary pull-right"/><ul class="list-inline"><li><a href=""><i class="glyphicon glyphicon-upload"></i></a></li><li><a href=""><i class="glyphicon glyphicon-camera"></i></a></li><li><a href=""><i class="glyphicon glyphicon-map-marker"></i></a></li></ul> -->
										</form:form>
									</div>
								
									<c:forEach items="${tweetList}" var="tweet">
										<div class="[ panel panel-default ] panel-google-plus">
											<div>
												<c:if test="${tweet.user.login == authorizedUser.login}">
													<h5 class="btn btn-danger btn-sm pull-right">
														<a href='<c:url value="/tweet/delete/${tweet.id}"/>'>Delete
															conversation</a>
													</h5>
												</c:if>
											</div>
											<div class="panel-heading">
												<img class="[ img-circle pull-left ]"
													src="https://lh3.googleusercontent.com/uFp_tsTJboUY7kue5XAsGA=s46"
													alt="User Image" />
												<h3>${tweet.user.login}</h3>
												<h5>
													<span><fmt:formatDate value="${tweet.created}"
															pattern="yyyy-MM-dd HH:mm:ss" /></span>
												</h5>

											</div>
											<div class="panel-body">
												<p>${tweet.text}</p>
												<c:forEach items="${commentList}" var="comment">
													<c:if test="${tweet.id == comment.tweet.id}">
														<img class="[ img-circle pull-right ]"
															src="https://lh3.googleusercontent.com/uFp_tsTJboUY7kue5XAsGA=s46"
															alt="User Image" />
														<h3>${comment.user.login}</h3>
														<h5>
															<span><fmt:formatDate value="${comment.created}"
																	pattern="yyyy-MM-dd HH:mm:ss" /></span>
														</h5>
														<p>${comment.text}</p>
														<c:if test="${comment.user.login == authorizedUser.login}">
															<h5 class="btn btn-danger btn-sm">
																<a href='<c:url value="/comment/delete/${comment.id}"/>'>Delete</a>
															</h5>
														</c:if>
													</c:if>
												</c:forEach>
											</div>

											<div class="panel-footer">
												<div class="input-placeholder">Add a comment...</div>
											</div>
											<div class="panel-google-plus-comment">
												<img class="[ img-circle]"
													src="https://lh3.googleusercontent.com/uFp_tsTJboUY7kue5XAsGA=s46"
													alt="User Image" />
												<div class="panel-google-plus-textarea">

													<form:form method="post"
														action="http://localhost:8080/MilSimCreator/comment/add"
														modelAttribute="addComment">
														<form:hidden path="id" />
														<form:hidden path="user" value="${authorizedUser.id}" />
														<form:hidden path="tweet" value="${tweet.id}" />
														<form:hidden path="created" />
														<form:textarea type="text" rows="4" path="text" />
														<form:errors path="text" />

														<input type="submit" value="Send"
															class="[ btn btn-success ]" />
													</form:form>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
									</c:forEach>

								</div>
							</div>
							<!--/row-->

							<div class="row">
								<div class="col-sm-6">
									<a href="#">Twitter</a> <small class="text-muted">|</small> <a
										href="#">Facebook</a> <small class="text-muted">|</small> <a
										href="#">Google+</a>
								</div>
							</div>

							<div class="row" id="footer">
								<div class="col-sm-6"></div>
								<div class="col-sm-6">
									<p>
										<a href="#" class="pull-right">©Copyright 2018</a>
									</p>
								</div>
							</div>
							<hr>

							<!--                       <hr> -->

							<!--                       <h4 class="text-center"> -->
							<!--                       <a href="http://bootply.com/96266" target="ext">Download this Template @Bootply</a> -->
							<!--                       </h4> -->

							<!--                       <hr> -->


						</div>
						<!-- /col-9 -->
					</div>
					<!-- /padding -->
				</div>
				<!-- /main -->

			</div>
		</div>
	</div>
	<!--post modal-->
	<!-- <div id="postModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true"> -->
	<!--   <div class="modal-dialog"> -->
	<!--   <div class="modal-content"> -->
	<!--       <div class="modal-header"> -->
	<!--           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button> -->
	<!-- 			Update Status -->
	<!--       </div> -->
	<!--       <div class="modal-body"> -->
	<%--           <form class="form center-block"> --%>
	<!--             <div class="form-group"> -->
	<!--               <textarea class="form-control input-lg" autofocus="" placeholder="What do you want to share?"></textarea> -->
	<!--             </div> -->
	<%--           </form> --%>
	<!--       </div> -->
	<!--       <div class="modal-footer"> -->
	<!--           <div> -->
	<!--           <button class="btn btn-primary btn-sm" data-dismiss="modal" aria-hidden="true">Post</button> -->
	<!--             <ul class="pull-left list-inline"><li><a href=""><i class="glyphicon glyphicon-upload"></i></a></li><li><a href=""><i class="glyphicon glyphicon-camera"></i></a></li><li><a href=""><i class="glyphicon glyphicon-map-marker"></i></a></li></ul> -->
	<!-- 		  </div>	 -->
	<!--       </div> -->
	<!--   </div> -->
	<!--   </div> -->
	<!-- </div> -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src='<spring:url value="/resources/js/commentBox.js"/>'></script>
</body>
</html>