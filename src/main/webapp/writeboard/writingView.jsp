<%@page import="memberwriting.DatglDTO"%>
<%@page import="memberwriting.DatglDAO"%>
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

String num = request.getParameter("num");

boardWritingDAO dao = new boardWritingDAO(application);

dao.updateVisitCount(num);

boardWritingDTO dto = dao.selectView(num);
request.setAttribute("img", dto.getSfile());
request.setAttribute("IDN", dto.getId());

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
function deletePost() {
    var confirmed = confirm("정말로 삭제하겠습니까?"); 
    if (confirmed) {
        var form = document.boardwriteFrm;      
        form.method = "post"; 
        form.action = "writingDeleteProcess.jsp"; 
        form.submit();         
    }
}
</script>  
</head>

<body>
    <%@ include file="./inc/top.jsp" %>

	
<div class="row">

		<div class="container-fluid py-6 px-5">
            <form name="boardwriteFrm">
            <input type="hid-den" name="num" value="<%= num %>" />
			<input type="hid-den" name="b_flag" value="<%= dto.getB_flag() %>" />
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
                        <%= dto.getId() %>
                    </td>
                    <th class="text-center" 
                        style="vertical-align:middle;">작성일</th>
                    <td>
                    	 <%= dto.getPostdate() %>
                    
                    </td>
                </tr>
                <tr>
                    <th class="text-center" 
                        style="vertical-align:middle;">조회수</th>
                    <td>
                       <%=dto.getVisitcount()%>
                    </td>
                    <th class="text-center" 
                        style="vertical-align:middle;">수정일</th>
                    <td>
                        <%
                    	System.out.println("수정일 : " + dto.getModifydate());
                    	 if (dto.getModifydate() != null) {
                    	 %>
                   	  		<%= dto.getModifydate() %>
                    	 <%
                    	 }
                    	 %>
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
                
                
                <c:if test="${not empty img}">
	                <tr>
	                    <th class="text-center" 
	                        style="vertical-align:middle;">첨부파일</th>
	                    <td colspan="3">
							<img src="../Uploads/<%= dto.getSfile() %>">
	                    </td>
	                </tr>
            	</c:if>
            	
            	
            </tbody>
            </table>

            <div class="row">
                <div class="col text-right mb-4">
                
                
                <c:if test="${not empty sessionScope.UserId }">
					<c:choose>
						<c:when test="${sessionScope.UserId eq 'admin' }">
				       		<button type="button" class="btn btn-danger" onclick="deletePost();">삭제하기</button> 
						
							<button type="button" class="btn btn-info" 
	                		onclick="location.href='writingEdit.jsp?b_flag=<%=dto.getB_flag()%>&num=<%= num %>';">수정하기</button>
						
						</c:when>
						<c:otherwise>
							<c:if test="${sessionScope.UserId eq IDN }">
							<button type="button" class="btn btn-danger" onclick="deletePost();">삭제하기</button> 
							
							<button type="button" class="btn btn-info" 
	                		onclick="location.href='writingEdit.jsp?b_flag=<%=dto.getB_flag()%>&num=<%= num %>';">수정하기</button>
							
							</c:if>
						</c:otherwise>
					</c:choose>
				</c:if>
               
	                 <button type="button" class="btn btn-warning" onclick="location.href='writingList.jsp?b_flag=${param.b_flag}';">
	                    목록 보기
	                </button>
                </div>
            </div>
            </form> 
        </div>
     </div>            
     
<c:if test="${ param.b_flag eq 'si' }">     
<div class="container d-flex justify-content-center py-6 px-5">
         <div class="form-group">
<form method="post"
action="DatglProcess.jsp">
<input type="hid-den" name="num" value="<%= num %>" />
<table class="table table-striped" 
   style="text-align: center; border: 1px solid #dddddd; width: 800px">
             <tr>
			<td>
         <input type="text" style="height: 100px; width: 100px;"
         class="form-control" placeholder="아이디."
         name="id">
      </td>                  		
      <td>
      <input type="text" style="height: 100px; width: 650px;"
         class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다."
            name="content">
         </td>
         <td class="">
            <div class="mt-2 me-3">
            <button class="btn btn-secondary" type="submit">댓글쓰기</button>
            </div>
            <div class="mt-1 mb-1 me-3">
            <button class="btn btn-dark" type="reset">다시쓰기</button>
            </div>
         </td>
      </tr>
   </table>
</form>
         
<%
DatglDAO daoo = new DatglDAO(application);
Map<String, Object> param = new HashMap<String, Object>();
List<DatglDTO> datglLists = daoo.selectListPage(param);
daoo.close();

if (datglLists.isEmpty()) {}
else {
	for (DatglDTO dtoo : datglLists) {
    	if(dtoo.getNumm().equals(num)){
%>
<table class="table table-striped py-6 px-5" style="text-align: left;
   border: 1px solid #dddddd; width: 800px">
   <tr>
      <td width="30%"><%= dtoo.getIdm() %></td>
      <td colspan="2"><%= dtoo.getPostdatem() %></td>
      <td style="text-align: right; color: gray;">
         <small><%= dtoo.getContentm().replace("\r\n", "<br/>") %></small></td>
   </tr>
   <tr>

   </tr>
</table>
<%
    	}
	}
}
%>
</div>
</div>  
</c:if>  


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