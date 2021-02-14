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
		$(".chat_btn").on("click", function(){
			var chat_message=$(".chat-text").val(); //채팅메세지를 변수화
			var msgTemplate = $("#message_template").html();

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
			
			$(".chat_screen").append($(msgTemplate).find(".chat_msg").text($(".chat_text").text()));
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