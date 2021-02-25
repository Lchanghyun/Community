<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	section{
		width: 1100px;
		margin: 0 auto;
		padding: 0;
		background-color: white;
		height: auto;
		overflow: hidden;
	}
	.seciton-fl{
		float: left;
	}
	.section-fr{
		float: right;
	}
	section::after {
      content: "";
      display: block;
      clear: both;
  	}
  	.li-login::before{
	content: '';
	vertical-align: middle;
	display: inline-block;
	width: 5px;
	height: 50px;
	background-color: #007aff;
	margin-right: 5px;
  }
</style>
<jsp:include page="/template/header.jsp"></jsp:include>
<br>
<br>

<aside class="section-fl" style="margin-bottom: -9999px; padding-bottom: 9999px; width: 200px; display: inline-block; background-color:navy;">
	<div style="background-color: #007aff; color: white; height: 50px;">
		<h2 style="font-size: 28px; padding: 5px 0 5px 20px; margin: 0;">MEMBER</h2>
	</div>
	<ul style="list-style: none; margin: 0; padding: 0;">
		<li style="height: 50px; border-bottom: 0.5px solid white; background-color: black;"><a class="li-login" href="<%=request.getContextPath()%>/member/login.jsp" style="margin-right: 10px; text-decoration: none; color: white; height: inherit; width: 190px; display: inline-block;"><span>로그인</span></a></li>
		<li style="height: 50px; border-bottom: 0.5px solid white;"><a class="li-join" href="<%=request.getContextPath()%>/member/agreement.jsp" style="margin-left: 10px; text-decoration: none; color: white; height: inherit; width: 190px; display: inline-block;"><span style="position: relative; top: 14px;">회원가입</span></a></li>
		<li style="height: 50px; border-bottom: 0.5px solid white;"><a class="li-findId" href="<%=request.getContextPath()%>/member/find-id.jsp" style="margin-left: 10px; text-decoration: none; color: white; height: inherit; width: 190px; display: inline-block;"><span style="position: relative; top: 14px;">아이디찾기</span></a></li>
		<li style="height: 50px; border-bottom: 0.5px solid white;"><a class="li-findPw" href="<%=request.getContextPath()%>/member/find-pw.jsp" style="margin-left: 10px; text-decoration: none; color: white; height: inherit; width: 190px; display: inline-block;"><span style="position: relative; top: 14px;">비밀번호찾기</span></a></li>
	</ul>
	
</aside>
<article class="section-fr" style="width: 900px; display: inline-block;">
	<div class="content" style="width: 800px; margin: 0 auto">
		<div class="content-header" style="margin-bottom: 30px;">
			<h3 style="font-size: 30px; margin: 5px 0 0 0;">로그인</h3>
			<hr>
		</div>
		<div class="content-middle" style="width: 700px; margin: 0 auto;">
			<form action="<%=request.getContextPath()%>/member/login.do" method="post">
				<div style="width: 400px;">
					<div class="row center">
					</div>
					<div class="row center">
						<label>아이디</label>
						<input type="text" name="member_id" class="input" required>
					</div>
					<div class="row center">
						<label>비밀번호</label>
						<input type="text" name="member_pw" class="input" required>
					</div>
					<%if(request.getParameter("error")!=null){ %>
					<!-- 오류 메세지: 특정 상황에서만 출력되어야 하는 태그(주소에 error라는 파라미터가 있다면) -->
					<div class="row" style="color: red;">
						입력하신 정보가 맞지 않습니다.
					</div>
					<%} %>
					<div class="row">
						<input type="submit" value="로그인" class="input">
					</div>
					<button onclick="location.href='<%=request.getContextPath()%>'">홈으로 이동</button>
				</div>
			</form>
		</div>
	</div>
</article>

<jsp:include page="/template/footer.jsp"></jsp:include>
			