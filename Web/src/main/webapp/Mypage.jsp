<%@page import="java.util.HashMap"%>
<%@page import="Model.CompeteDTO"%>
<%@page import="Model.CommentDTO"%>
<%@page import="Model.MemberDTO"%>
<%@page import="Model.MyInfoDTO"%>
<%@page import="Model.PostDTO"%>
<%@page import="Model.LikeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>메인 페이지</title>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>

<body id="page-top">
<% MemberDTO member = (MemberDTO)session.getAttribute("member");
   		HashMap<Integer, String> member_map = new HashMap<Integer, String>();
		member_map.put(0, "관리자");
		member_map.put(1, "기업회원");
		member_map.put(2, "일반회원");
%>
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a href="main.jsp"><img src="./img/로고2.png" style="width:200px; height:130px;">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3"><%= member.getId()%> 님<br> 환영합니다. </div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="main.jsp">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>메인페이지로 이동</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">
			 <div class="sidebar-heading">
                기능
            </div>
            <!-- 소주제1 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>홈페이지 소개</span>
                </a>
            </li>
            <!-- 소주제2 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="ReadCompete">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>공모전 소개</span>
                </a>
            </li>
               <!-- 소주제3 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="ReadBoard">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>게시글 보기</span>
                </a>
            </li>
            <!-- 소주제4 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="MyInfo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>마이페이지</span>
                </a>
            </li>
			<hr class="sidebar-divider">
            <!-- Heading -->
            <div class="sidebar-heading">
                Mypage
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="MyPost">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>내가 쓴 글</span>
                </a>
            </li>
			<li class="nav-item">
                <a class="nav-link collapsed" href="MyLike">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>좋아요 글</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="MyComment">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>내가 쓴 댓글</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="MyCompete">
                    <i class="fas fa-fw fa-cog"></i>
                    <%if (member.getGrade() == 2) {%>
                    <span>참여한 공모전</span> <%} %>
                    <%if (member.getGrade() == 1) {%>
                    <span>게시한 공모전</span> <%} %>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="EditMember.jsp">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>회원정보수정</span>
                </a>

            <!-- Divider -->

            <!-- Heading -->
            

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">


        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <form class="form-inline">
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </form>

                    <!-- Topbar Search 검색-->
                   
                    

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter">3+</span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2019</div>
                                        $290.29 has been deposited into your account!
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2019</div>
                                        Spending Alert: We've noticed unusually high spending for your account.
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter">7</span>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    Message Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_1.svg"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                            problem I've been having.</div>
                                        <div class="small text-gray-500">Emily Fowler · 58m</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_2.svg"
                                            alt="...">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">I have the photos that you ordered last month, how
                                            would you like them sent to you?</div>
                                        <div class="small text-gray-500">Jae Chun · 1d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_3.svg"
                                            alt="...">
                                        <div class="status-indicator bg-warning"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Last month's report looks great, I am very happy with
                                            the progress so far, keep up the good work!</div>
                                        <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                            told me that people say this to all dogs, even if they aren't good...</div>
                                        <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                                <img class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="LogoutService" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
				<%MyInfoDTO myinfo = (MyInfoDTO)session.getAttribute("myinfo");%>
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">마이페이지</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                    	<table>
                    		<tr>
	                    		<td>
			                        <div class="card-header py-3">
			                        	<div class="m-0 font-weight-bold text-primary">아이디: <%=member.getId()%> <br>회원등급: <%=member_map.get(member.getGrade()) %> </div>
			                        </div>
		                        </td>
	                        </tr>
	                        <tr>
		                        <td>
			                        <div class="card-header py-3">
										<div class="m-0 font-weight-bold text-primary"><span style="border-right:1px solid; padding-right:5px; padding-left:5px;">내가 쓴 글: <%=myinfo.getMypost() %></span>   <span style="border-right:1px solid; padding-right:5px; padding-left:5px;">좋아요 글: <%=myinfo.getLikepost() %></span>   <span style="border-right:1px solid; padding-right:5px; padding-left:5px;">내가 쓴 댓글: <%=myinfo.getMycomment() %></span>   
										<%if(member.getGrade()==2){ %><span style="border-right:1px solid; padding-right:5px; padding-left:5px;">참여한 공모전: <%=myinfo.getMycompete() %></span><%} %><%if(member.getGrade()==1){ %><span style="border-right:1px solid; padding-right:5px; padding-left:5px;">게시한 공모전: <%=myinfo.getMycompete() %></span><%} %></div>
			                        </div>
		                        </td>
	                        </tr>
                        </table>
                        <%if (request.getParameter("index") == null) {
									} else {%>
						<% if (request.getParameter("index").equals("4")) {%>
						<div id="challenge-wrap">
		<%
			ArrayList<CompeteDTO> competes = (ArrayList<CompeteDTO>)session.getAttribute("competes");
			ArrayList<String []> imgs = (ArrayList<String []>)session.getAttribute("files");
			
			HashMap<Integer, String> cate_map = new HashMap<Integer, String>();
			cate_map.put(0, "생활필수품");
			cate_map.put(1, "운수");
			cate_map.put(2, "화학");
			cate_map.put(3, "섬유");
			cate_map.put(4, "고정구조물");
			cate_map.put(5, "가계공학");
			cate_map.put(6, "물리");
			cate_map.put(7, "전기");
			%>
			<% if (member.getGrade() == 2) {
				ArrayList<String> submits = (ArrayList<String>)session.getAttribute("submits");
				%>
			<div id="content">
				<div class="challenge-list-area">
					<div class="challenge-list-wrap card" data-list="card"  style="text-align: left;">
					</div>
					<ul class="list-box">
						<%for (int i=0; i<competes.size(); i++) {
							CompeteDTO compete = competes.get(i);
							String[] img = imgs.get(i);
							String submit = submits.get(i);%>
						<li style="white-space:nowrap; display: inline-block; position: relative;   zoom: 1; *display: inline;
    					 padding: 50px 15px 15px 15px; margin:20px; width: 270px;min-height: 380px;vertical-align: top;border-bottom: none;">
							<div class="img" onclick="goDetailPage('KPOIP_IDC_20220623100352649');" style="position: relative; padding: 0px 0px 0px 0px;min-height: 100%;
   									 font-size: 0; background: #eaecef; box-sizing: border-box; overflow: hidden;">
								<img id="imgPreview" src="img/competition/<%=compete.getNum() %>/<%=img[2] %>" alt="" style=" position: relative;
    							   padding: 0px 0px 0px 0px; height: 147px; font-size: 0;  background: #eaecef;  box-sizing: border-box; overflow: hidden;">
								<!-- D-Day 라벨 표시. 참여신청 기간 때만 표시.-->
								<span class="tag-group" style="left:auto; right: 10px;">
									<em class="step01" style="background: #666;">D-30 </em>
								</span>
							</div>
							<div class="category" style="text-overflow:ellipsis; overflow:hidden;" title="기타"><%=cate_map.get(compete.getCategory()) %></div>
							<!-- 아이디어 참여 기간    -->
							<!--  전문가 대기중   -->
								<a href="LoadCompete?index=<%=i %>" title="<%=compete.getTitle() %>" style="width: 100%; text-overflow:ellipsis; overflow:hidden;  display: block;
							    margin-bottom: 10px;  color: #333;  font-size: 16px; text-overflow: ellipsis;
							    overflow: hidden;   white-space: nowrap;  word-break: normal;" class="tit ">
			                   		<%=compete.getTitle() %>
								</a>
								<div class="cmpny" style="font-size:14px;">
									<p><span> 아이디어등록 마감일 &nbsp;2022-08-19</span></p>
									<p>기획재정부&nbsp; |  &nbsp; 등록일 &nbsp; <%=compete.getPost_time() %></p>
								</div>
								<div class="info">
									<span class="price" style="    display: block; margin-top: 20px;  padding: 0;height: 40px;line-height: 40px;
								    font-size: 18px; text-align: right;  border-top: solid 1px #ccc; background: none;"><em style="font-size: 18px; color: #003567;">
								    <%=compete.getPrice() %> </em> 원</span>
									
								</div>
								<div class="info">
									<span class="price" style="    display: block; margin-top: 20px;  padding: 0;height: 40px;line-height: 40px;
								    font-size: 12px; text-align: right;  border-top: solid 1px #ccc; background: none;"><em style="font-size: 18px; color: #003567;">
								    <a style="font-size:14px;" href="http://localhost:10011/Test/img/competition/<%=compete.getNum()%>/submit/<%=submit%>"><%=submit %></a> </em></span>
									
								</div>
						</li><%}} %>
						<% if (member.getGrade() == 1) {
				ArrayList<ArrayList<String[]>> submits = (ArrayList<ArrayList<String[]>>)session.getAttribute("submits");
				%>
			<div id="content">
				<div class="challenge-list-area">
					<div class="challenge-list-wrap card" data-list="card"  style="text-align: left;">
					</div>
					<ul class="list-box">
						<%for (int i=0; i<competes.size(); i++) {
							CompeteDTO compete = competes.get(i);
							String[] img = imgs.get(i);
							ArrayList<String[]> submit = submits.get(i);%>
						<li style="white-space:nowrap; display: inline-block; position: relative;   zoom: 1; *display: inline;
    					 padding: 50px 15px 15px 15px; margin:20px; width: 800px; min-height: 380px;vertical-align: top;border-bottom: 2px solid;">
							<div class="img" onclick="goDetailPage('KPOIP_IDC_20220623100352649');" style="position: relative; padding: 0px 0px 0px 0px;min-height: 100%;
   									 font-size: 0; background: #eaecef; box-sizing: border-box; overflow: hidden;">
								<img id="imgPreview" src="img/competition/<%=compete.getNum() %>/<%=img[2] %>" alt="" style=" position: relative;
    							   padding: 0px 0px 0px 0px; height: 147px; font-size: 0;  background: #ffffff;  box-sizing: border-box; overflow: hidden;">
								<!-- D-Day 라벨 표시. 참여신청 기간 때만 표시.-->
								<span class="tag-group" style="left:auto; right: 10px;">
									<em class="step01" style="background: #666;">D-30 </em>
								</span>
							</div>
							<div class="category" style="text-overflow:ellipsis; overflow:hidden;" title="기타"><%=cate_map.get(compete.getCategory()) %></div>
							<!-- 아이디어 참여 기간    -->
							<!--  전문가 대기중   -->
								<a href="LoadCompete?index=<%=i %>" title="<%=compete.getTitle() %>" style="width: 100%; text-overflow:ellipsis; overflow:hidden;  display: block;
							    margin-bottom: 10px;  color: #333;  font-size: 16px; text-overflow: ellipsis;
							    overflow: hidden;   white-space: nowrap;  word-break: normal;" class="tit ">
			                   		<%=compete.getTitle() %>
								</a>
								<div class="cmpny" style="font-size:14px;">
									<p><span> 아이디어등록 마감일 &nbsp;2022-08-19</span></p>
									<p>기획재정부&nbsp; |  &nbsp; 등록일 &nbsp; <%=compete.getPost_time() %></p>
								</div>
								<div class="info">
									<span class="price" style="    display: block; margin-top: 20px;  padding: 0;height: 40px;line-height: 40px;
								    font-size: 18px; text-align: right;  border-top: solid 1px #ccc; background: none;"><em style="font-size: 18px; color: #003567;">
								    상금: <%=compete.getPrice() %> </em> 원</span><br><p>제출 : <%=submit.size() %></p>
									
								</div>
								<div class="info">
								<table style="width:750px;">
									<tr style="border-bottom:1px solid;">
										<th>제출자</th>
										<th style="text-align:right">제출파일</th>
									</tr>
									<% for (int j=0; j<submit.size(); j++){ 
									String[] sub = submit.get(j);%>
									<tr>
									<td><span><%=sub[0] %></span></td>
									<td style="text-align:right"><a style="font-size:14px;" href="http://localhost:10011/Test/img/competition/<%=compete.getNum()%>/submit/<%=sub[1]%>"><%=sub[1] %></a></td>
								    
								    </tr>
									
								<%} %>
								</table>
								</div>
						</li><%} %>
						<%} %>
							
					</ul>
					
				</div>
			
		</div>
	</div><%} %>
						
						
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    
                                    
                                    <tbody>
                                    
									<% if (request.getParameter("index").equals("1")) {%>
										<thead>
                                        <tr>
                                            <th>제목</th>
                      	                    <th>작성시간</th>
                                            <th></th>
                                        </tr>
                                    	</thead>
										<%ArrayList<PostDTO> mypost = (ArrayList<PostDTO>)session.getAttribute("mypost");
										for (int i=0; i<mypost.size(); i++) {
											PostDTO post = mypost.get(i);%>
                                        <tr>
                                            <td><h5><%= post.getTitle()%></h5></td>
                                            <td><%=post.getPost_time() %></td>
                                            <td><a href="MyDetail?m=1&index=<%=i%>">게시글로 이동</a></td>
                                        </tr>
                                    <%} %>
                                    <%} %>
                                    
									<% if (request.getParameter("index").equals("2")) {%>
										<thead>
	                                        <tr>
	                                            <th>제목</th>
	                                            <th>작성시간</th>
	                                            <th></th>
	                                        </tr>
                                    	</thead>
										<%ArrayList<PostDTO> likepost = (ArrayList<PostDTO>)session.getAttribute("likepost");
										for (int i=0; i<likepost.size(); i++) {
											PostDTO post = likepost.get(i);%>
                                        <tr>
                                            <td><h5><%= post.getTitle()%></h5></td>
                                            <td><%=post.getPost_time() %></td>
                                            <td><a href="MyDetail?m=1&index=<%=i%>">게시글로 이동</a></td>
                                        </tr>
                                    <%}} %>
                                    
                                    <% if (request.getParameter("index").equals("3")) {%>
                                    	<thead>
                                        <tr>
                                            <th>댓글</th>
                                            <th>작성시간</th>
                                        </tr>
                                    	</thead>
										<%ArrayList<CommentDTO> mycomment = (ArrayList<CommentDTO>)session.getAttribute("mycomment");
										for (int i=0; i<mycomment.size(); i++) {
											CommentDTO comment = mycomment.get(i);%>
										<tr>
											
											<td><%= comment.getContent() %></td>
											<td><%= comment.getComment_time() %></td>
											<th><a href="MyDetail?m=3&index=<%=i%>">게시글로 이동</a></th>
										</tr>
                                    <%}}} %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="LogoutService">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>

</body>

</html>