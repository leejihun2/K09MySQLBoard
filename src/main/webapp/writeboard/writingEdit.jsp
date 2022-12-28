<%@page import="utils.JSFunction"%>
<%@page import="boardwriting.boardWritingDTO"%>
<%@page import="boardwriting.boardWritingDAO"%>
<%@page import="utils.BoardwritePage"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
//수정할 게시물의 일련번호를 파라미터로 받아온다.
String num = request.getParameter("num");
String b_flag = request.getParameter("b_flag");

boardWritingDAO dao = new boardWritingDAO(application); 
//게시물 조회를 위해 상세보기에서 작성했던 메서드를 그대로 이용한다.
boardWritingDTO dto = dao.selectView(num);
/*
본인이 작성한 글이 아니어도 URL패턴을 분석하면 수정페이지로 진입할 수 
있으므로, 진입전 본인확인을 추가로 하는것이 안전하다.
*/
String sessionId = session.getAttribute("UserId").toString();

//session영역에 저장된 로그인 아이디와 게시물에 저장된 아이디가 일치하는지 확인한다.
if (!sessionId.equals(dto.getId())) {      
    JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
    return;
}
//자원해제
dao.close(); 
%>   
<!DOCTYPE html>
<html>
<!-- 글쓰기& 공유하기 -->
<head>
    <meta charset="UTF-8">
    <title>글쓰기 & 공유하기</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

	

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
<script>
function validateForm(form) {  // 폼 내용 검증
    if (form.title.value == "") {
        alert("제목을 입력하세요.");
        form.title.focus();
        return false;
    }
    if (form.content.value == "") {
        alert("내용을 입력하세요.");
        form.content.focus();
        return false;
    }
}
</script>  
</head>

<body>
    <%@ include file="./inc/top.jsp" %>

	
<div class="row">

		<div class="container-fluid py-6 px-5">
            <form name="writeFrm" method="post" action="writingEditProcess.jsp"
      			onsubmit="return validateForm(this);"> <!-- enctype="multipart/form-data" -->
                <!--게시물의 일련번호를 서버로 전송하기 위해 hidden타입의 input태그가 필요하다. -->      
				<input type="hid-den" name="num" value="<%= num %>" />
				<!-- 파라미터를 받아서 히든 박스에 추가한다. -->
				<input type="hid-den" name="b_flag" value="<%= b_flag %>" />
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
                    
                    <c:if test="${ param.b_flag eq 'si'}">
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">첨부파일</th>
                        <td>
                            <input type="file" name="attachedFile" class="form-control" />
                        </td>
                    </tr>
                	</c:if>
                
                </tbody>
                </table>
                
                <div class="row">
                    <div class="col text-right mb-4">
                        <!-- 각종 버튼 부분 -->
                        <button type="submit" class="btn btn-info">작성 완료</button>
		                <button type="reset" class="btn btn-danger" >다시 입력</button>
		                <button type="button" class="btn btn-warning" onclick="location.href='writingList.jsp?b_flag=<%=b_flag %>';">
		                    목록 보기</button>
                    </div>
                </div>
            </form>
        </div>
     </div>



    <!-- Footer Start -->
     <%@ include file="./inc/bottom.jsp" %>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
    <script src="lib/isotope/isotope.pkgd.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>