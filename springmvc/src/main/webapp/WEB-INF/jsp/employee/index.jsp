<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spform" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/purecss@2.0.6/build/pure-min.css">
<title>Employee Form</title>

</head>
<body style="padding: 20px">
	<spform:form modelAttribute="employee" class="pure-form" method="post" action="${pageContext.request.contextPath}/mvc/emoloyee/">
		<fieldset>
			<legend>Employee Form</legend>
			姓名: <spform:input path="name"/><p />
			年齡: <spform:input type="number" path="age"/><p />
			生日: <spform:input type="date" path="birth"/><p />
			學歷: <spform:select path="education">
				 <option value="">請選擇</option>
				 <option value="國中">國中</option>
				 <option value="高中">高中</option>
				 <option value="大學">大學</option>
				 <option value="研究所">研究所</option>
				</spform:select><p/>
			性別: <spform:checkbox path="sex" value="男"/>男性
				<spform:checkbox path="sex" value="女"/>女性<p/>
			興趣:
			履歷:
			
			<input type="submit" value="新增" class="pure-button pure-button-primary" />
			</fieldset>
	</spform:form>
	
</body>
</html>