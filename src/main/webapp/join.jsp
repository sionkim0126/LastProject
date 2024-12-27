<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="jquery-3.7.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>SONMUSEUM 회원가입</title>
<script type="text/javascript">
function sample4_execDaumPostcode() {
  new daum.Postcode({
      oncomplete: function(data) {
          var roadAddr = data.roadAddress; // 도로명 주소 변수
          var extraRoadAddr = ''; // 참고 항목 변수

          if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
              extraRoadAddr += data.bname;
          }
          if(data.buildingName !== '' && data.apartment === 'Y'){
            extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
          }
          if(extraRoadAddr !== ''){
              extraRoadAddr = ' (' + extraRoadAddr + ')';
          }

          document.getElementById('sample4_postcode').value = data.zonecode;
          document.getElementById("sample4_roadAddress").value = roadAddr;
          document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
          
          if(roadAddr !== ''){
              document.getElementById("sample4_extraAddress").value = extraRoadAddr;
          } else {
              document.getElementById("sample4_extraAddress").value = '';
          }

          var guideTextBox = document.getElementById("guide");
          if(data.autoRoadAddress) {
              var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
              guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
              guideTextBox.style.display = 'block';
          } else if(data.autoJibunAddress) {
              var expJibunAddr = data.autoJibunAddress;
              guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
              guideTextBox.style.display = 'block';
          } else {
              guideTextBox.innerHTML = '';
              guideTextBox.style.display = 'none';
          }
      }
  }).open();
}
</script>
</head>
<body>
  <div id="wrap">
    <jsp:include page="header.jsp"></jsp:include>
    <div id="contents">
      <div class="joincon">
        <h2>회원가입</h2>
        <div id="joininfo">
          <form action="register" method="POST">
            <div >
			   <input type="radio" name="role" value="artist" required> 작가
			  <input type="radio" name="role" value="person" required> 회원
			  </div>
			 <div>
              <input id="input" type="text" name="id" required placeholder="아이디" />
            </div>
            <div>
              <input id="input" type="text" name="name" required placeholder="이름" />
            </div>
            <div>
              <input id="input" type="text" name="nicname" required placeholder="닉네임" />
            </div>
            <div>
              <input id="input" type="password" name="password" required placeholder="비밀번호" />
            </div>
            <div>
              <input id="input" type="password" name="confirm_password" required placeholder="비밀번호 확인" />
            </div>
            <div>
              <input id="input" type="email" name="email" required placeholder="이메일" />
            </div>
            <div>
              <input type="text" id="sample4_postcode" placeholder="우편번호" name="postcode" class="inputpost1" />
              <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="button"/><br>
              <input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="postadd" class="inputpost" /><br>
              <input type="text" id="sample4_detailAddress" placeholder="상세주소" name="postdetail" class="inputpost" /><br />
              <input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" />
              <span id="guide" style="color:#999;display:none"></span>
              <input type="hidden" id="sample4_extraAddress" placeholder="참고항목" />
            </div>
            <div>
              <input id="input" type="tel" name="phone" required placeholder="전화번호" />
            </div>
            <div>
              <button type="submit" class="button">회원가입</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
  </div>
</body>
</html>
