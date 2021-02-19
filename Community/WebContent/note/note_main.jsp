<%@page import="java.text.SimpleDateFormat"%>
<%@page import="story.beans.*"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//int member_no = (int)session.getAttribute("check");
	int member_no = 1;
	String note = request.getParameter("note"); //쪽지의 종류
	String type1 = request.getParameter("type1"); //검색분류1
	String type2 = request.getParameter("type2"); //검색분류2
	String key = request.getParameter("key"); //검색어
	String read = request.getParameter("read"); //안읽은상태를 구분
	boolean notetype = note != null;
	boolean readcheck = read!=null;
	boolean isSearch = type1!=null && type2!=null && key!=null;
	if(isSearch){
		note = type1;
	}
	NoteDao noteDao = new NoteDao();
	List<ReceiveNoteVO> Rnotelist = null;
	List<SendNoteVO> Snotelist = null;
	List<NoteBlockVO> blocklist = null;
	
	//검색일때와 아닐때로 세분화, 어떤 쪽지함인지 세분화
	if(isSearch){
		Rnotelist = noteDao.SearchNoteList(type1, type2, key, member_no);
	}
	else{
		if(notetype){
			if(note.equals("send")){
				Snotelist = noteDao.SendNoteList(member_no);
			}
			else if(note.equals("store")){
				if(readcheck&&read.equals("notread")){
					//Rnotelist = noteDao.StoreNoteNotreadList(member_no);
				}
				else{
					Rnotelist = noteDao.StoreNoteList(member_no);
				}
			}
			else if(note.equals("temp")){
				Snotelist = noteDao.TempNoteList(member_no);	
			}
			else{
				blocklist = noteDao.BlockList(member_no);
			}
		}
		else{//안읽은쪽지를 따로 구분
			if(readcheck&&read.equals("notread")){
				//Rnotelist = noteDao.ReceiveNoteNotreadList(member_no);
			}
			else{
				Rnotelist = noteDao.ReceiveNoteList(member_no);
			}
		}
	}
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/note.css">
</head>
<body>
	<div class="note-box">
		<div class="divmargin">
			<ul class="note-menu">
				<li><a class="note-write">쪽지쓰기</a></li>
				<li><a href="note_main.jsp">받은 쪽지함</a></li>
				<li><a href="note_main.jsp?note=send">보낸 쪽지함</a></li>
				<li><a href="note_main.jsp?note=store">쪽지보관함</a></li>
				<li><a href="note_main.jsp?note=temp">임시저장함</a></li>
				<li><a href="note_main.jsp?note=block">차단명단</a></li>
			</ul>
		</div>
		
		<!-- 검색창 구현-->
		<form action="note_main.jsp" method="post">
		<div class="note-search divmargin">
			<select name="type1" class="divspace">
				<option value="receive" <%if(isSearch&&type1.equals("receive")){%>selected<%}%>>받은쪽지</option>
				<option value="send" <%if(isSearch&&type1.equals("send")){%>selected<%}%>>보낸쪽지</option>
				<option value="store" <%if(isSearch&&type1.equals("store")){%>selected<%}%>>보관쪽지</option>
				<option value="temp" <%if(isSearch&&type1.equals("temp")){%>selected<%}%>>임시보관</option>
			</select>
			<select name="type2" class="divspace">
				<option value="member_nick" <%if(isSearch&&type2.equals("member_nick")){%>selected<%}%>>닉네임</option>
				<option value="note_content" <%if(isSearch&&type2.equals("note_content")){%>selected<%}%>>내용</option>
			</select>
			<input type="text" name="key" required <%if(isSearch){%>value="<%=key%>"<%}%>>
			<input type="submit" value="검색">
		</div>
		</form>
		
		<!-- 삭제,보관,차단 버튼 구현 -->
		<div class="note-btn divmargin">
			<%if(!notetype || !note.equals("block")){%>
				<input type="button" value="삭제" class="list-note-deleteBtn">
			<%} if((!notetype&&!isSearch) || note.equals("receive")){%>
				<input type="button" value="보관" class="list-note-storeBtn">
			<%} if(!notetype&&!isSearch){%>
				<a>안읽은 쪽지</a>
				<a href="note_main.jsp?read=notread">?</a> / <a href="note_main.jsp">?</a>
			<%} if(notetype&&note.equals("store")&&!isSearch){%>
				<a>안읽은 쪽지</a>
				<a href="note_main.jsp?note=store&read=notread">?</a> / <a href="note_main.jsp?note=store">?</a>
			<%} if(isSearch){%>
				<span>검색결과 ?건</span>
			<%}%>
		</div>
		
		<div class="note-list-receive divmargin">
			<table class="receicelist">
				<thead>
					<%if(!notetype || note.equals("store") || (isSearch&&(type1.equals("receive") || type1.equals("store")))){%>
					<tr>
						<th width="5%"><input type="checkbox" id="total-check"></th>
						<th width="15%">보낸사람</th>
						<th width="45%">내용</th>
						<th width="15%">날짜</th>
						<th width="10%">수신확인</th>
						<th width="5%">답장</th>
						<th width="5%">차단</th>
					</tr>
					<%} else if(note.equals("send")||(isSearch&&type1.equals("send"))){%>
					<tr><th colspan="6">발송취소의 경우 수신자가 열람하지않은 경우에만 가능합니다.</th></tr>
					<tr>
						<th width="5%"><input type="checkbox" id="total-check"></th>
						<th width="15%">받는사람</th>
						<th width="45%">내용</th>
						<th width="15%">날짜</th>
						<th width="10%">수신확인</th>
						<th width="10%">발송취소</th>
					</tr>
					<%} else if(note.equals("temp")||(isSearch&&type1.equals("temp"))){%>
					<tr>
						<th width="5%"><input type="checkbox" id="total-check"></th>
						<th width="15%">받는사람</th>
						<th width="45%">내용</th>
						<th width="20%">날짜</th>
						<th width="15%">수정</th>
					</tr>
					<%} else{%>
					<tr>
						<th>차단된 회원</th>
						<th>차단시간</th>
						<th>차단해지</th>
					</tr>
					<%}%>
				</thead>
				<tbody>
				<%if(!notetype || note.equals("store") || (isSearch&&(type1.equals("receive") || type1.equals("store")))){%>
				<%for(ReceiveNoteVO notevo : Rnotelist){%>
					<tr>
						<td><input type="checkbox" class="note-check" name="note-check" value=<%=notevo.getNote_no()%>></td>
						<td><a class="member-block-page"><%=notevo.getMember_nick()%></a></td>
						<td>
							<!-- 내용 형식을 변경 -->
							<a class="note-detail-page">
							<%=notevo.getNote_content()%>
							</a>
						</td>
						<td><%=notevo.getSend_date()%></td>
						<%if(notevo.getRead_check().equals("1")){%>
						<td>읽음</td>
						<%} else{%>
						<td>읽지않음</td>
						<%}%>
						<td><input type="button" value="답장" class="list-note-rewriteBtn"></td>
						<td><input type="button" value="차단" class="list-note-blockBtn"></td>
					</tr>
				<%}%>
				<%} else if(note.equals("send")||(isSearch&&type1.equals("send"))){%>
					<%for(SendNoteVO notevo : Snotelist){%>
					<tr>
						<td><input type="checkbox" class="note-check" name="note-check" value=<%=notevo.getNote_no()%>></td>
						<td><a class="member-block-page"><%=notevo.getMember_nick()%></a></td>
						<td>
							<!-- 내용 형식을 변경 -->
							<a class="note-detail-page">
							<%=notevo.getNote_content()%>
							</a>
						</td>
						<td><%=notevo.getSend_date()%></td>
						<%if(notevo.getRead_check().equals("1")){%>
						<td>읽음</td>
						<td></td>
						<%} else{%>
						<td>읽지않음</td>
						<td>
							<input class="send-delete-btn" type="button" value="발송취소">
							<input type="hidden" value=<%=notevo.getConnect_no()%>>
						</td>
						<%}%>
					</tr>
					<%}%>
				<%} else if(note.equals("temp")||(isSearch&&type1.equals("temp"))){%>
					<%for(SendNoteVO notevo : Snotelist){%>
					<tr>
						<td><input type="checkbox" class="note-check" name="note-check" value=<%=notevo.getNote_no()%>></td>
						<td><a class="member-block-page"><%=notevo.getMember_nick()%></a></td>
						<td>
							<a class="note-detail-page">
								<%=notevo.getNote_content()%>
							</a>
						</td>
						<td><%=notevo.getSend_date()%></td>
						<td><input class="temp-edit-btn" type="button" value="수정"></td>
					</tr>
					<%}%>
				<%} else{%>
					<%for(NoteBlockVO blockvo : blocklist){ %>
						<tr>
							<td><%=blockvo.getMember_nick()%></td>
							<td><%=blockvo.getBlock_time()%></td>
							<td>
								<input type="button" value="차단해지" class="block-list-delete">
								<input type="hidden" value=<%=blockvo.getBlock_no()%>>
							</td>
						</tr>
					<%}%>
				<%}%>
				</tbody>
			</table>
		</div>
	</div>
<jsp:include page="/template/footer.jsp"></jsp:include>