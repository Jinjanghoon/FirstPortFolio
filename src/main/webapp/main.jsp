<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/custom.js">

<title>JSP 게시판 웹 사이트</title>
</head>
<body>
<!-- 로그인 완료 된 사람의 정보를 담을수 있는 부분 시작 -->

	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>

<!-- 로그인 완료 된 사람의 정보를 담을수 있는 부분 끝 -->

<!-- 메인페이지 navbar 작업 시작 -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<!-- 접속하지 않은 경우만 접속하기 출력하기 시작 -->
			
			<%
				if(userID == null) {
			%>		
			
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			
			<%
				} else {
			%>
			
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			
			<%
				}
			%>
			
			<!-- 접속하지 않은 경우만 접속하기 출력하기 끝 -->
			
		</div>
	</nav>
<!-- 메인페이지 navbar 작업 끝 -->

<!-- 메인화면 꾸미는 부분 시작 -->
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>JSP 게시판 홈페이지입니다.</h1>
				<p>이 웹 사이트는 부트스트랩으로 제작한 JSP 웹 사이트 입니다.</p>
				<p class="main_view">구현 완료된 기능 목록</p>
				<div>
					<ul>
						<li>로그인기능, 로그아웃기능</li>
						<li>게시판 글작성 기능구현</li>
						<li>게시판 글삭제 기능구현</li>
						<li>게시판 글보기 기능구현</li>
						<li>게시판 글수정 기능구현</li>
						<li>게시판 페이징 기능구현</li>
					</ul>
				</div>
				
				<p><a class="btn btn-primary btn-pull" href="bbs.jsp" role="button">자세히 알아보기</a></p>
			</div>
		</div>
	</div>
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/nature1.jpg">
				</div>
				
				<div class="item">
					<img src="images/nature2.jpg">
				</div>
				
				<div class="item">
					<img src="images/nature3.jpg">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
			
		</div>
	</div>
	
	<!-- first.jsp로 이동하는 버튼 -->


<button class="scroll-btn"><a href="index.jsp" class="main_button">메인페이지로</a></button>
</script>
<!-- 메인화면 꾸미는 부분 끝 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>