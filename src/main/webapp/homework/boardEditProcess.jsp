<%@page import="homework.board.BoardHomeDAO"%>
<%@page import="homework.board.BoardHomeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%>
<%
String num = request.getParameter("num");
String title = request.getParameter("title");
String content = request.getParameter("content");

BoardHomeDTO dto = new BoardHomeDTO();
dto.setNum(num);
dto.setTitle(title); 
dto.setContent(content);

BoardHomeDAO dao = new BoardHomeDAO(application);
int affected = dao.updateEdit(dto);
dao.close();


if (affected == 1) {
	
	response.sendRedirect("boardView.jsp?num=" + dto.getNum());
}
else {
	
	JSFunction.alertBack("수정하기에 실패하였습니다", out);
}
%>
