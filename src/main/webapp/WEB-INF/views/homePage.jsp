<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HomePage - testPage</title>
</head>
<body>
<jsp:include page="fragments/header.jsp" />
<div>
	<h2>Home Page</h2>
	
	<div>
		<p>Available ${authorizedUser.groupMember} Team Operators:</p>
		<table>
			<th>${authorizedUser.groupMember}</th>
			<th>Primary</th>
			<th>Backup</th>
			<c:forEach items="${groupMembers}" var="m">
					<tr>
						<td>${m.login}</td>
						<td>${m.primaryWeapon}</td>
						<td>${m.backupWeapon}</td>
					</tr>
			</c:forEach>
		</table>
	</div>
	<div>
	<h3>Add conversations:</h3>
		<form:form method="post" action="http://localhost:8080/MilSimCreator/tweet/add" modelAttribute="addTweet">
			<form:hidden path="id"/>
<%-- 			<form:hidden path="user"/> --%>
			<form:hidden path="created"/>
			<form:label path="text">Type a post:</form:label><br/>
			<form:textarea type="text" rows="4" cols="50" path="text"/>
			<form:errors path="text"/>
			
			<input type="submit" value="Send"/>
		</form:form>
	</div>
	<div>
	<h3>Conversations:</h3>
		<table>
			<tr>
				<th>Text:</th>
				<th>User</th>
				<th>Date:</th>
			</tr>
			<c:forEach items="${tweetList}" var="tweet">
				<tr>
					<td>${tweet.text}</td>
					<td>${tweet.user.login}</td>
					<td><fmt:formatDate value="${tweet.created}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<c:if test="${tweet.user.login == authorizedUser.login}">
						<td><a href='<c:url value="/tweet/delete/${tweet.id}"/>'>Delete</a></td>
					</c:if>
					<br/>
					<table>
						<tr>
							<th>Comments:</th>
						</tr>
						<c:forEach items="${commentList}" var="comment">
							<c:if test="${tweet.id == comment.tweet.id}">
								<tr>
									<td>${comment.text}</td>
									<td>${comment.user.login}</td>
									<td><fmt:formatDate value="${comment.created}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									<c:if test="${comment.user.login == authorizedUser.login}">
										<td><a href='<c:url value="/comment/delete/${comment.id}"/>'>Delete</a></td>
									</c:if>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</tr>
				<tr>
					<form:form method="post" action="http://localhost:8080/MilSimCreator/comment/add" modelAttribute="addComment">
					<form:hidden path="id"/>
<%-- 				<form:hidden path="user"/> --%>
<%-- 					<form:hidden path="tweet"/> --%>
					<form:hidden path="tweet" value="${tweet.id}"/>
					<form:hidden path="created"/>
					<form:label path="text">Add comment:</form:label><br/>
					<form:textarea type="text" rows="2" cols="25" path="text"/>
					<form:errors path="text"/>
			
					<input type="submit" value="Send"/>
					</form:form>
				</tr>
			</c:forEach>			
		</table>
	</div>
	<a href='<c:url value="/user/edit/${authorizedUser.id}"/>'>Edit account</a></br>
	<a href='<c:url value="/tweet/userTweetList/${authorizedUser.id}"/>'>Your conversations</a><br/>
	<sec:authorize access="hasRole('ADMINISTRATOR')">
	<a href='<c:url value="/user/add"/>'>Add User</a><br/>
	<a href='<c:url value="/user/list"/>'>Users</a><br/>
	<a href='<c:url value="/admin/status"/>'>MilSim status</a><br/>
	</sec:authorize>
</div>

</body>
</html>