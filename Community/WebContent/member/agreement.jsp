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
	background-color: #ae875d;
	margin-right: 5px;
  }
</style>
<jsp:include page="/template/header.jsp"></jsp:include>
<script>
	$(function(){
		$(".form").submit(function(e){
			e.preventDefault();
			if($("#agree-use").is(":checked") == true && $("#agree-privacy").is(":checked") == true){
				this.submit(); 
			}else{
				alert("필수 약관에 동의 해주세요");
                return;
			}
		});
	});
</script>

<br>
<br>

<aside class="section-fl" style="margin-bottom: -9999px; padding-bottom: 9999px; width: 200px; display: inline-block; background-color:#ae875d;">
	<div style="background-color: #CEA67A; color: white; height: 50px;">
		<h2 style="font-size: 28px; padding: 5px 0 5px 20px; margin: 0;">MEMBER</h2>
	</div>
	<ul style="list-style: none; margin: 0; padding: 0;">
		<li style="height: 50px; border-bottom: 0.5px solid white;"><a class="li-login" href="<%=request.getContextPath()%>/member/login.jsp" style="margin-left: 10px; text-decoration: none; color: white; height: inherit; width: 190px; display: inline-block;"><span style="position: relative; top: 14px;">로그인</span></a></li>
		<li style="height: 50px; border-bottom: 0.5px solid white; background-color: #CEA67A;"><a class="li-join" href="<%=request.getContextPath()%>/member/agreement.jsp" style="margin-right: 10px; text-decoration: none; color: white; height: inherit; width: 190px; display: inline-block;"><span>회원가입</span></a></li>
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
		<div class="content-text" style="padding: 15px; margin: 10px 0 30px 0; text-align: center; border: 1px solid lightgray; background-color: #f5f6fa;">
			<span style="font-size: 14px; margin-bottom: 2px; display: inline-block;">홈페이지 서비스를 이용함에 있어 <b style="color: #007aff;">온라인상에서 제공한 개인정보를 철저히 보호</b>를 받으며,</span><br>
			<span style="font-size: 14px;">모든 회원정보는 <b style="color: #007aff;">개인정보처리방침에 의해 보호받고 있음</b>을 알려드립니다.</span>	
		</div>
		<div class="content-middle1" style="margin-bottom: 30px;">
			<h4 style="font-size: 23px; margin:5px 0;">서비스 이용 약관</h4>
			<textarea style="width: 800px; height: 200px; resize: none; font-size: 12px;" readonly>
제 1 조 (목적)
이 약관은 ㈜이야기스토리(이하 '회사')가 제공하는 서비스의 이용과 관련하여 '회사'와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.

제 2 조 (약관의 공지 및 준용)
1. 이 약관의 내용은 서비스 화면에 게시하거나 기타의 방법으로 회원에게 공지함으로써 효력을 발생합니다.
2. '회사'는 이 약관을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지함으로써 효력을 발생합니다.

제 3 조 (용어의 정의)
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
1. 회원 : '회사'와 서비스 이용계약을 체결한 자
2. 아이디(ID) : 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 '회사'가 승인하는 문자와 숫자의 조합
3. 비밀번호 : 회원의 비밀 보호를 위해 회원 자신이 설정한 문자와 숫자의 조합
4. 운영진 : '회사'가 승인한 서비스 운영 및 관리 권한이 있는 자
5. 해지 : '회사' 또는 회원이 서비스 개통 후 이용계약을 해약하는 것

제 4 조 (이용계약의 성립)
1. 회원가입란을 작성후 가입버튼을 누름과 동시에 이 약관에 동의하는 것으로 간주됩니다.
2. 이용계약은 회원의 이용신청에 대하여 '회사'가 승낙함으로써 성립합니다.

제 5 조 (이용신청)
1. 이용신청은 온라인으로 다음 사항을 가입신청 양식에 기록하여 신청합니다.
  ㄱ. 이름
  ㄴ. 아이디(ID)
  ㄷ. 비밀번호
  ㄹ. e-mail
  ㅁ. 기타 '회사'에서 필요한 정보

제 6 조 (이용신청의 승낙)
1. '회사'는 회원이 제 5 조에서 정한 모든 사항을 정확히 기재하여 이용신청을 하였을 때 승낙합니다.
2. '회사'는 다음 각 호의 1에 해당하는 이용신청에 대하여는 승낙을 유보할 수 있습니다.
  ㄱ. 설비에 여유가 없는 경우
  ㄴ. 기술상 지장이 있는 경우
  ㄷ. 기타 '회사'에서 필요하다고 인정되는 경우
3. '회사'는 다음 각 호의 1에 해당하는 이용신청에 대하여는 이를 승낙불가할 수 있습니다.
  ㄱ. 이름이 실명이 아닌 경우
  ㄴ. 다른 사람의 명의를 사용하여 신청한 경우
  ㄷ. 이용신청시 필요내용을 허위로 기재하여 신청한 경우
4. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우
5. 기타 '회사'가 정한 이용신청요건이 미비되었을 때

제 7 조 (계약사항의 변경)
회원은 이용신청시 기재한 사항이 변경되었을 경우에는 회원자신이 온라인수정을 해야 합니다.

제 8 조 (개인신용 정보의 제공 및 활용에 관한 동의 의무)
회원가입과 관련하여 본인으로 부터 취득한 신용정보는 신용정보의 이용및 보호에 관한 법률 23조의 규정에 따라 타인에게 제공 및 활용시 본인의 동의를 얻어야 하는 정보입니다. 이에 본인은 아래의 신용정보를 신용정보기관, 신용정보업자, 이용자 등에게 제공하여 본인의 신용을 판단하기 위한 자료로서 활용하거나 공공기관에서 정책자료로서 활용하는 데에 신용정보를 제공합니다.
제공할 신용정보의 내용 : 가입에 관한 개인 신용정보
본인은 개인 신용정보의 제공 및 활용동의서를 승인하고 회원가입을 신청합니다.

제 9 조 (회원 아이디(ID)와 비밀번호 관리에 대한 의무)
1. 아이디(ID)와 비밀번호에 관한 모든 관리책임은 회원에게 있습니다. 회원에게 부여된 아이디(ID)와 비밀번호의 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 책임은 회원에게 있습니다.
2. 자신의 아이디(ID)가 부정하게 사용된 경우 회원은 반드시 '회사'에 그 사실을 통보해야 합니다.

제 10 조 (서비스 전반에 관한 회원의 의무)
1. 회원은 서비스를 이용할 때 다음 각 호의 행위를 하지 않아야 합니다.
  ㄱ. 다른 회원의 ID를 부정하게 사용하는 행위
  ㄴ. 서비스에서 얻은 정보를 '회사'의 사전승낙 없이 회원의 이용이외의 목적으로 복제하 거나 이를 출판 및 방송 등에 사용하거나 제 3자에게 제공하는 행위
  ㄷ. 제3자의 저작권 등 기타 권리를 침해하는 행위
  ㄹ. 공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형 등을 타인에게 유포하는 행위
  ㅁ. 범죄와 결부된다고 객관적으로 판단되는 행위
  ㅂ. 기타 관계법령에 위배되는 행위
  ㅅ. 서비스 변경, 삭제(해킹) 등을 시도 하는 행위
2. 회원은 이 약관에서 규정하는 사항과 서비스 이용안내 또는 주의사항을 준수하여야 합니다.
3. 회원은 내용별로 '회사'가 서비스 공지사항에 게시하거나 별도로 공지한 이용제한 사항을 준수하여야 합니다.
4. 회원은 '회사'의 사전승낙없이는 서비스를 이용하여 영업활동을 할 수 없으며, 영업활동의 결과와 회원이 약관에 위반한 영업활동을 이용하여 발생한 결과에 대하여 '회사'는 책임을 지지 않습니다.

제 11조 (정보의 제공)
'회사'는 회원의 전자우편으로 매일 유머를 제공할 수 있습니다.
'회사'는 회원의 전자우편으로 광고를 제공할 수 있습니다. 이때, 광고를 원하지 않는 회원은 거부의사를 표명할수 있습니다.

제 12 조 (회원의 게시물)
운영진은 회원이 게시하거나 등록하는 서비스내의 내용물이 다음 각 호의 1에 해당한다고 판단되는 경우에 사전통지 없이 삭제할 수 있습니다.
1. 다른 회원 또는 제3자를 비방하거나 중상모략으로 명예를 손상시키는 내용인 경우
2. 공공질서 및 미풍양속에 위반되는 내용인 경우
3. 범죄적 행위에 결부된다고 인정되는 내용일 경우
4. 제 3 자의 저작권 등 기타 권리를 침해하는 내용인 경우
5. '회사'가 규정한 게시기간을 초과한 경우
6. 게시판의 성격에 맞지 않는 경우
7. 지나친 중복게시물인 경우
8. 혐오감을 유발하는 경우
9. 특정회원을 비방하는 경우
10. 지나친 선정성글 혹은 음란성 게시물인 경우
11. 광고,홍보성 글인 경우
12. 너무 많은 욕설이 섞인 게시물
13. 특정연예인 안티성 게시물
14. 기타 서비스의 운영목적에 위배되는 경우
15. 기타 관계법령에 위반된다고 판단되는 경우

제 13 조 (게시물의 저작권)
서비스에 게재된 자료에 대한 권리는 다음 각 호와 같습니다.
1. 게시물에 대한 책임은 게시자에게 있으며 등록되는 모든 글과 자료는 '회사'가 서비스 운영을 위한 수익사업에 사용할 수 있고 서비스 내의 게재권을 갖습니다.
2. 회원은 서비스를 이용하여 얻은 정보를 가공, 판매하는 행위 등 서비스에 게재된 자료를 '회사'의 허락 없이 상업적으로 사용할 수 없습니다.

제 14 조 (서비스 이용시간)
1. 서비스 이용시간은 '회사'의 업무상 또는 기술상 불가능한 경우를 제외하고는 연중무휴, 1일 24시간으로 함을 원칙으로 합니다. 다만, 서비스 점검 등의 사유로 '회사'가 서비스를 특정범위로 분할하여 별도로 날짜와 시간을 정할 수 있습니다.

제 15 조 (서비스 제공의 중지)
1. '회사'는 다음 각 호에 해당하는 경우 서비스 제공을 중지할 수 있습니다.
  ㄱ. 서비스용 설비의 보수 등 공사로 인한 부득이한 경우
  ㄴ. 전기통신사업법에 규정된 기간통신사업자가 전기통신서비스를 중지했을 경우
2. '회사'는 국가비상사태, 정전, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 때에는 서비스의 전부 또는 일부를 제한하거나 정지할 수 있습니다.

제 16 조 (유료상품 서비스에 대한 환불)
1. 유료상품 서비스의 경우 서비스 장애 또는 '회사'가 제시한 최소한의 기술사양을 충족하였음에도 불구하고 '회사'의 귀책사유로 서비스를 이용하지 못한 경우 절차에 따라 환불이 가능합니다. 단, 회원이 유료로 결제한 사이버머니(개념)를 청약 후 한번도 사용하지 않은 경우 환불이 아닌 결제 취소로 진행됩니다.
2. 모바일로 결제한 사이버머니(개념)는 익익월, 신용카드로 결제한 사이버머니(개념)는 익월에 결제가 완료된 이후, 환불이 가능합니다.
3. 과오금이 발생한 경우, '회사'는 회원에 대하여 이용대금의 결제와 동일한 방법으로 과오금 전액을 환불하여야 합니다. 다만, 동일한 방법으로 환불이 불가능할 때는 '회사'가 정한 별도의 방법으로 환불합니다.
4. '회사'의 책임 있는 사유로 과오금이 발생한 경우 회사는 계약비용, 수수료 등에 관계없이 과오금 전액을 환불합니다. 다만, 회원의 책임 있는 사유로 과오금이 발생한 경우, '회사'가 과오금을 환불하는 데 소요되는 비용은 합리적인 범위 내에서 회원이 부담하여야 합니다.
5. '회사'는 회원이 주장하는 과오금에 대하여 환불을 거부할 경우에 정당하게 이용대금이 부과되었음을 입증할 책임을 집니다.
6. 주민등록법, 저작권법, 컴퓨터프로그램보호법, 정보통신망법 등 각종 법령에 대한 중대한 불법행위 또는 사기, 버그 악용, 운영자 사칭 등 운영에 심각한 악영향을 미치는 행위를 한 것으로 판단되는 회원의 ID(계정) 이용을 제한하거나 해당 이용자와의 계약을 해지하는 경우는 환불하지 않을 수 있습니다. 다만, 이용자가 중대한 불법행위 또는 운영에 심각한 악영향을 미치는 행위를 하지 않았음을 소명하는 경우는 그러하지 않습니다.

제 17조 (API 및 인공지능)
1. 회원이 서비스를 이용하는 과정에서 Application Programming Interface (이하 'API') 를 이용하는 경우 생성되는 정보 중 일부가 Naver, Microsoft, Google, IBM 등의 'API' 를 제공하는 회사에 제공, 보관, 활용될 수 있습니다.
2. '회사'는 회원이 서비스를 이용하는 과정에서 생성되는 정보 중 일부를 인공지능 등의 서비스 개발을 위하여 수집, 보관, 활용할 수 있습니다.

제 18 조 (계약해지 및 이용제한)
1. 회원이 이용계약을 해지하고자 하는 때에는 회원 본인이 온라인을 통해 '회사'에 해지신청을 하여야 합니다.
2. '회사' 및 운영진은 회원이 다음 각 호의 1에 해당하는 행위를 하였을 경우 사전통지 없이 이용계약을 해지하거나 또는 기간을 정하여 서비스 이용을 중지할 수 있습니다.
  ㄱ. 타인의 서비스 ID 및 비밀번호를 도용한 경우
  ㄴ. 서비스 운영을 고의로 방해한 경우
  ㄷ. 가입한 이름이 실명이 아닌 경우
  ㄹ. 같은 사용자가 다른 ID로 이중등록을 한 경우
  ㅁ. 공공질서 및 미풍양속에 저해되는 내용을 유포시킨 경우
  ㅂ. 회원이 국익 또는 사회적 공익을 저해할 목적으로 서비스 이용을 계획 또는 실행하는 경우
  ㅅ. 타인의 명예를 손상시키거나 불이익을 주는 행위를 한 경우
  ㅇ. 기타 '회사'가 정한 이용조건에 위반한 경우
  ㅈ. 광고성글이나 도배행위
  ㅊ. '회사'의 목적과 상관없는 글을 올리는 경우
  ㅋ. 타인의 글을 자신의 글로 위장해서 올리는 경우

제 19 조 (면책조항)
1. '회사'는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.
2. '회사'는 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다.
3. '회사'는 회원이 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다.
4. '회사'는 회원이 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다.

제 20 조 (관할법원)
요금 등 서비스 이용으로 발생한 분쟁에 대해 소송이 제기될 경우 관할법원은 민사소송법이 정하는 바에 따릅니다.

[부칙]
(시행일) 이 약관은 서비스 화면에 게재한 후 즉시 시행합니다.		
			</textarea>
		</div>
		<div class="content-middle2">
			<h4 style="font-size: 23px; margin:5px 0;">개인정보 수집 및 이용에 대한 안내</h4>
			<textarea style="width: 800px; height: 100px; resize: none; font-size: 12px;" readonly>
[수집하는 개인정보의 항목]

가. 회사는 회원가입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.
- 성명, 아이디, 비밀번호, 생년월일, 성별, 대화명, 메일주소, 휴대폰 번호

나. 서비스 이용과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록
- 단말기정보(OS, 브라우저 User Agent, 디바이스 아이디, 디바이스 고유번호)

다. 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다.
- 신용카드 결제시 : 카드사명, 카드번호 등
- 휴대전화 결제시 : 이동전화번호, 통신사, 결제승인번호 등
- 계좌이체시 : 은행명, 계좌번호 등
- 상품권 이용시 : 상품권 번호

라. 서비스 이용 과정에서 핸드폰 인증시 아래와 같은 정보들이 수집될 수 있습니다.
- 휴대폰 번호
			</textarea>
			<br>
			<br>
			<textarea style="width: 800px; height: 100px; resize: none; font-size: 12px;" readonly>
[개인정보의 수집 및 이용 목적]

가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
컨텐츠 제공, 특정 맞춤 서비스 제공, 물품배송 또는 청구서 등 발송, 본인인증, 구매 및 요금 결제, 요금추심

나. 회원관리
회원제 서비스 이용 및 제한적 본인 확인제에 따른 본인확인, 개인식별, 불량회원의 부정 이용방지와 비인가 사용방지, 가입의사 확인, 가입 및 가입횟수 제한, 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 추후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달

다. 신규 서비스 개발 및 마케팅·광고에의 활용
신규 서비스 개발 및 맞춤 서비스 제공, 통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 접속빈도 파악, 회원의 서비스 이용에 대한 통계
			</textarea>
			<br>
			<br>
			<textarea style="width: 800px; height: 100px; resize: none; font-size: 12px;" readonly>
[개인정보의 보유 및 이용기간]

개인정보의 보유 및 이용기간이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존할 수 있습니다.

가. 회사 내부 방침에 의한 정보보유 사유
- 부정이용기록 (징계기록 등의 비정상적 서비스 이용기록)
보존 항목 : 아이디, 대화명, 인증 휴대폰 번호, 메일주소
보존 근거 : 부정 가입 및 부정 이용 방지, 불법적 사용 방지
보존 기간 : 5년
※ ‘부정이용기록’이란 운영원칙에 위배되는 게시글 작성 등으로 인해 회사로부터 이용제한 등을 당한 기록입니다.

나. 관련법령에 의한 정보보유 사유
상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.
- 웹사이트 방문기록
보존 이유 : 통신비밀보호법
보존 기간 : 3개월
- 소비자의 불만 또는 분쟁처리에 관한 기록
보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률
보존 기간 : 3년
- 계약 또는 청약철회 등에 관한 기록
보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률
보존 기간 : 5년
- 대금결제 및 재화 등의 공급에 관한 기록
보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률
보존 기간 : 5년

[개인정보의 취급위탁]

회사는 다음과 같이 개인정보의 취급을 위탁하고 있습니다.
- 수탁업체명: 인포뱅크, 가비아
- 위탁 업무 내용: 핸드폰 인증시 본인확인 승인번호 SMS 발송, 회사가 제공하는 서비스 안내 SMS 발송
			</textarea>
		</div>
		<br>
		<form class="form" action="<%=request.getContextPath()%>/member/join.jsp" method="post">
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
