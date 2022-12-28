<%@page import="utils.JSFunction"%>
<%@page import="homework.board.BoardHomeDAO"%>
<%@page import="homework.board.BoardHomeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String userId = request.getParameter("id");
String userPwd = request.getParameter("pass");
String userName = request.getParameter("name");

BoardHomeDTO dto = new BoardHomeDTO();
dto.setId(userId);
dto.setPass(userPwd);
dto.setName(userName);


BoardHomeDAO dao = new BoardHomeDAO(application);

int iResult = dao.updateModify(dto);

dao.close();

if (iResult == 1) {
	
	JSFunction.alertLocation("회원정보수정 성공", "../homework/boardList.jsp", out);
}
else {
	
	request.setAttribute("LoginErrMsg", "회원정보수정 오류입니다.");
	request.getRequestDispatcher("boardModifyForm.jsp")
		.forward(request, response);
	
}
%>