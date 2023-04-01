<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
<style type="text/css">
	a, a:hover {
		color: #000000;
		text-decoration: none;
	}
</style>
</head>
<body>
<!-- 로그인 완료 된 사람의 정보를 담을수 있는 부분 시작 -->

	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		//현재 게시판이 몇번째 페이지인지 알려주기 위한 부분
		
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="bbs.jsp">게시판</a></li>
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

<!-- 게시판 화면 시작 -->
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color:#eeeeee; text-align: center;">번호</th>
						<th style="background-color:#eeeeee; text-align: center;">제목</th>
						<th style="background-color:#eeeeee; text-align: center;">작성자</th>
						<th style="background-color:#eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<!-- 게시글이 출력되는 부분 시작 -->
					 <%
					 	BbsDAO bbsDAO = new BbsDAO();
					 	ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
					 	
					 	for(int i = 0; i< list.size(); i++) {
					 %>
					 	<tr>
							<td><%= list.get(i).getBbsID() %></td>
							<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID()%>"><%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
							<td><%= list.get(i).getUserID() %></td>
							<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11,13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분" %></td>
						</tr>
					 	
					 	
					 <%	
					 	}
					 %>
					<!-- 게시글이 출력되는 부분 끝 -->
					
				</tbody>
			</table>
			<!-- 페이지를 보여주는 부분 시작 -->
			<%
				if(pageNumber != 1) {
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arrow-left">이전</a>
			<%
				} if(bbsDAO.nextPage(pageNumber + 1)) {
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arrow-left">다음</a>
			<%
				}
			%>
			<!-- 페이지를 보여주는 부분 시작 -->
			
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	
<!-- 게시판 화면 끝 -->
<button class="scroll-btn"><a href="main.jsp" class="main_button">메인페이지로</a></button>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>