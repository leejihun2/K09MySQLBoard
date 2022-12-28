<%@page import="boardwriting.boardWritingDTO"%>
<%@page import="boardwriting.boardWritingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%>
<%
//폼값 받기
String num = request.getParameter("num"); 
String title = request.getParameter("title");
String content = request.getParameter("content");
String b_flag = request.getParameter("b_flag");

//DTO에 폼값 저장
boardWritingDTO dto = new boardWritingDTO();
dto.setNum(num);
dto.setTitle(title);
dto.setContent(content); 
dto.setB_flag(b_flag);

//DAO객체 생성 및 게시물 수정을 위한 메서드 호출
boardWritingDAO dao = new boardWritingDAO(application);
int affected = dao.updateEdit(dto);
dao.close();

if (affected == 1) {
	//수정이 정상적으로 처리된 경우에는 1이 반환되고, 상세보기로 이동한다. 
    response.sendRedirect("writingView.jsp?b_flag="+b_flag+"&num=" + num); 
} 
else {
	//실패한 경우에는 뒤로 이동한다.
    JSFunction.alertBack("수정하기에 실패하였습니다.", out);
}
%>
