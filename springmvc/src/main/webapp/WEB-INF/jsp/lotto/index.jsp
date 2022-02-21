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
<title>Lotto Form</title>
<script>
	function updateOrDelete(index, httpmethod) {
	  var xhttp = new XMLHttpRequest();
	  // callback 回調函式
	  xhttp.onreadystatechange = function() {
	  	window.location.href = "${pageContext.request.contextPath}/mvc/lotto/";
	  };
	  xhttp.open(httpmethod, "${pageContext.request.contextPath}/mvc/lotto/" + index, true);
	  xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	  xhttp.send(); // 會有 405 的錯誤, 但程式可以正常執行
	  //return false;
	} 
</script>
</head>
<body style="padding: 20px">
	<form class="pure-form" method="post" action="${pageContext.request.contextPath}/mvc/lotto/add">
		<fieldset>
			<legend>Lotto Form</legend>
			<input type="submit" value="電腦選號" class="pure-button pure-button-primary" />
			</fieldset>
	</form>
	<form class="pure-form" >
		<fieldset>
			<legend>Lotto Statistics</legend>
			${ stat }
		</fieldset>
	</form>
	<p />
	<table class="pure-table pure-table-bordered">
		<thead>
			<tr>
				<th>index</th>
				<th>號碼 1</th><th>號碼 2</th><th>號碼 3</th><th>號碼 4</th><th>號碼 5</th>
				<th>換號</th><th>刪除</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach varStatus="status" var="lotto" items="${ lottos }">
				<tr>
					<td>${ status.index }</td>
					<c:forEach var="num" items="${ lotto }">
						<td>${ num }</td>
					</c:forEach>
					<td><input type="button"
						onclick="updateOrDelete(${ status.index }, 'PUT')" value="換號"
						class="pure-button pure-button-primary" /></td>
					<td><input type="button"
						onclick="updateOrDelete(${ status.index }, 'DELETE')" value="刪除"
						class="pure-button pure-button-primary" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>