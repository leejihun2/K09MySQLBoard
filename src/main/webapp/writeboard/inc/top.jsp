<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

        <!-- Navbar Start -->
    <div class="container-fluid sticky-top bg-light-radial shadow-sm px-5 pe-lg-0" style="background-color:#f7f7f7; color: #5a5a5a;">
        <nav class="navbar navbar-expand-lg bg-light-radial navbar-dark py-3 py-lg-0" style="background-color:#f7f7f7; color: #5a5a5a;">
            <a href="../writeboard/writehome.jsp" class="navbar-brand">
                <h1 class="m-0 display-4  " style="color: #5a5a5a;"><i class="bi bi-pen text-primary me-2"></i>씀</h1>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto py-0">
                    <a href="../writeboard/writingList.jsp?b_flag=notice" style="color: #5a5a5a;" class="nav-item nav-link">공지사항</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" style="color: #5a5a5a;" data-bs-toggle="dropdown">글감</a>
                        <div class="dropdown-menu m-0">
                        	<% if (session.getAttribute("UserId") == null) { %>
                            <a href="../writeboard/writingList.jsp?b_flag=sm" style="color: #5a5a5a;" class="dropdown-item">글 공유</a>
                            <a href="../writeboard/writingList.jsp?b_flag=si" style="color: #5a5a5a;" class="dropdown-item">일상 공유</a>
                            <% } else { %>
                            <a href="../writeboard/writingList.jsp?b_flag=wm" style="color: #5a5a5a;" class="dropdown-item">나의 글</a>
                            <a href="../writeboard/writingList.jsp?b_flag=sm" style="color: #5a5a5a;" class="dropdown-item">글 공유</a>
                            <a href="../writeboard/writingList.jsp?b_flag=si" style="color: #5a5a5a;" class="dropdown-item">일상 공유</a>
                             <% } %>
                        </div>
                    </div>
                    
                    <% if (session.getAttribute("UserId") == null) { %>
                    
                    
                    
                    <a href="../writeSession/wLoginFrom.jsp" style="color: #5a5a5a;" class="nav-item nav-link">회원가입</a>
                    
                    <a href="../writeSession/wLoginFrom.jsp" style="color: #5a5a5a;" class="nav-item nav-link">로그인</a>
                    
                    <% } else { %>
                    
                    
                    <a href="../writeSession/wModifyFrom.jsp" style="color: #5a5a5a;" class="nav-item nav-link"><%= session.getAttribute("UserId")%> 님
                    <br><small>+정보수정</small> </a>
                    
                    <a href="../writeSession/Logout.jsp" style="color: #5a5a5a;" class="nav-item nav-link">로그아웃</a>
                    
                    
                    <% } %>
                    
                </div>
            </div>
        </nav>
    </div>
    <!-- Navbar End -->
    