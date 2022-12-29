<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript">
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
        <%
String boardTitle = "";
if(request.getParameter("b_flag").equals("notice")){
	boardTitle = "공지사항";	
}
else if(request.getParameter("b_flag").equals("wm")){
	boardTitle = "나의 글";
} 
else if(request.getParameter("b_flag").equals("sm")){
	boardTitle = "글 공유";
}
else if(request.getParameter("b_flag").equals("si")){
	boardTitle = "일상 공유";
}
%>

<div class="row">
			<div class="container-fluid py-6 px-5">
            <h3><%=boardTitle %> - <small>글쓰기</small></h3>
            <form name="writeFrm" method="post" action="UploadProcess.jsp" enctype="multipart/form-data"
      			onsubmit="return validateForm(this);"> <!-- action="UploadProcess.jsp" enctype="multipart/form-data" -->
                <input type="hid-den" name="b_flag" value="${param.b_flag }" />
                <table class="table table-bordered">
                <colgroup>
                    <col width="20%"/>
	                <col width="30%"/>
	                <col width="20%"/>
	                <col width="*"/>
                </colgroup>
                <tbody>
                   <!--  <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">작성자</th>
                        <td>
                            <input type="text" name="name" class="form-control" />
                        </td>
                    </tr> -->
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">제목</th>
                        <td>
                            <input type="text" name="title" class="form-control" />
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;" >내용</th>
                        <td>
                            <textarea rows="5" name="content" class="form-control"></textarea>
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
                    <div class="col text-center mb-4">
                        <!-- 각종 버튼 부분 -->
                        <button type="submit" class="btn btn-info">작성 완료</button>
		                <button type="reset" class="btn btn-danger" >다시 입력</button>
		                <button type="button" class="btn btn-warning" onclick="location.href='writingList.jsp?b_flag=${param.b_flag }';">
		                    목록 보기</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    	<!-- 하단 인클루드 -->
    	<%@ include file="./inc/bottom.jsp" %>
</body>
</html>