<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<style></style>
</head>
<body>
<% MemberDTO member = (MemberDTO)session.getAttribute("member"); %>
	<div id="top_left">
		<!-- 로그인된 상태 -->
		<% if(member != null) {
			if(member.getId().equals("admin")){%>
			<a href="">회원정보 관리</a>
		<%} %>	
		<a href="UpdateMember.jsp">개인정보 수정</a>
		<a href="logoutService">로그아웃</a>
		<%}else{%>
		<a href="login.jsp">로그인</a>
		<a href="join.jsp">회원가입</a>
		<%} %>
	</div>
	<div id="top">
	<a href="">사이트소개</a> | <a href="">게시판</a> | <a href="MyInfo">마이페이지</a>
	</div>
	<div id="banner">
	 배너
	</div>
	<div id="recommend_idea">
	추천 아이디어
	</div>
	<div id="ranking">
	랭킹
	</div>
	<div>
	<a href="Post.jsp">글쓰기</a>
	</div>
	<div>
	<a href="ReadBoard">게시판</a>
	</div>
	<div>
	<a href="PostCompetition.jsp">공모전</a>
	</div>
</body>
</html>