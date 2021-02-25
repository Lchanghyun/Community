<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>이야기 저장소</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/main-style.css" type="text/css">
    <style>
      .btn-login::before,
      .btn-logout::before{
      	background: url(<%=request.getContextPath() %>/img/ico_login.png) no-repeat 0 0;
  	  }
  	  .btn-join::before,
  	  .btn-my::before{
      	background: url(<%=request.getContextPath() %>/img/ico_join.png) no-repeat 0 0;
      }
      .search-btn{
      	background: url(<%=request.getContextPath() %>/img/ico_search.png) no-repeat 0 0;
      	background-size: 33px;
      	text-indent: -9999px;
      }
    </style>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
 </head>
  <%
 	//사용자가 로그인 상태인지 계산하는 코드
 	//로그인 상태: session에 check라는 이름의 값이 존재할 경우(null이 아닌 경우)
 	//로그아웃 상태: session에 check라는 이름의 값이 존재하지 않을 경우(null인 경우)
 	boolean isLogin = session.getAttribute("check") != null;
 %>
<body>
    <main>
        <header>
             <div class="menu-header" style="height: 155px;">
                <div class="menu-top">
                    <div class="top-inner">
                        <div class="inner-fr">
                            <a href="이용방법·규칙 새창">이용방법·규칙</a>
                            <a href="게시판신청">게시판신청</a>
                            <a href="질문·신고">질문·신고</a>
                        </div>
                    </div>
                </div>
                <div class="menu-middle">
                   <div class="middle-inner">
                       <div class="logo-area">
                            <a href="<%=request.getContextPath()%>"><img src="https://placehold.it/200x60" alt="로고" ></a>                                              
                       </div>
                       <div class="search">
                           <form action="#">
                               <input class="search-input" type="text" placeholder="검색어를 입력하세요">
                               <button class="search-btn">버튼</button>                                   
                           </form>
                       </div>                           
                   </div>
                </div>
                <div class="menu-bottom">
                    <div class="bottom-inner">
                        <div class="bottom_inner-fl">
                            <a href="무언가1">익명</a>
                            <a href="무언가2">게임</a>
                            <a href="무언가3">헬스</a>
                            <a href="무언가3">맛집</a>
                            <a href="무언가3">영화</a>
                            <a href="무언가3">음악</a>
                        </div>
                        <%if(isLogin){%>
                        <div class="bottom_inner-fr">
                            <a href="<%= request.getContextPath() %>/member/logout.do" class="btn-logout">
                            	로그아웃
                            </a>
                            &nbsp;
                            <a href="#" class="btn-my">
                            	내정보
                            </a>
                        </div>
                        <%} else{%>
                        <div class="bottom_inner-fr">
                            <a href="<%=request.getContextPath()%>/member/login.jsp" class="btn-login">
                            	로그인
                            </a>
                            &nbsp;
                            <a href="<%=request.getContextPath()%>/member/agreement.jsp" class="btn-join">
                            	회원가입
                            </a>
                        </div>
                        <%} %>
                    </div>
                </div>
             </div>
        </header>
        <section>