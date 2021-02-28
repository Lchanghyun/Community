<%@page import="story.beans.*"%>
<%@page import="java.util.*"%>
<%@page import="story.servlet.WebSocket"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int member_no=(int)session.getAttribute("check"); 
	String key= (String)session.getAttribute("key");
	boolean isMember = session.getAttribute("check")!=null;
	boolean isSearch = key!=null;
	int n;
	try{
		n= Integer.parseInt(request.getParameter("n"));
		if(n<=0) throw new Exception();
	}
	catch(Exception e){
		n=1;
	}
	int listSize=15;
	int endRow = n*listSize;
	int startRow = endRow - listSize +1;
	
	int blockSize= 10;
	
	int startBlock = (n-1) / blockSize*blockSize+1;
	int endBlock = startBlock + blockSize -1;
	
	ChatDao chatDao = new ChatDao();
	ChatJoinDao chatJoinDao = new ChatJoinDao();
	int count;
	if(isSearch){
		count = chatDao.count(key);
	}
	else{
		count = chatDao.count();
	}
	
	int pageSize = (count + listSize -1) / listSize;
	
	if(endBlock > pageSize){
		endBlock = pageSize;
	}
	List<ChatVO> chatList = chatDao.list(startRow, endRow);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<style>
.pagination {
    margin:0;
    padding:0;
    list-style: none;
}
.pagination > li {
    display:inline-block;
    padding:0.5rem;
    min-width:2.5rem;
    text-align: center;
    /*border:1px solid transparent;*/
}
.pagination > li.active,
.pagination > li:hover {
    /*border:1px solid gray;*/
    cursor: pointer;
    box-shadow: 0px 0px 2px 2px gray;
}
.pagination > li > a {
    text-decoration: none;
    color:black;
}
.pagination > li:hover > a {
    color:orangered;
}
</style>
<script>
	$(function(){
		$(".chat_create_btn").on("click",function(){
			$.ajax({
				async: false,
        		url: "<%=request.getContextPath()%>/chat/create.do",
        		type: "get",
        		data: {
        			member_no : <%=member_no%>
        		},
        		success: function(resp){
        			window.open("http://localhost:8080/Community/chat/chat.jsp", "width=500, height=800", "_blank");
        		},
        		error: function(){
        			console.log('false');
        		}
        	});
		})
	})
</script>
<body>	
	<div class="chat_list_wrapper">
		<button class="chat_create_btn">채팅방 만들기</button>
		<div>
			<table>
				<thead>
					<tr>
						<th>채팅방 번호</th>
						<th>채팅방 이름</th>
						<th>참여회원</th>
					</tr>
				</thead>
				<tbody>
					<%for(ChatVO chatvo : chatList) {%>
					<tr>
						<td><%=chatvo.getChat_no()%></td>
						<td><a href="<%request.getContextPath()%>/chat/chat.jsp?chat_no=<%=chatvo.getChat_no()%>"><%=chatvo.getChat_name()%></td>
						<td><%=chatJoinDao.joinCount(chatvo.getChat_no())%></td>
						<%}%>
					</tr>
				</tbody>
			</table>
		</div>
		<div>
			<ul class="pagination">
				<%if(isSearch){%>
					<li><a href="chatList.jsp?n=<%=startBlock-1%>&key=<%=key%>">&lt;</a></li>
				<%}else {%>
					<li><a href="chatList.jsp?n=<%=startBlock-1%>">&lt;</a></li>
				<%} %>
				<%for(int i=startBlock; i<=endBlock; i++){%>
					<%if(i==n){ %>
					<li class="active">
					<%}else{ %>
					<li>
					<%} %>
					<%if(isSearch) {%>
						<a href="chatList.jsp?n=<%=i%>&key=<%=key%>"><%=i%></a>
					<%}else {%>
						<a href="chatList.jsp?n=<%=i%>"><%=i%></a>
					<%} %>
					</li>
				<%} %>
				<%if(isSearch){%>
					<li><a href="chatList.jsp?n=<%=endBlock+1%>&key=<%=key%>">&gt;</a></li>
				<%}else{%>
					<li><a href="chatList.jsp?n=<%=endBlock+1%>">&gt;</a></li>
				<%}%>
			</ul>
		</div>
	</div>
	
</body>
</html>