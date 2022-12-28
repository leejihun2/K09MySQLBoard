<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
<link rel='stylesheet'
	href='https://unicons.iconscout.com/release/v2.1.9/css/unicons.css'>
<link rel="stylesheet" type="text/css" href="./wLoginFrom.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script>
	function RegidateFrom(form) {
		if (form.title.value == "") {
			alert("중복확인을 누르세요");
			form.title.focus();
			return false;
		}
	}

	function openModal() {

		var usrId = document.getElementById("user_id").value;
		if (usrId == '') {
			alert("아이디를 입력하고 누르삼");
		} else {

			window.open("./id_overapping.jsp?usrId=" + usrId, "idover",
					"width=400px, height=400px");
		}
	}
	function searchId(){		
	    open("./IdSearch.jsp",
	     "idSearch",
	     "width=400px, height=400px, left=1000, top=150, "
	     + "location=no, toolbar=no, menubar=no, "
	     + "scrollbars=yes, resize=no");
	}
	function searchPw(){		
	    open("./PwSearch.jsp",
	     "pwSearch",
	     "width=400px, height=400px, left=1000, top=150, "
	     + "location=no, toolbar=no, menubar=no, "
	     + "scrollbars=yes, resize=no");
	}
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

	$(function() {
		//패스워드 입력란에 입력후 키보드를 땠을때 함수를 실행한다. 
		$('#user_pw').keyup(
				function() {
					//패스워드1에 입력한 내용을 변수로 저장한다. 
					var inputVal = $(this).val();
					//콘솔에서 확인하기.
					console.log("입력", inputVal);

					if (inputVal.length >= 8) {
						//alert("정상");
						//패스워드가 8자 이상이면 검증처리한다.
						$('#confirm4').css({
							'color' : 'rgb(255,235,167)',
							'fontSize' : '22px',
							'fontWeight' : 'bold'
						});
					} else {
						//8자 미만이면 초기상태로 스타일을 지정한다.
						$('#confirm4').css('color', 'gray').css('fontSize',
								'20px').css('fontWeight', 'normal');
					}

					//대소문자 및 숫자를 체킹할 수 있는 변수 생성
					var strUpper = false, strLower = false, strNumber = false;

					//입력한 패스워드의 길이만큼 반복하여 모든 문자를 검사한다. 
					for (var i = 0; i < inputVal.length; i++) {
						//입력값의 아스키코드를 확인해본다.
						console.log("아스키코드값", inputVal[i].charCodeAt(0));

						//입력한 문자열 중에 아래조건에 맞는 문자가 하나라도 존재하면 true로 
						//변경해준다.

						//대문자인지 확인
						if (inputVal[i].charCodeAt(0) >= 65
								&& inputVal[i].charCodeAt(0) <= 90) {
							strUpper = true;
						}
						//소문자인지 확인
						if (inputVal[i].charCodeAt(0) >= 97
								&& inputVal[i].charCodeAt(0) <= 122) {
							strLower = true;
						}
						//숫자인지 확인
						if (inputVal[i].charCodeAt(0) >= 48
								&& inputVal[i].charCodeAt(0) <= 57) {
							strNumber = true;
						}
					}

					//조건에 맞는 부분에 빨간색으로 변경해준다.
					//대문자 컨펌
					if (strUpper == true)
						$('#confirm1').css({
							'color' : 'rgb(255,235,167)',
							'fontSize' : '22px',
							'fontWeight' : 'bold'
						});
					else
						$('#confirm1').css({
							'color' : 'gray',
							'fontSize' : '20px',
							'fontWeight' : 'normal'
						});

					//소문자 컨펌
					if (strLower == true)
						$('#confirm2').css({
							'color' : 'rgb(255,235,167)',
							'fontSize' : '22px',
							'fontWeight' : 'bold'
						});
					else
						$('#confirm2').css({
							'color' : 'gray',
							'fontSize' : '20px',
							'fontWeight' : 'normal'
						});

					//숫자 컨펌
					if (strNumber == true)
						$('#confirm3').css({
							'color' : 'rgb(255,235,167)',
							'fontSize' : '22px',
							'fontWeight' : 'bold'
						});
					else
						$('#confirm3').css({
							'color' : 'gray',
							'fontSize' : '20px',
							'fontWeight' : 'normal'
						});
				});

		//패스워드 확인을 입력한 후 키보드를 땠을때 검증한다.
		$('#user_pw2').keyup(
				function() {
					//패스워드입력과 확인 부분의 입력된값을 가져온다. 
					var p1 = $('#user_pw').val();
					var p2 = $(this).val();
					//2개의 값이 일치하는지 확인하여 텍스트를 출력한다. 
					if (p1 == p2) {
						$('#passConfirm').html('패스워드가 일치합니다.').css('color', 'rgb(90,90,90)');
					} else {
						$('#passConfirm').html('패스워드가 틀렸습니다.').css('color', 'rgb(90,90,90)');
					}
				});
	});

	function inputEmail(frm) {
		var domain = frm.email_sel.value;
		if (domain == '') {//--선택-- 부분을 선택했을때
			frm.email1.value = '';//모든 입력값을 지운다. 
			frm.email2.value = '';
		} else if (domain == '직접입력') {//'직접입력'을 선택했을때
			frm.email2.readOnly = false;//사용자가 입력해야 하므로 readonly속성을 해제한다. 
			frm.email2.value = '';
			frm.email2.focus();
		} else {//도메인을 선택했을때
			frm.email2.value = domain;//선택한 도메인을 입력한다. 
			frm.email2.readOnly = true;//입력된 값을 수정할 수 없도록 readonly속성을 활성화한다. 
		}
	}
</script>
</head>
<body>


	<!-- partial:index.partial.html -->
	<a href="https://front.codes/" class="logo" target="_blank"> <!-- <img src="https://assets.codepen.io/1462889/fcy.png" alt=""> -->
	</a>


	<span style="color: red; font-size: 1.2em;"> <%=request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")%>
	</span>
	<div class="section">
		<div class="container">
			<div class="row full-height justify-content-center">
				<div class="col-12 text-center align-self-center py-5">
				<div class="section pb-5 pt-5 pt-sm-2 text-center">
						<h6 class="mb-0 pb-3"><span>로그인</span><span>회원가입</span></h6>
			          	<input class="checkbox" type="checkbox" id="reg-log" name="reg-log"/>
			          	<label for="reg-log"></label>
						<div class="card-3d-wrap mx-auto">
							<div class="card-3d-wrapper">
								<div class="card-front">
									<div class="center-wrap">
										<div class="section text-center">

											<form action="wLoginProcess.jsp" method="post"
												name="loginFrm" onsubmit="return validateForm(this);">
											<input class="checkbox2" type="checkbox" name="cookie_id" style="margin-left:62px; margin-bottom:7px;" />아이디 저장<br />
												<div class="form-group">
													<input type="text" name="user_id" class="form-style"
														placeholder="아이디를 입력하세요" id="logemail" autocomplete="off">
													<i class="input-icon uil uil-user"></i>
												</div>
												<div class="form-group mt-2">
													<input type="password" name="user_pw" class="form-style"
														placeholder="비밀번호를 입력하세요" id="logpass" autocomplete="off">
													<i class="input-icon uil uil-lock-alt"></i>
												</div>
												<input type="submit" class="btn mt-4" value="로그인하기">
												<p class="mb-0 mt-4 text-center">
												<a href="#" onclick="searchId()">아이디 찾기</a> &nbsp; <a href="#" onclick="searchPw()">비밀번호 찾기</a> 
												</p>
											</form>
										</div>
									</div>
								</div>

								<div class="card-back">
									<div class="center-wrap">
										<div class="section text-center">
											<form action="WRegisterProcess.jsp" method="post"
												name="regiFrm" id="regiFrm">
												<div class="form-group">
													<input type="text" name="user_id" id="user_id"
														class="form-style3" placeholder="아이디" autocomplete="off">
													<!-- <a href="#" class="btn2 mt-4">중복확인</a> -->
													<button type="button" onclick="openModal();"
														class="btn2 mt-4">중복확인</button>
												</div>
												<div class="form-group mt-2">
													<input type="text" name="user_name" class="form-style"
														placeholder="이름" id="user_name" autocomplete="off">
													<i class="input-icon uil uil-user"></i>
												</div>
												<div class="form-group mt-2">
													<!-- 비밀번호 보기 -->
													<input type="password" name="user_pw" class="form-style"
														placeholder="비밀번호" id="user_pw" autocomplete="off">
													<i class="input-icon uil uil-lock-alt"></i>
													<div style="padding-left: 20px;">
														<span id="confirm1" class="confirmChar">√ &nbsp;</span>대문자	&nbsp; &nbsp; 
														<span id="confirm2" class="confirmChar">√ &nbsp;</span>소문자 &nbsp; &nbsp; 
														<span id="confirm3"	class="confirmChar">√ &nbsp;</span>숫자 &nbsp; &nbsp; 
														<span id="confirm4" class="confirmChar">√ &nbsp;</span>8자이상
													</div>
												</div>
												<div class="form-group mt-2">
													<input type="password" name="user_pw2" class="form-style"
														placeholder="비밀번호 확인" id="user_pw2" autocomplete="off">
													<i class="input-icon uil uil-lock-alt"></i>
													<div id="passConfirm"></div>
												</div>
												<!-- <form name="myform" action="" method="" onsubmit="return formValidate(this);"> -->
												<div class="form-group mt-2">
													<input type="text" name="email1" class="form-style2"
														placeholder="이메일" id="email1" autocomplete="off">
													<!-- <i class="input-icon uil uil-at"></i> -->
													<span style="font-size: 16px; color: #ffeaa7;">＠</span> <input
														type="text" name="email2" class="form-style2" id="email2" autocomplete="off"> 
														<select name="email_sel"
														onchange="inputEmail(this.form);" class="form-style2">
														<option value="">-- 선택 --</option>
														<option value="naver.com">naver.com</option>
														<option value="nate.com">nate.com</option>
														<option value="gmail.com">gmail.com</option>
														<option value="daum.net">daum.net</option>
														<option value="hanmail.net">hanmail.net</option>
														<option value="직접입력" selected>직접입력</option>
													</select>
												</div>
												<!-- </form> -->
												<div class="form-group mt-2">
													<input type="test" name="pnum" class="form-style"
														placeholder="핸드폰번호" id="pnum" autocomplete="off">
													<i class="input-icon uil uil-phone"></i>
												</div>
												<button type="button" class="btn mt-4"
													onclick="validateForm2()">회원가입</button>
												<!-- <a href="#" class="btn mt-4">회원가입</a> -->
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
Cookie[] cookies = request.getCookies();
boolean cookieExist = false;
String cookieCheck = "";
for(Cookie c : cookies) {
    String cookieName = c.getName();   
    String cookieValue = c.getValue();   
    if (cookieName.equals("loginCookie")) {
    	cookieExist = true;
    	cookieCheck = c.getValue();
    	break;
    }
}
if(cookieExist == true){
%>
	<script>
		document.getElementById("cook").value = "<%= cookieCheck %>";
	</script>
<%
}
%>	
		
									
<span style="color: red; font-size: 1.2em;"> <%=request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")%>
				</span>
				<%
				if (session.getAttribute("UserId") == null) {
				%>
				<script>
					function validateForm2() {


						var form = document.getElementById("regiFrm");
						
						if (!form.user_id.value) {
							alert("아이디를 입력하세요.");
							form.user_id.focus();
							return false;
						}
						if (form.title.value == "") {
							alert("중복확인을 누르세요");
							form.title.focus();
							return false;
						}
						if (!form.user_name.value) {
							alert("이름을 입력하세요.");
							form.user_id.focus();
							return false;
						}
						if (!form.user_pw.value || !form.user_pw2.value) {
							alert("비밀번호을 입력하세요.");
							form.user_pw.focus();
							return false;
						}
						if (!form.email1.value|| !form.email2.value) {
							alert("이메일을 입력하세요.");
							form.email1.focus();
							return false;
						}
						if (!form.pnum.value) {
							alert("번호를 입력하세요.");
							form.pnum.focus();
							return false;
						}
	
						form.submit();
						
					}
				</script>

				<%
				} else {
				%>

				<%=session.getAttribute("UserName")%>
			<!-- 	회원님, 로그인하셨습니다. <a href="Logout.jsp">[로그아웃]</a> -->
				<%
				}
				%>
									
									
	<!-- partial -->
	<script src="./script.js"></script>

</body>
</html>