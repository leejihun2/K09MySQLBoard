<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">    
<script type="text/javascript">
function validateForm(form) {  
    if (form.title.value == "") {
        alert("제목을 입력하세요.");
        form.title.focus();
        return false;
    }
    if (form.content.value == "") {
        alert("내용을 입력하세요.");
        form.content.focus();
        return false;
    }
    if (form.name.value == "") {
        alert("작성자를 입력하세요.");
        form.name.readonly = false;
        return false;
}
</script>
</head>
<body>
<div class="container">
    <div class="row">
    	<!-- 상단 네비게이션 인클루드 -->
        <%@ include file="../homework/inc/top.jsp" %>
    </div>
    <div class="row">
    		    <!-- 좌측 메뉴 -->
        		<%@ include file="../homework/inc/left.jsp" %>
        <div class="col-9 pt-3  d-flex justify-content-center">
        <div>
			<form action="LoginProcess.jsp" method="post" name="loginFrm" 
		onsubmit="return validateForm(this);">
            <h3 class="mb-2" style="text-align: center; font-weight: bold">로그인<small>하기</small><i class="bi bi-door-open"></i></h3>
		<div class="mb-2">
		 <input type="text" name="user_id" style="width: 300px" placeholder="아이디"><br>
		 </div>
		 <div class="mb-2">
		<input type="password" name="user_pw" style="width: 300px" placeholder="패스워드"><br> 
		</div>
		<div class="mb-2">
		<button type="submit" style="width: 300px" class="btn btn-primary">로그인</button>
		</div>
	</form>
		<div class="mb-2">
		<button type="submit" style="width: 300px" onclick="location.href='boardRegisterForm.jsp';" class="btn btn-primary">회원가입</button>
		</div>
	</div>
                
                	<span style="color: red; font-size: 1.2em;"> <%=request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")%>
	</span>
	<%
	if (session.getAttribute("UserId") == null) {
	%>
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
	
	<%
	} else {
	%>

	<%=session.getAttribute("UserName")%>
	회원님, 로그인하셨습니다.
	<a href="Logout.jsp">[로그아웃]</a>
	<%
	}
	%>
                
        </div>
    </div>
    	<!-- 하단 인클루드 -->
    	<%@ include file="../homework/inc/bottom.jsp" %>
</div>
</body>
</html>