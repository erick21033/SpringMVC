<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/purecss@2.0.6/build/pure-min.css">
<title>User Form</title>
</head>
<body style="padding: 20px">
	<form class="pure-form" method="post" action="${pageContext.request.contextPath}/mvc/user/${ action }">
		<fieldset>
			<legend>User Form</legend>
			User name: <input type="text" id="name" name="name" value="${ user.name }" ${ readonly } placeholder="Please input name" />
			<p />
			User age: <input type="number" id="age" name="age" value="${ user.age }" placeholder="Please input age" />
			<p />
			<input type="submit" value="${ action }" class="pure-button pure-button-primary" />
			<input type="reset" value="reset" class="pure-button pure-button-primary" />
			<input type="button" value="read" onclick="window.location.href='${pageContext.request.contextPath}/mvc/user/read';" class="pure-button pure-button-primary" />
		</fieldset>
	</form>
</body>
</html>