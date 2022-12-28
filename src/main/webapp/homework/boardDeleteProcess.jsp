<%@page import="homework.board.BoardHomeDAO"%>
<%@page import="homework.board.BoardHomeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 작성자 본인만 삭제할 수 있으므로 기본적으로 로그인 체크를 해야한다. -->
<%@ include file="./IsLoggedIn.jsp"%>
<%
String num = request.getParameter("num");

BoardHomeDTO dto = new BoardHomeDTO();
BoardHomeDAO dao = new BoardHomeDAO(application);
 
dto = dao.selectView(num);

String sessionId = session.getAttribute("UserId").toString();

int delResult = 0;

if (sessionId.equals(dto.getId())) {
	dto.setNum(num);
	delResult = dao.deletePost(dto);
	dao.close();
	
	if (delResult == 1) {
		JSFunction.alertLocation("삭제되었습니다.", "boardList.jsp", out);
	}
	else {
		JSFunction.alertBack("삭제에 실패하였습니다.", out);
	}
	
}
else {
	JSFunction.alertBack("본인만 삭제할 수 있습니다.", out);
	return;
}

%>