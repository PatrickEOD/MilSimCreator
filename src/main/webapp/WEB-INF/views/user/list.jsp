<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List Users</title>
</head>
<body>
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
			<td><a href='<c:url value="/user/edit/${a.id}"/>'>Edit User</a>
				<a href='<c:url value="/user/editPass/${a.id}"/>'>Change password</a>
				<a href='<c:url value="/user/delete/${a.id}"/>'>Delete User</a></td>
		</tr>
	</c:forEach>
</table>
<a href='<c:url value="/homePage"/>'>Go To HomePage</a><br/>
</body>
</html>