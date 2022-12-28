<%@page import="boardwriting.boardWritingDTO"%>
<%@page import="boardwriting.boardWritingDAO"%>
<%@page import="utils.BoardwritePage"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
            </div>
		</div>
		
          <div id="map" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy">
			<h3>오시는 길</h3>
			<hr />
			<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.4042695562734!2d126.98244175131892!3d37.56909707969834!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2e8cf2ef38d%3A0x5a0649f4a68f5bd5!2z7Iqk7YOA6rOo65Oc!5e0!3m2!1sko!2skr!4v1672220404627!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
			</div>      

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