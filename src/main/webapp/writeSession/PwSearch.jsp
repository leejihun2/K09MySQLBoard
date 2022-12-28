<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
		  background-color: rgb(247,247,247);
		  border: none;
		  -webkit-transition: all 200ms linear;
		  transition: all 200ms linear;
		  box-shadow: 0 4px 8px 0 rgb(21,21,21,.2);
		}
</style>
<script>
	function comfotable(idx, lengthx, next){
		if(document.getElementById(idx).value.length == lengthx)
			document.getElementById(next).focus();
	}
</script>
</head>
<body>
    <%
    if(request.getAttribute("pass") != null){
    %>
	    <div style="margin-top:60px; text-align:center;">
	    	해당 아이디의 비밀번호는<br />
	    	"<%= request.getAttribute("pass") %>"입니다.
	    	<br /><br />
	    <button type="button" onclick="self.close()" style="border-radius:5px; border:1px solid grey;
	    		width:50px; height:30px;">닫기</button>
	   </div>
    <% } else { %>
    <h2 style="margin-left:30px; margit-top:30px;">비밀번호 찾기</h2>
		<form action="./PwSearchProcess.jsp" style="margin-left:30px;" onsubmit="return formValidate(this);">
			<table>
				<tr>
		            <td>
		                <input class="form-style" type="text" name="id"  placeholder="아이디" />
		            </td>
		        </tr>
				<tr>
		            <td>
		                 <input class="form-style" type="text" id="m1" name="pnum"  placeholder="휴대전화"  />
		            </td>
		        </tr>
		    </table>
		    <br />
		    <input type="submit" class="btn" value="제출" />
		</form>	
	<%
    }
    %>    
</body>
</html>