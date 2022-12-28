<%@page import="homework.board.BoardHomeDTO"%>
<%@page import="homework.board.BoardHomeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");
BoardHomeDAO dao = new BoardHomeDAO(application);
dao.updateVisitCount(num);
BoardHomeDTO dto = dao.selectView(num);
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
<script>
function deletePost() {
    var confirmed = confirm("정말로 삭제하겠습니까?"); 
    if (confirmed) {
        var form = document.boardwriteFrm;      
        form.method = "post"; 
        form.action = "boardDeleteProcess.jsp"; 
        form.submit();         
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
    	<!-- 좌측 네비게이션 인클루드 -->
        <%@ include file="./inc/left.jsp" %>
        <div class="col-9 pt-3">
            <h3>게시판 내용보기 - <small>자유게시판</small></h3>

            <form name="boardwriteFrm">
            <input type="hidden" name="num" value="<%= num %>" /> 
            <table class="table table-bordered">
            <colgroup>
                <col width="20%"/>
                <col width="30%"/>
                <col width="20%"/>
                <col width="*"/>
            </colgroup>
            <tbody>
                <tr>
                    <th class="text-center" 
                        style="vertical-align:middle;">작성자</th>
                    <td>
                        <%= dto.getName() %>
                    </td>
                    <th class="text-center" 
                        style="vertical-align:middle;">작성일</th>
                    <td>
                    	 <%= dto.getPostdate() %>
                    	<%
                    	System.out.println("수정일 : " + dto.getModifydate());
                    	 if (dto.getModifydate() != null) {
                    	 %>
                    	 	<small>
                   	  		최근수정일 : <%= dto.getModifydate() %>
                    		</small>
                    	 <%
                    	 }
                    	 %>
                    </td>
                </tr>
                <tr>
                    <th class="text-center" 
                        style="vertical-align:middle;">이메일</th>
                    <td>
                        <%= dto.getNum() %>
                    </td>
                    <th class="text-center" 
                        style="vertical-align:middle;">조회수</th>
                    <td>
                        <%= dto.getVisitcount() %>
                    </td>
                </tr>
                <tr>
                    <th class="text-center" 
                        style="vertical-align:middle;">제목</th>
                    <td colspan="3">
                        <%= dto.getTitle() %>
                    </td>
                </tr>
                <tr>
                    <th class="text-center" 
                        style="vertical-align:middle;">내용</th>
                    <td colspan="3">
                		<%= dto.getContent().replace("\r\n", "<br/>") %>
            		</td> 
                </tr>
                <tr>
                    <th class="text-center" 
                        style="vertical-align:middle;">첨부파일</th>
                    <td colspan="3">
                        파일명.jpg
                    </td>
                </tr>
            </tbody>
            </table>
            
            <div class="row">
                <div class="col text-right mb-4">
               	<%
	            if (session.getAttribute("UserId") != null 
	            	&& session.getAttribute("UserId").toString().equals(dto.getId())) {
	            %>
		            
	                <button type="button" class="btn btn-info" 
	                	onclick="location.href='boardEdit.jsp?num=<%=dto.getNum()%>';">수정하기</button>
	                <button type="button" class="btn btn-danger" onclick="deletePost();">삭제하기</button> 
	            <%
	            }
	            %>
	                 <button type="button" class="btn btn-warning" onclick="location.href='boardList.jsp';">
	                    목록 보기
	                </button>
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