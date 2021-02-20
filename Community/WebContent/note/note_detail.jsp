<%@page import="java.text.SimpleDateFormat"%>
<%@page import="story.beans.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int note_no = Integer.parseInt(request.getParameter("note_no"));
	String type = request.getParameter("type");
	boolean istype = type!=null;
	NoteDao noteDao = new NoteDao();
	//읽음표시
	noteDao.ReceiveReadUpdate(note_no);
	noteDao.SendReadUpdate(note_no);
	//상세표시
	ReceiveNoteVO notevo = new ReceiveNoteVO();
	if(istype&&(type.equals("null")||type.equals("receive")||type.equals("store"))){
		notevo = noteDao.ReceiveNoteDetail(note_no);
	}
	else{
		notevo = noteDao.SendNoteDetail(note_no);
	}
	//시간 표시 형식 정하기
	SimpleDateFormat f = new SimpleDateFormat("yy-MM-dd[HH:mm]");
	
	//내용자르기
	String content = notevo.getNote_content();
	if(content.length()>20){
		content = content.substring(0,20)+"...";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=content%></title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/note.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	$(function(){
		opener.parent.location.reload();
		//답장화면으로
		$(".note-detail-rewrite").click(function(){
			window.open("<%=request.getContextPath()%>/note/note_writeM.jsp?member_nick=<%=notevo.getMember_nick()%>","notewrite","width=550px,height=500px,left=100px,top=100px");
		});
		//보관함으로
		$(".note-detail-store").click(function(){
			$.ajax({
				async:false,
				url:"<%=request.getContextPath()%>/note/notestore.do",
				type:"post",
				data:{
					note_no: <%=note_no%>
				},
				success:function(){
					alert("보관함에서 확인하실 수 있습니다.");
				},
				error:function(){
					console.log("errordetail");
				}
			});
		});
		//삭제하기
		$(".note-detail-delete").click(function(){
			var conf = confirm("삭제하시겠습니까?");
			if(conf){
				$.ajax({
					async:false,
					url:"<%=request.getContextPath()%>/note/notedelete.do",
					type:"post",
					data:{
						note_no:<%=note_no%>,
						notetype:'<%=type%>'
					},
					success:function(){},
					error:function(){
						
					}
				});
				alert("삭제가 완료되었습니다.");
				self.close();
				opener.parent.location.reload();
			}
		});
		//닫기
		$(".note-detail-close").click(function(){
			self.close();
		});
	});
</script>
</head>
<body>
	<div class="note-title-box">
		<div>
		<%if(istype&&(type.equals("null")||type.equals("receive")||type.equals("store"))){ %>
			<span class="note-title">보낸사람</span>
		<%} else{%>
			<span class="note-title">받는사람</span>
		<%}%>
			<span class="note-title-content"><%=notevo.getMember_nick()%></span>
		</div>
		<div>
		<%if(istype&&(type.equals("null")||type.equals("receive")||type.equals("store"))){ %>
			<span class="note-title">받은시간</span>
		<%} else{%>
			<span class="note-title">보낸시간</span>
		<%}%>
			<span class="note-title-content"><%=f.format(notevo.getSend_date())%></span>
		</div>
	</div>
	<div class="note-title-box">
		<div class="note-contentcontent"><%=notevo.getNote_content()%></div>
	</div>
	<div class="note-detail-btn">
		<%if(istype&&!type.equals("send")&&!type.equals("temp")){%>
		<input type="button" value="답장" class="note-detail-rewrite">
		<%} if(istype&&(type.equals("null")||type.equals("receive"))){%>
		<input type="button" value="보관" class="note-detail-store">
		<%}%>
		<input type="button" value="삭제" class="note-detail-delete">
		<input type="button" value="닫기" class="note-detail-close">
	</div>
</body>
</html>