<%@page import="utils.JSFunction"%>
<%@page import="homework.board.BoardHomeDTO"%>
<%@page import="homework.board.BoardHomeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");
BoardHomeDAO dao = new BoardHomeDAO(application);
BoardHomeDTO dto = dao.selectView(num);
String sessionId = session.getAttribute("UserId").toString();
if(!sessionId.equals(dto.getId())) {
	JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
	return; 
}
dao.close();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">    
<script type="text/javascript">
function validateForm(form) {
	if (form.title.value == ""){
		alert("제목을 입력하세요.");
		form.tirle.focus();
		return false;
	}
	if (form.content.value == ""){
		alert("내용을 입력하세요.");
		form.content.focus();
		return false;
	}
}
</script>
</head>
<body>
<div class="container">
    <div class="row">
    	<!-- 상단 네비게이션 인클루드 -->
        <%@ include file="./inc/top.jsp" %>
    </div>
    <div class="row">
    		    <!-- 좌측 메뉴 -->
        		<%@ include file="./inc/left.jsp" %>
        <div class="col-9 pt-3">
            <h3>게시판 작성 - <small>글쓰기</small></h3>
				
            <form name="writeFrm" method="post" action="boardEditProcess.jsp"
      			onsubmit="return validateForm(this);"> <!-- enctype="multipart/form-data" -->
                <input type="hidden" name="num" value="<%= dto.getNum() %>" />
                <table class="table table-bordered">
                <colgroup>
                    <col width="20%"/>
                    <col width="*"/>
                </colgroup>
                <tbody>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">제목</th>
                        <td>
                            <input type="text" name="title" style="width: 90%;"
						value="<%= dto.getTitle() %>" />
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;" >내용</th>
                        <td>
                            <textarea name="content" style="width: 90%; height: 100px;"><%= dto.getContent() %></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">첨부파일</th>
                        <td>
                            <input type="file" class="form-control" />
                        </td>
                    </tr>
                </tbody>
                </table>
                
                <div class="row">
                    <div class="col text-right mb-4">
                        <!-- 각종 버튼 부분 -->
                        <button type="submit" class="btn btn-info">작성 완료</button>
		                <button type="reset" class="btn btn-danger" >다시 입력</button>
		                <button type="button" class="btn btn-warning" onclick="location.href='boardList.jsp';">
		                    목록 보기</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    	<!-- 하단 인클루드 -->
    	<%@ include file="./inc/bottom.jsp" %>
</div>
</body>
</html>