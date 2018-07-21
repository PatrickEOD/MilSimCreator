<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<body>
<ul class="list-unstyled hidden-xs" id="sidebar-footer">
	<sec:authorize access="isAuthenticated()">
		<li><p><i class="glyphicon glyphicon-user"></i> Logged in as: <sec:authentication property="principal.username"/></p></li>
	</sec:authorize>
	<li><p><a href="/MilSimCreator/logout"><i class="glyphicon glyphicon-off"></i> Logout</a></p></li>
</ul>
</body>
</html>