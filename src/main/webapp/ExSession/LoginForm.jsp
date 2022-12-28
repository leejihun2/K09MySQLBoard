<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<!-- 액션태그를 통해 공통링크로 사용할 페이지를 인클루드하여
	해당문서에 포함시킨다 -->
	<jsp:include page="../Common/ExLink.jsp" /> <!-- 태그는 시작하면 끝이 있어야함 </> -->
	<h2>로그인 페이지</h2>
	<!-- 
	삼항연산자를 통해 request영역에 저장된 속성값이 있는 경우에만
	에러메세지를 화면에 출력한다.
	해당 속성값은 로그인 처리 페이지에서 회원 정보를 DB에서 찾지
	못한 경우 request영역에 속성값을 저장하게 된다.
	 -->
	<span style="color: red; font-size: 1.2em;"> <%=request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")%>
	</span>
	<%
	if (session.getAttribute("UserId") == null) {
	%>
	<!-- 로그인 폼의 입력값을 검증하기 위한 함수로 빈값인지를
	확인한다. -->
	<script>
		function validateForm(form) {
			if (!form.user_id.value) {
				alert("아이디를 입력하세요.");
				form.user_id.focus();
				return false;
			}

			if (form.user_pw.value == "") {
				alert("패스워드를 입력하세요.");
				form.user_pw.focus();
				return false;
			}
		}
	</script>
	<form action="aLoginProcess.jsp" method="post" name="loginFrm"
		onsubmit="return validateForm(this);">

		<label for="user_id">아이디 : </label> <input type="text" name="user_id"><br>
		<label for="user_pw">비밀번호 : </label> <input type="password"
			name="user_pw"><br> <input type="submit" value="로그인하기">

	</form>
	<%
	} else {
	%>

	<%=session.getAttribute("UserName")%>
	회원님, 로그인하셨습니다.
	<a href="Logout.jsp">[로그아웃]</a>
	<%
	}
	%>

</body>
</html>