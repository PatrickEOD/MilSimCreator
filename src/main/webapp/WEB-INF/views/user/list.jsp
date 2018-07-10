<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List Users</title>
</head>
<body>
<jsp:include page="../fragments/header.jsp" />
<h1>List of Users</h1>
<table>
	<tr>
		<th>Login</th>
		<th>Email</th>
		<th>Group Member</th>
		<th>Primary</th>
		<th>Backup</th>
		<th>Priviliges</th>
		<th>Created</th>
		<th>State</th>
	</tr>
	<c:forEach items="${user}" var="a">
		<tr>
			<td>${a.login}</td>
			<td>${a.email}</td>
			<td>${a.groupMember}</td>
			<td>${a.primaryWeapon}</td>
			<td>${a.backupWeapon}</td>
			<td>
				<c:forEach items="${a.priviliges}" var="c">
					${c}
				</c:forEach>
			</td>
			<td><fmt:formatDate value="${a.created}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td>${a.active ? "OK" : "BANNED"}</td>
			<td><a href='<c:url value="/user/edit/${a.id}"/>'>Edit User</a>
				<sec:authorize access="hasRole('ADMINISTRATOR')">
					<a href='<c:url value="/user/editPass/${a.id}"/>'>Change password</a>
				</sec:authorize>
				<a href='<c:url value="/user/delete/${a.id}"/>'>Delete User</a></td>
		</tr>
	</c:forEach>
</table>
<a href='<c:url value="/homePage"/>'>Go To HomePage</a><br/>
</body>
</html>