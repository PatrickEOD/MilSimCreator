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
	<h3>New Message:</h3>
		<form:form method="post" action="http://localhost:8080/MilSimCreator/tweet/add" modelAttribute="addTweet">
			<form:hidden path="id"/>
			<form:hidden path="user"/>
			<form:hidden path="created"/>
			Text:
			<form:input type="text" path="text"/>
			<form:errors path="text"/>
			
			<input type="submit" value="Send"/>
		</form:form>
	</div>
	<div>
	<h3>Messages:</h3>
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
				</tr>
			</c:forEach>			
		</table>
	</div>
	<a href='<c:url value="/user/edit/${authorizedUser.id}"/>'>Edit account</a>
	<sec:authorize access="hasRole('ADMINISTRATOR')">
	<a href='<c:url value="/user/add"/>'>Add User</a><br/>
	<a href='<c:url value="/user/list"/>'>Users</a><br/>
	<a href='<c:url value="/admin/status"/>'>MilSim status</a><br/>
	</sec:authorize>
</div>

</body>
</html>