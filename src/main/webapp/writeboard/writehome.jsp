<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="boardwriting.boardWritingDAO"%>
<%@page import="boardwriting.boardWritingDTO"%>
<%@page import="java.util.List"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Cookie[] cookies = request.getCookies();
boolean cookieExist = false;
for(Cookie c : cookies) {
    String cookieName = c.getName();        
	    if (cookieName.equals("writehome")) {
	    	cookieExist = true;
	    	break;
	    }
}
if(cookieExist == false){
	JSFunction.cookiePage(out);
}
boardWritingDAO dao = new boardWritingDAO(application);


Map<String, Object> param = new HashMap<String, Object>();


String b_flag = request.getParameter("b_flag");

param.put("b_flag","notice");

String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if (searchWord != null) {
    param.put("searchField", searchField); 
    param.put("searchWord", searchWord); 
}
int totalCount = dao.selectCount(param);


int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));

int totalPage = (int)Math.ceil((double)totalCount / pageSize); 

int pageNum = 1; 
String pageTemp = request.getParameter("pageNum");
if (pageTemp != null && !pageTemp.equals(""))
 	pageNum = Integer.parseInt(pageTemp); 

int start = (pageNum - 1) * pageSize;
int end = 5;
param.put("start", start);
param.put("end", end);


List<boardWritingDTO> boardLists = dao.selectListPage(param);

dao.close(); 

%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>씀</title>
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

<body>

	<!-- Navbar Start -->
	<%@ include file="./inc/top.jsp" %>
    <!-- Navbar End -->

    <!-- Carousel Start -->
    <div class="container-fluid p-0">
        <div id="header-carousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="img/Kakao.png" alt="Image">
                    <div class=" d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 900px;">
                            <!-- <a href="" class="btn btn-primary py-md-3 px-md-5 mt-2">Get A Quote</a> -->
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="img/KakaoTalk2.jpg" alt="Image">
                    <div class=" d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 900px;">
                            <!-- <a href="" class="btn btn-primary py-md-3 px-md-5 mt-2">Contact Us</a> -->
                        </div>
                    </div>
                </div>
                 <div class="carousel-item">
                    <img class="w-100" src="img/KakaoTalk1234.png" alt="Image">
                    <div class=" d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 900px;">
                            <!-- <a href="" class="btn btn-primary py-md-3 px-md-5 mt-2">Contact Us</a> -->
                        </div>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#header-carousel"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
    <!-- Carousel End -->


    <div class="container-fluid py-6 px-5">
        <div class="row g-5">
            <div class="col-lg-7">
                <div class="row gx-5 py-2">
                    <div class="col-sm-6 mb-2">
                        <div class="popular">
                        <table class="table table-bordered table-hover table-striped">
						<thead>
						 <a href="../writeboard/writingList.jsp?b_flag=sm"><h2>공지사항</h2></a>
							
						</thead>
						<tbody>
							<%
							if (boardLists.isEmpty()) {
							%>
							<tr>
								<td colspan="5" align="center">
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
							 	<ul class="clear">
		                          <li><a href="../writeboard/writingView.jsp?b_flag=<%=dto.getB_flag() %>&num=<%= dto.getNum() %>"><%= dto.getTitle() %></a></li>
		                        </ul>
							<%
							}
							}
							%>
						</tbody>
                        </table>
                        </div>
                    </div>
                    <div class="col-sm-6 mb-2">
                    </div>
                </div>
            </div>
            <div class="col-lg-5 pb-5" style="min-height: 400px;">
                <div class="position-relative h-100 ms-5">
                    <table class="table table-bordered table-hover table-striped">
						 <a href="../writeboard/writingmap.jsp?"><h2>오시는 길</h2></a>
							<div id="map" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy">
								<hr />
								<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.4042695562734!2d126.98244175131892!3d37.56909707969834!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2e8cf2ef38d%3A0x5a0649f4a68f5bd5!2z7Iqk7YOA6rOo65Oc!5e0!3m2!1sko!2skr!4v1672220404627!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
								</div>
                        </table>
                </div>
            </div>
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