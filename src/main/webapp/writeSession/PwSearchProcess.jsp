<%@page import="memberwriting.WriteMemberDTO"%>
<%@page import="memberwriting.WriteMemberDAO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String pnum = request.getParameter("pnum");
WriteMemberDAO dao = new WriteMemberDAO(application);
WriteMemberDTO dto = dao.searchPw(id, pnum);
dao.close();

if(dto.getPass() != null){
	request.setAttribute("pass", dto.getPass());
	request.setAttribute("name", dto.getName());
	request.getRequestDispatcher("./PwSearch.jsp").forward(request, response);
} else {
	JSFunction.alertBack("가입되지 않은 아이디입니다. 가입을 진행해주세요.", out);
}
%>