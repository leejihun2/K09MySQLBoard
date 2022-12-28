<%@page import="memberwriting.WriteMemberDTO"%>
<%@page import="memberwriting.WriteMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = (String)session.getAttribute("UserId");


WriteMemberDAO dao = new WriteMemberDAO(application);

WriteMemberDTO dto = dao.selectMember(id);

dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
<link rel='stylesheet'
	href='https://unicons.iconscout.com/release/v2.1.9/css/unicons.css'>
<link rel="stylesheet" type="text/css" href="./wModifyFrom.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script type="text/javascript">
function validateForm(form) { 
    if (form.id.value == "") {
        alert("아이디를 입력하세요.");
        form.title.focus();
        return false;
    }
    if (form.pass.value == "") {
        alert("비밀번호을 입력하세요.");
        form.content.focus();
        return false;
    }
    if (form.email1.value == "") {
        alert("이메일을 입력하세요.");
        form.name.readonly = false;
        return false;
    if (form.pnum.value == "") {
        alert("번호를 입력하세요.");
        form.name.readonly = false;
        return false;
        
}
</script>
</head>
<body>


<!-- partial:index.partial.html 	<i class="input-icon uil uil-pen"></i>-->
<a href="../writeboard/writehome.jsp" class="logo" target="_blank">  <img src="https://assets.codepen.io/1462889/fcy.png" alt=""> 
</a>


<span style="color: red; font-size: 1.2em;"> <%=request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")%>
</span>
<div class="section">
	<div class="container">
		<div class="row full-height justify-content-center">
			<div class="col-12 text-center align-self-center py-5">
				<div class="section pb-5 pt-5 pt-sm-2 text-center">
					<h6 class="mb-0 pb-3">
						<span>회원정보수정</span>
					</h6>
					<div class="card-3d-wrap mx-auto">
						<div class="card-3d-wrapper">
							<div class="card-front">
								<div class="center-wrap">
									<div class="section text-center">
										<form action="wModifyProcess.jsp" method="post" name="loginFrm" 
												onsubmit="return validateForm(this);">
											<div class="form-group">
												<input type="text" name="id" id="id"
													class="form-style" value="<%= dto.getId() %>" readonly="readonly" autocomplete="off">
											</div>
											<div class="form-group mt-2">
												<input type="text" name="name" id="name"  class="form-style"
													value="<%= dto.getName() %>" autocomplete="off">
												<i class="input-icon uil uil-user"></i>
											</div>
											<div class="form-group mt-2">
												<!-- 비밀번호 보기 -->
												<input type="text" name="pass" id="pass" class="form-style"
													value="<%= dto.getPass() %>"  autocomplete="off">
												<i class="input-icon uil uil-lock-alt"></i>
											</div>
											<!-- <form name="myform" action="" method="" onsubmit="return formValidate(this);"> -->
											<div class="form-group mt-2">
												<input type="text" name="email" id="email" class="form-style2"
													value="<%= dto.getEmail() %>" autocomplete="off">
												<!-- <i class="input-icon uil uil-at"></i> -->
											<span style="font-size: 16px; color: #ffeaa7;">＠</span> 
												<input type="text" name="email2" id="email2" class="form-style2" 
													value="<%= dto.getEmail2() %>"  autocomplete="off"> 
											</div>
											<!-- </form> -->
											<div class="form-group mt-2">
												<input type="text" name="pnum" id="pnum" class="form-style"
													value="<%= dto.getPnum() %>" autocomplete="off">
												<i class="input-icon uil uil-phone"></i>
											</div>
											<button type="submit" class="btn mt-4">정보수정</button>
											<!-- <a href="#" class="btn mt-4">회원가입</a> -->
										</form>
											</div>
               
									    <span style="color: red; font-size: 1.2em;"> <%=request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")%>
										</span>
						        </div>
						    </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<!-- partial -->
	<script src="./script.js"></script>

</body>
</html>