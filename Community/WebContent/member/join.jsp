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
			var span = $(".member_id_span");
			var correct = $(this);
			var member_id = $(this).val();
			
			if(idRegex.test(member_id)){
				$.ajax({
					async:false,
		        	url:"<%=request.getContextPath()%>/member/id_check.do",
		        	type: "POST",
		        	data: {
		        		member_id : member_id
		        	},
	            	success: function(idCheck){
	            		if(idCheck === true){
	            			span.text("중복된 아이디입니다.")
							span.css("color","red");
	            			console.log(member_id);
	            			console.log(idCheck);
	            		    correct.removeClass("correct");
	            		}else{
							span.text("가능한 아이디 입니다");
							span.css("color","green");	            			
	            			correct.addClass("correct");
	            			console.log(member_id);
	            			console.log(idCheck);
	            		}
	            	},
	            	error: function(){
	            	}
				})			
			}else if(member_id.length < 1 ){
				span.text("필수 정보입니다.");
				span.css("color","red");
				$(this).removeClass("correct");
			}else{
				span.text("영문 소문자와 숫자를 섞어 8~20자 이내로 작성하세요");				
				$(this).removeClass("correct");
				span.css("color","red");
			}
		});
		$("input[name=member_pw]").blur(function(){
            var pwRegex = /^[a-zA-z0-9!@#$%][a-zA-z0-9!@#$%]{7,17}$/;
			var span = $(".member_pw_span");
			var member_pw = $(this).val();
            if(pwRegex.test(member_pw)){
                $(this).addClass("correct");
                span.text("");
            }else if(member_pw.length < 1 ){
				span.text("필수 정보입니다.");
				span.css("color","red");
				$(this).removeClass("correct");
			}else{
				span.text("영문 대/소문자, 숫자 및 지정된 특수문자로 구성된 8~18자 이내로 작성하세요");				
				$(this).removeClass("correct");
				span.css("color","red");
			}
        });
		$("member_pw_check").blur(function{
			var span = $(".member_pw_check_span");
			if()
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
		<li style="height: 50px; border-bottom: 0.5px solid white;"><a class="li-login" href="<%=request.getContextPath()%>/member/login.jsp" style="margin-left: 10px; text-decoration: none; color: white; height: inherit; width: 190px; display: inline-block;"><span style="position: relative; top: 14px;">로그인</span></a></li>
		<li style="height: 50px; border-bottom: 0.5px solid white; background-color: black;"><a class="li-join" href="<%=request.getContextPath()%>/member/agreement.jsp" style="margin-right: 10px; text-decoration: none; color: white; height: inherit; width: 190px; display: inline-block;"><span>회원가입</span></a></li>
		<li style="height: 50px; border-bottom: 0.5px solid white;"><a class="li-findId" href="<%=request.getContextPath()%>/member/find-id.jsp" style="margin-left: 10px; text-decoration: none; color: white; height: inherit; width: 190px; display: inline-block;"><span style="position: relative; top: 14px;">아이디찾기</span></a></li>
		<li style="height: 50px; border-bottom: 0.5px solid white;"><a class="li-findPw" href="<%=request.getContextPath()%>/member/find-pw.jsp" style="margin-left: 10px; text-decoration: none; color: white; height: inherit; width: 190px; display: inline-block;"><span style="position: relative; top: 14px;">비밀번호찾기</span></a></li>
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
								<input type="text" name="member_id">
								<span class="member_id_span"></span>						
							</div>
						</td>
					</tr>
					<tr>
						<th><label>비밀번호</label></th>
						<td>
							<div>
								<input type="text" name="member_pw">
								<span class="member_pw_span"></span>						
								<p style="font-size: 13px;">
								※ 비밀번호의 경우 최소 8자 이상 18자 이내이며 최소 1개 이상의 영문, 숫자, 특수문자가 포함되어야 합니다. 
								(사용가능한  특수문자는 !, @, #, $, % 와 같습니다.)사용가능한 특수문자로 사용하시기 바랍니다.</p>							
							</div>
						</td>
					</tr>
					<tr>
						<th><label>비밀번호 확인</label></th>
						<td>
							<div>
								<input type="text" name="member_pw_check">
								<span class="member_pw_check_span"></span>							
							</div>
						</td>
					</tr>
					<tr>
						<th><label>닉네임</label></th>
						<td>
							<div>
								<input type="text" name="member_nick"> 
								<input type="button" value="중복검사">							
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
								<input type="text" name="member_name">							
							</div>
						</td>
					</tr>
					<tr>
						<th><label>생년월일</label></th>
						<td>
							<div>
								<input type="text" name="member_birth">
								<select>
									<option value="">월</option>
									<option value="1">1월</option>
									<option value="2">2월</option>
									<option value="3">3월</option>
									<option value="4">4월</option>
									<option value="5">5월</option>
									<option value="6">6월</option>
									<option value="7">7월</option>
									<option value="8">8월</option>
									<option value="9">9월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
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
