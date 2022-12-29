<%@page import="memberwriting.WriteMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = (String)session.getAttribute("UserId");
String userId = request.getParameter("usrId");

WriteMemberDAO dao = new WriteMemberDAO(application);

boolean isDup = dao.dupChkID(userId);

dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
	font-family: 'Poppins', sans-serif;
	font-weight: 300;
	font-size: 15px;
	line-height: 1.7;
	color: #c4c3ca;
	background-color: #f7f7f7;
	overflow-x: hidden;
}
.btn{  
  padding:3px 20px;
  border-radius: 4px;
  height: 44px;
  font-size: 13px;
  font-weight: 600;
  text-transform: uppercase;
  -webkit-transition : all 200ms linear;
  transition: all 200ms linear;
  padding: 0 30px;
  letter-spacing: 1px;
  display: -webkit-inline-flex;
  display: -ms-inline-flexbox;
  display: inline-flex;
  -webkit-align-items: center;
  -moz-align-items: center;
  -ms-align-items: center;
  align-items: center;
  -webkit-justify-content: center;
  -moz-justify-content: center;
  -ms-justify-content: center;
  justify-content: center;
  -ms-flex-pack: center;
  text-align: center;
  border: none;
  background-color: #ffeba7;
  color: #5a5a5a;
  box-shadow: 0 8px 24px 0 rgba(255,235,167,.2);
}
	.form-style {
		  padding: 13px 20px;
		  padding-left: 55px;
		  height: 20px;
		  width: 100px;
		  font-weight: 500;
		  border-radius: 4px;
		  font-size: 14px;
		  line-height: 22px;
		  letter-spacing: 0.5px;
		  outline: none;
		  color: #c4c3ca;
		  background-color: #2a2b38;
		  border: none;
		  -webkit-transition: all 200ms linear;
		  transition: all 200ms linear;
		  box-shadow: 0 4px 8px 0 rgba(21,21,21,.2);
}
</style>
<script>
	function idUse() {
		
	    opener.document.regiFrm.user_id.value =
	    	
	    	document.getElementById('user_id').innerHTML;
	    	opener.document.regiFrm.user_id.readOnly = true;
	    	
	        self.close();
	    
	}

	window.onload = function(){
		
	var url = location.href;
	
	console.log(url);
	
	var parameters = (url.slice(url.indexOf('?') + 1,
	    url.length)).split('&');
	
	console.log(parameters[0]); 
	
	returnValue = parameters[0].split('=')[1];
	
	document.getElementById('user_id').innerHTML = returnValue;
	}




</script>


</head>
<body>
    <h2>아이디 중복확인 하기</h2>


    <h4>입력한 아이디 :
    <span id="user_id"></span>
    <%-- <%= userId %> --%></h4>
    <%
    

if(!isDup){
	System.out.println("중복아이디 있음");

	%>
	
	
    <h3>다른 아이디를 입력해주세요</h3>
    <form name="overlapFrm1" action="id_overapping.jsp">
        <input class="form-style" type="text" name="user_id" placeholder="아이디" >  
        <button type="submit" class="btn" >중복검사</button>
        <!-- <input type="submit" value="중복검사"> -->
    </form>
    
	<%
}else{
	System.out.println("사용가능");
	%>
	
	<h3>아이디 사용가능 </h3>
    <form name="overlapFrm2">
        <input type="hidden" name="retype_id" size="20"> 
        <button type="button" class="btn" onclick="idUse();" >아이디사용하기</button>   
        <!-- <input type="button" value="아이디사용하기" onclick="idUse();"> -->
    </form>
    
    
  
    
    <%
    }
    %>

</body>
</html>