<%@page import="utils.JSFunction"%>
<%@page import="memberwriting.DatglDAO"%>
<%@page import="memberwriting.DatglDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");
String id = request.getParameter("id");
String content = request.getParameter("content");

DatglDTO dto = new DatglDTO();
dto.setNumm(num);
dto.setIdm(id);
dto.setContentm(content);

DatglDAO dao = new DatglDAO(application);

int iResult = dao.insertWrite(dto);
dao.close();

if(iResult == 1){	
	response.sendRedirect("./writingView.jsp?b_flag=si&num="+num);
} else {
	JSFunction.alertBack("댓글작성에 실패하였습니다.", out);
}
%>