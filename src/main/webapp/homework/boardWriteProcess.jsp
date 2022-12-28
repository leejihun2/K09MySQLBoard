<%@page import="homework.board.BoardHomeDAO"%>
<%@page import="homework.board.BoardHomeDTO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 글쓰기 페이지에 오랫동안 머물러 세션이 삭제되는 경우가
있으므로 글쓰기 처리 페이지에서도 반드시 로그인을 확인해야된다. -->
<%@ include file="./IsLoggedIn.jsp"%>  
<%
String title = request.getParameter("title");
String content = request.getParameter("content");

BoardHomeDTO dto = new BoardHomeDTO();
dto.setTitle(title);
dto.setContent(content); 

dto.setId(session.getAttribute("UserId").toString());

BoardHomeDAO dao = new BoardHomeDAO(application);

int iResult = dao.insertWrite(dto);

dao.close();

if (iResult == 1) {
	
	response.sendRedirect("boardList.jsp");
}
else {
	
	JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
}
%>
