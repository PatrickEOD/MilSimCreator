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
<title>Your Tweets</title>
</head>
<body>
<jsp:include page="../fragments/header.jsp" />
<h1>Your conversations:</h1>
<table>
			<tr>
				<th>Text:</th>
				<th>User</th>
				<th>Date:</th>
			</tr>
			<c:forEach items="${userTweets}" var="tweet">
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
					<form:hidden path="user" value="${authorizedUser.id}"/>
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
<a href='<c:url value="/homePage"/>'>Go To HomePage</a><br/>
</body>
</html>