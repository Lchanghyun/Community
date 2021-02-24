<%@page import="story.beans.*"%>
<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// int member_no=(int)session.getAttribute("check"); 
// MemberDao memberDao = new MemberDao();
// MemberDto memberDto = memberDao.find(member_no);
// String nick=memberDto.getMember_nick();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<style>
	.chat_wrapper,
	.chat_screen,
	.chat_text{
		border: 0.5px solid black;
		padding: 0;
		margin: 0;
	}
	.chat_wrapper{
		width: clamp(400px, 500px, 100%);
		height: clamp(200px, 700px, 900px);
	}
	.chat_screen{
		width: calc(100%-10px);
		height: 70%;
		padding: 0 0 0 10px;
		overflow: auto;	
	}
	.chat_text{
		display: inline-block;
		width: clamp(200px, 500px, 75%);
		height: 28%;
		padding: 10px 10px 0 10px;
	}
	.chat_text_right{
		display: inline;
		width:200px;
		height: 30%;		
	}
	.chat_btn{
		top: 30px;
		right: 5px;
		width: 80px;
		height: 30px;
	}
	.chat_btn::after{
		content: "";
		display: block;
		clear:both;
	}
</style>
<script>
	$(function() {
		window.resizeTo(550,790);

		var nick = "나다";
		//message를 screen에 표시하기 위한 template 
		var msgTemplate = $("#message_template").html();
		//webSocket 생성
		var webSocket = new WebSocket("ws://localhost:8080/Community/chat/websocket");
		//webSocket이 접속되면 자동 요청되는 함수
		webSocket.onopen = function(){
			console.log("socket openning...");
			webSocket.send(nick+'가 접속하였습니다.');			//webSocket 서버로 메세지 전송
		}
		//webSocket이 닫힐 때 요청되는 함수
		webSocket.onclose = function(){
			webSocket.send(nick+'가 퇴장하였습니다.');
			console.log("socket closed");
		}
		//webSocket 서버에서 메세지를 받으면 요청되는 함수
		webSocket.onmessage = function(message){
			console.log(message.data);
			$(".chat_screen").append($(msgTemplate).find(".chat_msg").text(message.data));
		}
		//webSocket 에러발생시 요청되는 함수
		webSocket.onerror= function(){
			alert("error!");
		}
		//전송 버튼을 클릭하면 콜백되는 함수
		$(".chat_btn").on("click", function(){
			var chat_message=$(".chat_text").text(); //채팅메세지를 변수화	
			webSocket.send(nick+" : "+chat_message);			//webSocket 서버로 메세지 전송
			$(".chat_text").text("");			//메세지창 초기화

		})
	})
</script>
<!-- 채팅 메세지를 담는 message_template -->
<script id="message_template" type="text/template">
	<div>
		<div class="chat_msg">
		</div>
	</div>
</script>
</head>
<body>
	<div class="chat_wrapper">
		<div class="chat_screen">
		
		</div>
		<div class="chat_text" contenteditable="true">
			
		</div>
		<div class="chat_text_right">
			<button class="chat_btn">전송</button>
		</div>
	</div>
</body>
</html>