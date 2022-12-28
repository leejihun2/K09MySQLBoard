<%@page import="memberwriting.WriteMemberDAO"%>
<%@page import="memberwriting.WriteMemberDTO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String name = request.getParameter("name");
String pnum = request.getParameter("pnum");
WriteMemberDAO dao = new WriteMemberDAO(application);
WriteMemberDTO dto = dao.searchId(name, pnum);
dao.close();

if(dto.getId() != null){
	request.setAttribute("id", dto.getId());
	request.setAttribute("name", dto.getName());
	request.getRequestDispatcher("./IdSearch.jsp").forward(request, response);
} else{
	JSFunction.alertBack("가입되지 않은 회원명입니다. 가입을 진행해주세요.", out);
}
%>