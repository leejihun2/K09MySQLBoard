<%@page import="utils.JSFunction"%>
<%@page import="homework.board.BoardHomeDAO"%>
<%@page import="homework.board.BoardHomeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");
String userName = request.getParameter("user_name");

BoardHomeDTO dto = new BoardHomeDTO();
dto.setId(userId);
dto.setPass(userPwd);
dto.setName(userName);


BoardHomeDAO dao = new BoardHomeDAO(application);

int iResult = dao.insertRegister(dto);

dao.close();

if (iResult == 1) {
	
	JSFunction.alertLocation("회원가입 성공", "boardLoginForm.jsp", out);
}
else {
	
	request.setAttribute("LoginErrMsg", "회원가입오류입니다.");
	request.getRequestDispatcher("boardRegisterForm.jsp")
		.forward(request, response);
	
}
%>