<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		width: clamp(200px, 500px, 100%);
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
		width: 75%;
		height: 28%;
		padding: 10px 10px 0 10px;
	}
	.chat_text_right{
		display: inline;
		width:20%;
		height: 30%;		
	}
	.chat_btn{
		float: right;
		margin-top: 20px;
		margin-right: 20px;
		width: 70px;
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
		//message를 screen에 표시하기 위한 template 
		var msgTemplate = $("#message_template").html();
		//webSocket 생성
		var webSocket = new WebSocket("ws://localhost:8080/Community/chat/websocket");
		//webSocket이 접속되면 자동 요청되는 함수
		webSocket.onopen = function(){
			console.log("socket openning...");
		}
		//webSocket이 닫힐 때 요청되는 함수
		webSocket.onclose = function(){
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

			//채팅 메세지를 데이터베이스에 저장하는 비동기 함수
			$.ajax({
				url: "#",
				type: "POST",
				data:{
					chat_message : chat_message
				},
				success: function(result){
					
				},
				error: function(){
					console.log("chat_fail");
				}
			});
			//webSocket 서버로 메세지 전송
			webSocket.send(chat_message);
			//메세지창 초기화
			$(".chat_text").text("");
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