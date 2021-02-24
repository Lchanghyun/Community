<%@page import="story.beans.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board-reply.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<%
	
	// 댓글 관련 
	int board_no = Integer.parseInt(request.getParameter("board_no"));
	int member_no = (int)session.getAttribute("check");
	
	MemberDao memberDao = new MemberDao();
	
	ReplyDao replyDao = new ReplyDao();
	List<ReplyDto> replylist = replyDao.select(board_no);
	
	
	boolean isMember = session.getAttribute("check") != null;
	boolean isAdmin = session.getAttribute("auth")!=null && session.getAttribute("auth").equals("admin");
	
%>

<style>
	article{
		width: 1100px;
		margin: 0 auto;
		background-color: white;
	}
	
	.board{
		width:1100px;
		height:600px;
		background-color:gray;
	}
	
	a:link { color: black; text-decoration: none;}
 	a:visited { color: black; text-decoration: none;}
 	a:hover { color: #007aff; text-decoration: underline;}

</style>

<script>
	
	// 댓글 관련
	
	$(function(){
		$(".submit_bt").submit(function(e){
			e.preventDefault();
			if(<%=isMember%>){
				this.submit();
		}
		else{
			$(".reply_ct").val("");
			var choice = confirm("로그인 여부 확인결과.. 비로그인 적발");
			if(choice){
				location.href = "<%=request.getContextPath()%>/member/login.jsp";
				}
			}
		});
		// 수정 화면 숨기기
		$(".reply_edit_wrapper").hide();
		
		// 기존 댓글 숨김, 수정 화면 보이기
		$(".reply_edit").click(function(e){
			e.preventDefault();
			$(this).parents(".reply_list").next().show();
		});
		
		// 수정 취소 시 기존 댓글 보이기
		$(".reply_edit_cancel").click(function(){
			$(this).parents(".reply_edit_wrapper").hide();
			$(this).parents(".reply_edit_wrapper").prev().show();
		});
		
		$("#good_reply").click(function(){
			location.href = "<%=request.getContextPath()%>/board/reply_good";
		});
			
		$("#bad_reply").click(function(){
			location.href = "<%=request.getContextPath()%>/board/reply_bad";
		});
			
		$("#claim_reply").click(function(){
			location.href = "<%=request.getContextPath()%>/board/reply_claim";
		});
	});
	
</script>

<jsp:include page="/template/header.jsp"></jsp:include>


<article>
	<!-- 가상의 게시글 -->
	<div class="board"></div>
	
	<!-- 리모컨 준비중 -->
	<div class="remote_control"> 
	<span class="up">위로</span>
	<span class="down">아래로</span>
	</div>
	
	<!-- 댓글 입력 -->
	<form action="reply_insert.do" method="post">
			<input type="hidden" name="member_no" value=<%=member_no%>>
			<input type="hidden" name="board_no" value=<%=board_no%>>
		<div class="reply_wrap">
			<textarea class="reply" name="reply_content" required rows="5" placeholder="건전한 댓글문화 양성에 기여합니다."></textarea>
			<input class="submit_bt" type="submit" value="등록">
			<input class="submit_other" type="button" value="사진 첨부">
		</div>
	</form>
	
	<div class="reply_list_wrapper">
	
	<%for(ReplyDto replyDto : replylist){ %>
	<table class="reply_list">
		<tbody>
			<tr>
				<td class="reply_wr_wrapper">
					<!-- 아이콘 들어갈 자리 -->
					<div class="reply_wr"><%=memberDao.find(replyDto.getMember_no()).getMember_nick()%></div>
				</td>
				<td class="reply_ct_wrapper">
					<div class="reply_ct"><%=replyDto.getReply_content()%></div>
				</td>
				<td class="reply_num_wrapper">
					<div class="reply_gd"><img id="good_reply" class="reply_img" src="<%=request.getContextPath() %>/img/like.png">&nbsp;&nbsp;<%=replyDto.getReply_good()%></div>
					<div class="reply_bd"><img id="bad_reply"class="reply_img" src="<%=request.getContextPath() %>/img/dislike.png">&nbsp;&nbsp;<%=replyDto.getReply_bad()%></div>
					<div class="reply_cl"><img id="claim_reply"class="reply_img" src="<%=request.getContextPath() %>/img/warning.png">&nbsp;&nbsp;<%=replyDto.getClaim_count()%></div>
				</td>
				<td class="reply_ti_wrapper">
					<div class="reply_ti">
					<%
					SimpleDateFormat f = new SimpleDateFormat("yyyy.MM.dd H:mm");
					String replyregisttime = f.format(replyDto.getReply_time());%>
					<%=replyregisttime%></div>
				</td>
				<td class="reply_menu_wrapper">
					<div class="reply_menu">
					<a href="#" class="re_reply">답글</a>
					
					<%boolean isReplyOwner = (int)session.getAttribute("check") == replyDto.getMember_no();%>

					<%if(isReplyOwner){ %>
					<a href="#" class="reply_edit">수정</a>
					<%} %>
					<%if(isAdmin || isReplyOwner){ %>
					<a href="reply_delete.do?reply_no=<%=replyDto.getReply_no()%>&board_no=<%=board_no%>">삭제</a>
					<%} %>
					</div>
				</td>
			</tr>
		</tbody>
	</table> 
	
	<!-- 수정 댓글 -->
		<div class="reply_edit_wrapper">
			<form action="reply_edit.do" method="post">
					<input type="hidden" name="reply_no" value="<%=replyDto.getReply_no()%>">
					<input type="hidden" name="board_no" value=<%=board_no%>>
				<div class="reply_wrap">
					<textarea class="reply" name="reply_content" required rows="5" placeholder="건전한 댓글문화 양성에 기여합니다."></textarea>
					<input class="submit_bt" type="submit" value="댓글 수정">
					<input class="reply_edit_cancel" type="button" value="취소">
				</div>
			</form>
		</div>	
		<%} %>
	</div>
	<!-- 게시글 목록 -->
</article>


<jsp:include page="/template/footer.jsp"></jsp:include>
