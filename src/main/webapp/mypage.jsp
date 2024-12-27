<%@page import="management.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.7.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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

<%
String alertmsg = request.getParameter("alertmsg");
if (alertmsg != null) {
%>
    alert("<%= alertmsg %>"); // JavaScript alert로 메시지 출력
<%
}
%>
</script>
</head>
<body>
  <div id="wrap">
    <jsp:include page="header.jsp"></jsp:include>
    <div id="contents">
	 <div class="mypagecon">
        <h2>정보수정</h2>
        <form action="Mypage" method="post">
        <table class="Mtable">
                        <%
                        List<MemberDTO> memberList = (List<MemberDTO>)request.getAttribute("memberList");
                        if (memberList != null && !memberList.isEmpty()) {
                            for (MemberDTO mem : memberList) {
                        %>
                        <tr>
                            <th>아이디</th>
                            <td><input id="Minput" type="text" name="id" required value="<%= mem.getId() %>" readonly /></td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td><input id="Minput" type="text" name="name" required value="<%= mem.getName() %>"  readonly/></td>
                        </tr>
                        <tr>
                            <th>닉네임</th>
                            <td><input id="Minput" type="text" name="nicname" required value="<%= mem.getNicname()%>" /></td>
                        </tr>
                        <tr>
                            <th>비밀번호</th>
                            <td><input id="Minput" type="password" name="password" required value="<%= mem.getPass() %>" /></td>
                        </tr>
                        <tr>
                            <th>비밀번호 확인</th>
                            <td><input id="MinputR" type="password" name="confirm_password" required placeholder="비밀번호 확인" /></td>
                        </tr>
                        <tr>
                        	<th>이메일</th>
                            <td><input id="Minput" type="email" name="email" required value="<%= mem.getEmail() %>" /></td>
                        </tr>
                        <tr>
                        	<th>우편번호</th>
                            <td><input type="text" id="sample4_postcode" required placeholder="우편번호" name="postcode" class="Minputpost1" />
                                <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="button"/></td>
                        </tr>
                        <tr>
                        	<th>도로명 주소</th>
                            <td><input type="text" id="sample4_roadAddress" required placeholder="도로명주소" name="postadd" class="Minputpost" /></td>
                        </tr>
                        <tr>
                        	<th>상세주소</th>
                            <td><input type="text" id="sample4_detailAddress" required placeholder="상세주소" name="postdetail" class="Minputpost" /></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" />
                                <span id="guide" style="color:#999;display:none"></span>
                                <input type="hidden" id="sample4_extraAddress" placeholder="참고항목" />
                            </td>
                        </tr>
                        <tr>
                        	<th>전화번호</th>
                            <td><input id="Minput" type="tel" name="phone" required value="<%= mem.getPhone() %>" /></td>
                        </tr>
                        <%
                            }
                        }
                        %>
                        <tr>
    						<td colspan="2"><button type="submit" class="button">수정</button></td>
						</tr>
                    </table>
        </form>
      </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
  </div>
</body>
</html>
