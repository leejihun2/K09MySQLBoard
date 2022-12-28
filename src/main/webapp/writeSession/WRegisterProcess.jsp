<%@page import="memberwriting.WriteMemberDAO"%>
<%@page import="memberwriting.WriteMemberDTO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");
String userName = request.getParameter("user_name");
String useremail = request.getParameter("email1");
String useremail2 = request.getParameter("email2");
String userpnum = request.getParameter("pnum");

WriteMemberDTO dto = new WriteMemberDTO();
dto.setId(userId);
dto.setPass(userPwd);
dto.setName(userName);
dto.setEmail(useremail);
dto.setEmail2(useremail2);
dto.setPnum(userpnum);


WriteMemberDAO dao = new WriteMemberDAO(application);

int iResult = dao.insertRegister(dto);

dao.close();

if (iResult == 1) {
	
	JSFunction.alertLocation("회원가입 성공", "wLoginFrom.jsp", out);
}
else {
	
	request.setAttribute("LoginErrMsg", "회원가입오류입니다.");
	request.getRequestDispatcher("wLoginFrom.jsp")
		.forward(request, response);
	
}
%>