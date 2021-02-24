<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	$(function(){
		$(".chat_create_btn").on("click",function(){
			window.open("http://localhost:8080/Community/chat/chat.jsp", "width=500, height=800", "_blank");
		})
	})
</script>
<body>
<button class="chat_create_btn">채팅방 만들기</button>
</body>
</html>