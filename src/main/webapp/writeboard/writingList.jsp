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
boardWritingDAO dao = new boardWritingDAO(application);

Map<String, Object> param = new HashMap<String, Object>();


String b_flag = request.getParameter("b_flag");
param.put("b_flag", b_flag);
param.put("id",session.getAttribute("UserId"));
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if (searchWord != null) {
    param.put("searchField", searchField); 
    param.put("searchWord", searchWord); 
}
int totalCount = dao.selectCount(param);

/** 페이지 처리 start ********/

int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));

int totalPage = (int)Math.ceil((double)totalCount / pageSize); 

int pageNum = 1; 
String pageTemp = request.getParameter("pageNum");
if (pageTemp != null && !pageTemp.equals(""))
 	pageNum = Integer.parseInt(pageTemp); 

int start = (pageNum - 1) * pageSize;
int end = pageNum * pageSize;
param.put("start", start);
param.put("end", end);

/** 페이지 처리 end ********/

List<boardWritingDTO> boardLists;
if(b_flag.equals("wm")){
	//로그인 한 본인게시물만 노출됨...	
	boardLists = dao.selectListMyPage(param);
}
else{
	boardLists = dao.selectListPage(param);
}


//자원해제
dao.close(); 
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
<!DOCTYPE html>
<html lang="en">
<!-- 글쓰기& 공유하기 -->
<head>
    <meta charset="utf-8">
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
</head>
<style>

.color: #5a5a5a;

body{
	font-family: 'Poppins', sans-serif;
	font-weight: 300;
	font-size: 15px;
	line-height: 1.7;
	color: #c4c3ca;
	background-color: #f7f7f7;
	overflow-x: hidden;
}
</style>
<body>
    <%@ include file="./inc/top.jsp" %>
    <!-- Page Header Start -->
    <div class="container-fluid page-header">
        <h1 class="display-3 text-uppercase text-white mb-3"><%=boardTitle %></h1>
        <h3><%= pageNum %>/<small>(전체 :<%= totalPage %>)</small></h3>
        <div class="d-inline-flex text-white">
        </div>
    </div>
    <!-- Page Header Start -->

    <!-- Blog Start -->
	<div class="container-fluid py-6 px-5">
		<!--  <div class="row g-5">
            <div class="col-lg-8"> -->
		<!-- Blog Detail Start -->
			 <div class="row ">
                <!-- 검색부분 -->
                <form method="get">
                <input type="hidden" name="b_flag" value="${param.b_flag }"/>
                    <div class="input-group ms-auto" style="width: 400px;">
                        <select name="searchField" class="form-control" >
                            <option value="title">제목</option>
                            <option value="id">작성자</option>
                            <option value="content">내용</option>
                        </select>
                        <input type="text" name="searchWord" class="form-control" style="width: 150px;"/>
                        <div class="input-group-btn">
                            <button type="submit" class="btn btn-secondary" >
                                <i class="bi bi-search" style='font-size:20px'></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
		<div class="mb-5">
			<table class="table table-bordered table-hover table-striped">
				<colgroup>
					<col width="60px" />		
					<col width="*" />
					<col width="120px" />
					<col width="120px" />
					<col width="80px" />
					<col width="60px" />
				</colgroup>
				<thead>
					<tr style="background-color: rgb(133, 133, 133);"
						class="text-center text-white">
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>첨부</th>
					</tr>
				</thead>
				<tbody>
					<%
					if (boardLists.isEmpty()) {
					%>
					<tr>
						<td colspan="6" align="center">
							등록된 게시물이 없습니다
						</td>
					</tr>
					<%
					} else {
					int virtualNum = 0;
					int countNum = 0;
					
					
					for (boardWritingDTO dto : boardLists) {
						virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
						/*  virtualNum = totalCount--;    */
					%>
					<tr align="center">

						<td><%=virtualNum%></td>

						<td align="left"><a
							href="writingView.jsp?b_flag=<%=dto.getB_flag() %>&num=<%= dto.getNum() %>"><%= dto.getTitle() %></a>
						</td>

						<td align="center"><%=dto.getId()%></td>

						<td align="center"><%=dto.getPostdate()%></td>

						<td align="center"><%=dto.getVisitcount()%></td>

						<td class="text-center"><i class="bi bi-pin-angle-fill"
							style="font-size: 20px"></i></td>
					</tr>
					<%
					}
					}
					%>
				</tbody>
			</table>
		</div>
		
		<div class="row">
			<div class="col d-flex justify-content-center">
		       <!-- 로그인 판단 -->
				<c:if test="${not empty sessionScope.UserId }">
					<c:choose>
						<c:when test="${sessionScope.UserId eq 'admin' }">
						<!-- 로그인 아이디가 admin(관리자)일 경우 -->
				       		<button type="button" class="btn btn-primary"
							onclick="location.href='Wwrite.jsp?b_flag=<%=b_flag %>';">글쓰기</button>
						</c:when>
						<c:otherwise>
						<!-- 관리자가 아닌 타회원들일 경우 공지사항은 예외처리 -->
							<c:if test="${param.b_flag ne 'notice' }">
					       		<button type="button" class="btn btn-primary"
								onclick="location.href='Wwrite.jsp?b_flag=<%=b_flag %>';">글쓰기</button>
							</c:if>
						</c:otherwise>
					</c:choose>
				</c:if>
				
				<button type="button" class="btn btn-warning"
					onclick="location.href='writingList.jsp?b_flag=<%=b_flag %>';">목록보기</button>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col">
				<ul class="pagination justify-content-center">
					<% System.out.println("현재경로" + request.getRequestURI()); %>
					<%-- <%= BoardwritePage.pagingStr(totalCount, pageSize,
        				blockPage, pageNum, request.getRequestURI()) %> --%>
        				
        			<%= BoardwritePage.pagingStr(totalCount, pageSize,
        				blockPage, pageNum, request.getRequestURI(), b_flag) %>
        				
				</ul>
			</div>
		</div>
	</div>
                

          <!--   </div>
        </div> -->

    <!-- Blog End -->


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