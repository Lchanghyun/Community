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
  	.li-join::before{
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
<script>
	$(function(){
		$("input[name=member_id]").blur(function(){
			var idRegex = /^[a-z][a-z0-9]{7,19}$/;
			var span = $(".member_id_check");
			if(idRegex.test($(this).val())){
				
				span.text("가능한 아이디 입니다");
			    $(this).addClass("correct");
				span.css("color","green");
			}else if($(this).val().length < 1 ){
				span.text("필수 정보입니다.");
				span.css("color","red");
			}else{
				span.text("영문 소문자와 숫자를 섞어 8~20자 이내로 작성하세요");				
				$(this).removeClass("correct");
				span.css("color","red");
			}
		});
	})
</script>



<br>
<br>

<aside class="section-fl" style="margin-bottom: -9999px; padding-bottom: 9999px; width: 200px; display: inline-block; background-color:navy;">
	<div style="background-color: #007aff; color: white; height: 50px;">
		<h2 style="font-size: 28px; padding: 5px 0 5px 20px; margin: 0;">MEMBER</h2>
	</div>
	<ul style="list-style: none; margin: 0; padding: 0;">
		<li style="height: 50px; border-bottom: 0.5px solid white;"><a class="li-login" href="#" style="margin-left: 10px; text-decoration: none; color: white; height: inherit; width: 190px; display: inline-block;"><span style="position: relative; top: 14px;">로그인</span></a></li>
		<li style="height: 50px; border-bottom: 0.5px solid white; background-color: black;"><a class="li-join" href="<%=request.getContextPath()%>/member/agreement.jsp" style="margin-right: 10px; text-decoration: none; color: white; height: inherit; width: 190px; display: inline-block;"><span>회원가입</span></a></li>
		<li style="height: 50px; border-bottom: 0.5px solid white;"><a class="li-findId" href="#" style="margin-left: 10px; text-decoration: none; color: white; height: inherit; width: 190px; display: inline-block;"><span style="position: relative; top: 14px;">아이디찾기</span></a></li>
		<li style="height: 50px; border-bottom: 0.5px solid white;"><a class="li-findPw" href="#" style="margin-left: 10px; text-decoration: none; color: white; height: inherit; width: 190px; display: inline-block;"><span style="position: relative; top: 14px;">비밀번호찾기</span></a></li>
	</ul>
	
</aside>
<article class="section-fr" style="width: 900px; display: inline-block;">
	<div class="content" style="width: 800px; margin: 0 auto">
		<div class="content-header" style="margin-bottom: 30px;">
			<h3 style="font-size: 30px; margin: 5px 0 0 0;">회원가입</h3>
			<hr>
		</div>
		<form action="#" method="post">
		<div class="content-middle" style="width: 700px; margin: 0 auto;">
			<div>
				<h4 style="font-size: 22px; margin: 0 0 5px 0;">1.로그인 정보</h4>
			</div>
			<table style="font-size: 15px;">
				<tbody>
					<tr>
						<th><label>아이디</label></th>
						<td>
							<div>
								<input type="text" name="member_id"><br>
								<span class="member_id_check"></span>						
							</div>
						</td>
					</tr>
					<tr>
						<th><label>비밀번호</label></th>
						<td>
							<div>
								<input type="text">
								<p style="font-size: 13px;">
								※ 비밀번호의 경우 최소 9자 이상 20자 이내이며 최소 1개 이상의 영문, 숫자, 특수문자가포함되어야 합니다. 
								(사용불가 특수문자는 <, >, (, ), ', /, |, ~ 와 같습니다.)사용불가 특수문자 외의 특수문자를 
								사용하시기 바랍니다.</p>							
							</div>
						</td>
					</tr>
					<tr>
						<th><label>비밀번호 확인</label></th>
						<td>
							<div>
								<input type="text">							
							</div>
						</td>
					</tr>
					<tr>
						<th><label>닉네임</label></th>
						<td>
							<div>
								<input type="text"> <input type="button" value="중복검사">							
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<br><br>
			<div>
				<h4 style="font-size: 22px; margin: 0 0 5px 0;">2.개인 정보</h4>
			</div>
			<table>
				<tbody>
					<tr>
						<th><label>이름</label></th>
						<td>
							<div>
								<input type="text">							
							</div>
						</td>
					</tr>
					<tr>
						<th><label>생년월일</label></th>
						<td>
							<div>
								<input type="text">
								<select>
									<option>월</option>
									<option>1월</option>
									<option>2월</option>
									<option>3월</option>
									<option>4월</option>
									<option>5월</option>
									<option>6월</option>
									<option>7월</option>
									<option>8월</option>
									<option>9월</option>
									<option>10월</option>
									<option>11월</option>
									<option>12월</option>
								</select>
								<input type="text">							
							</div>
						</td>
					</tr>
					<tr>
						<th><label>성별</label></th>
						<td>
							<div>
								<select>
									<option>성별</option>
									<option>남자</option>
									<option>여자</option>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<th><label>휴대 전화번호</label></th>
						<td>
							<div>
								<input type="text">							
							</div>
						</td>
					</tr>
					<tr>
						<th><label>이메일</label></th>
						<td>
							<div>
								<input type="text">							
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div>
			<input type="submit" value="가입 신청">
		</div>		
		</form>
	</div>
</article>

<jsp:include page="/template/footer.jsp"></jsp:include>
