<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%int chat_no = Integer.parseInt(request.getParameter("chat_no")); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.pwCheck{
		width: 200px;
		height: 50px;
		font-size: 20px;
	}
	.pwCheck_wrapper{
		text-align:center;
	}
</style>
</head>
<body>
<div class="pwCheck_wrapper">
<form action="./pwCheck.do" method="post">
	<input type="text" class="pwCheck" name="chat_pw">
	<input type="hidden" name="check_no" value=<%=chat_no%>>
</form>
</div>
</body>
</html>