<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	section{
		width: 1100px;
		margin: 0 auto;
		padding: 0;
		background-color: white;
		height: auto;
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
<script type="text/javascript">

const { config, Group } = require('coolsms-node-sdk')

//인증을 위해 발급받은 본인의 API Key를 사용합니다.
const apiKey = 'NCSPR6PKHFNSAKYW'
const apiSecret = 'GPYZ3Z2K1E0UWAFWKMS2ERP1BMVSGLKJ'
config.init({ apiKey, apiSecret })
async function send (params = {}) {
try {
 const response = await Group.sendSimpleMessage(params)
 console.log(response)
} catch (e) {
 console.log(e)
}
}

const params = {
text: '[쿨에스엠에스 테스트] hello world!', // 문자 내용
type: 'SMS', // 발송할 메시지 타입 (SMS, LMS, MMS, ATA, CTA)
to: '01027904686', // 수신번호 (받는이)
from: '01027904686' // 발신번호 (보내는이)
}
send(params)

</script>
<jsp:include page="/template/header.jsp"></jsp:include>

<br>
<br>

<aside class="section-fl" style="width: 200px; display: inline-block;">
	<div style="background-color: #007aff; color: white; height: 50px;">
		<h2 style="font-size: 28px; padding: 5px 0 5px 20px; margin: 0;">MEMBER</h2>
	</div>
	<ul>
		<li><a href="#">로그인</a></li>
		<li><a href="#">회원가입</a></li>
		<li><a href="#">아이디찾기</a></li>
		<li><a href="#">비밀번호찾기</a></li>
		
	</ul>
	
</aside>
<article class="section-fr" style="width: 900px; display: inline-block;">
	<div class="content" style="width: 800px; margin: 0 auto">
		<div class="content-header" style="margin-bottom: 30px;">
			<h3 style="font-size: 30px; margin: 5px 0 0 0;">회원가입</h3>
			<hr>
		</div>
		<div class="content-text" style="padding: 15px; margin: 10px 0 30px 0; text-align: center; border: 1px solid lightgray; background-color: #f5f6fa;">
			<span style="font-size: 14px; margin-bottom: 2px; display: inline-block;">홈페이지 서비스를 이용함에 있어 <b style="color: #007aff;">온라인상에서 제공한 개인정보를 철저히 보호</b>를 받으며,</span><br>
			<span style="font-size: 14px;">모든 회원정보는 <b style="color: #007aff;">개인정보처리방침에 의해 보호받고 있음</b>을 알려드립니다.</span>	
		</div>
		<div class="content-middle1" style="margin-bottom: 30px;">
			<h4 style="font-size: 23px; margin:5px 0;">서비스 이용 약관</h4>
			<textarea style="width: 800px; height: 200px; resize: none; font-size: 12px;" readonly>
			</textarea>
		</div>
		<div class="content-middle2">
			<h4 style="font-size: 23px; margin:5px 0;">개인정보 수집 및 이용에 대한 안내</h4>
			<textarea style="width: 800px; height: 100px; resize: none; font-size: 12px;" readonly>
			</textarea>
			<br>
			<br>
			<textarea style="width: 800px; height: 100px; resize: none; font-size: 12px;" readonly>
			</textarea>
		</div>
		<br>
		<form action="<%=request.getContextPath()%>/member/join.jsp" method="post">
			<div class="content-footer" style="font-size: 14px; margin: 10px 0 30px 0; text-align: center;">
				<div style="padding: 15px;">
					<input type="checkbox" id="agree-use" name="agreement_use" value="1"><label for="agree-use" style="display: inline-block; margin-right: 5px;"><b>이용약관에 동의 합니다.</b></label>
					<input type="checkbox" id="agree-privacy" name="agreement_privacy" value="1"><label for="agree-privacy"><b>개인정보 수집 및 이용에 동의합니다.</b></label>
					<span style="display: block; margin-top: 7px;">▷ 이야기저장소는 <span style="color: red;">만 14세 이상만 가입 가능</span>합니다. 양해 부탁 드립니다.</span>
				</div>
				<hr style="margin-bottom: 20px;">
				<div>
					<div style="display: inline-block; margin:0 15px;">
						<input type="submit" value="회원가입" style="width: 200px; height: 55px; color: white; background-color: #007aff; border: none; border-radius: 3px; font-size: 17px;">
					</div>
					<div style="display: inline-block; margin:0 15px;">
						<a href="../index.jsp">
							<input type="button" value="취소하기" style="width: 200px; height: 55px; color: white; background-color: gray; border: none; border-radius: 3px; font-size: 17px;">
						</a>
					</div>
				</div>
			</div>
		</form>
	</div>
</article>

<jsp:include page="/template/footer.jsp"></jsp:include>
