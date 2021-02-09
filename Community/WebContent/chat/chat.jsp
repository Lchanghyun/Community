<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<style>
	.chat-wrapper,
	.chat-screen,
	.chat-text{
		border: 0.5px solid black;
		padding: 0;
		margin: 0;
	}
	.chat-wrapper{
		width: clamp(200px, 500px, 100%);
		height: clamp(200px, 700px, 900px);
	}
	.chat-screen{
		width: calc(100%-10px);
		height: 70%;
		padding: 0 0 0 10px;
		overflow: auto;	
	}
	.chat-text{
		display: inline-block;
		width: 75%;
		height: 28%;
		padding: 10px 10px 0 10px;
	}
	.chat-text-right{
		display: inline;
		width:20%;
		height: 30%;		
	}
	.chat-btn{
		float: right;
		margin-top: 20px;
		margin-right: 20px;
		width: 70px;
		height: 30px;
	}
	.chat-btn::after{
		content: "";
		display: block;
		clear:both;
	}
</style>
<script>
	$(function() {
		$(".chat-btn").on("click", function(){
			var chat_message=$(".chat-text").val();
			$.ajax({
				url: ,
				type: "POST",
				data:{
					chat_message : chat_message
				},
				success: function(result){
					
				},
				error: function(){
					console.log("chat_fail");
				}
			})
		})
	})
</script>
</head>
<body>
	<div class="chat-wrapper">
		<div class="chat-screen">
			
		</div>
		<div class="chat-text" contenteditable="true">
			
		</div>
		<div class="chat-text-right">
			<button class="chat-btn">전송</button>
		</div>
	</div>
</body>
</html>