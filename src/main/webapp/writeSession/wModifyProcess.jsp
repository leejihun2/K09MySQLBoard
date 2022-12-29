<%@page import="memberwriting.WriteMemberDAO"%>
<%@page import="memberwriting.WriteMemberDTO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String userId = request.getParameter("id");
String userPwd = request.getParameter("pass");
String userName = request.getParameter("name");
String useremail = request.getParameter("email");
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

int iResult = dao.updateModify(dto);

dao.close();

if (iResult == 1) {
	session.removeAttribute("UserId");
	session.removeAttribute("UserName");

	session.invalidate();

	JSFunction.alertLocation("회원정보수정 성공", "wLoginFrom.jsp", out);
}
else {
	
	request.setAttribute("LoginErrMsg", "회원정보수정 오류입니다.");
	request.getRequestDispatcher("wModifyForm.jsp")
		.forward(request, response);
	
}
%>