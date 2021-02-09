<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	section{
		width: 1100px;
		margin: 0 auto;
		padding: 0;
		background-color: white;
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
</style>
<jsp:include page="/template/header.jsp"></jsp:include>

<br>
<br>

<aside class="section-fl" style="width: 250px; display: inline-block;">aside</aside>
<article class="section-fr" style="width: 850px; display: inline-block;">article</article>

<jsp:include page="/template/footer.jsp"></jsp:include>
