<%@page import="Model.CommentDTO"%>
<%@page import="Model.PatentDTO"%>
<%@page import="Model.PostDTO"%>
<%@page import="Model.CompeteDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.MemberDTO"%>
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
    <title>추천공모전</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
        <style>@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
				*{font-family: 'Noto Sans KR', sans-serif;}</style>

    <!-- Custom styles for this template-->
    <link href="./css/sb-admin-2.css" rel="stylesheet">
    <link href="./css/min.css" rel="stylesheet">
    <link href="./css/spinners.css" rel="stylesheet">
    <link href="./css/yoosj.css" rel="stylesheet">
    <link href="./css/slick.css" rel="stylesheet">
    <link href="./css/sweetalert.css" rel="stylesheet">
    <link href="./css/commoonui.css" rel="stylesheet">
    <link href="./javas/slick.js" rel="javascript">
    <link href="./javas/commonui2.js" rel="javascript">
    <link href="./javas/genlnit.js" rel="javascript">
    <link href="./javas/jquery.slimscroll.js" rel="javascript">
    <link href="./javas/moment.min.js" rel="javascript">
    <link href="./css/post.css" rel="stylesheet">
</head>

<body id="page-top">
<script type="text/javascript">
	function search(frm) {
		frm.action="Search";
		frm.submit();
		return true;
	}
	
	function cancel(frm) {
		frm.action="CancelPost";
		frm.submit();
		return true;
	}
</script>
<% MemberDTO member = (MemberDTO)session.getAttribute("member"); %>
    <!-- Page Wrapper -->
        <% if(member != null) {%>
    <div id="wrapper">
        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <!-- Sidebar - Brand -->
            <a href="main.jsp"><img src="./img/로고2.png" style="width:200px; height:130px;">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">
                <%= member.getId()%> 님<br> 환영합니다.
               </div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="main.jsp">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>메인 페이지로 이동</span></a>
            </li>

            <!-- 나눔선 -->
            <hr class="sidebar-divider">

            <!-- 대주제1 -->
            <div class="sidebar-heading">
                기능
            </div>
            <!-- 소주제1 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" >
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>홈페이지 소개</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">카테고리</h6>
                        <a class="collapse-item" href="ReadBoard">카테고리1</a>
                        <a class="collapse-item" href="Post.jsp">글쓰기</a>
                    </div>
                </div>
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
                <a class="nav-link collapsed" href="Mypage.jsp" >
                    <i class="fas fa-fw fa-cog"></i>
                    <span>마이페이지</span>
                </a>
                
            </li>
            <!-- 나눔선 -->
            <hr class="sidebar-divider">

            <!-- 대주제2 -->
            <div class="sidebar-heading">
                마이페이지
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="Post.jsp">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>글쓰기</span>
                </a>
            </li>

            <!-- 나눔선 -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- 사이드바 닫는 아이콘 -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>
        </ul>
        <% }%>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- 메인화면 -->
            <div id="content">
                <!-- 상단 -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
					<% if(member != null) {%>
                    <!-- 로그인 시 사이드 토글바 아이콘 -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
					 <% }%>

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
						<% if(member != null) {%>
                        <!-- 알람아이콘 -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- 알람수 카운트 -->
                                <span class="badge badge-danger badge-counter">3+</span>
                            </a>
                            <!-- 알람 아이콘 선택시 -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    알림
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">2022-07-19</div>
                                        <span class="font-weight-bold">알림글1</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">2022-07-19</div>
                                        알림글2
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">2022-07-19</div>
                                        알림글3
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">모든 알람 확인하기</a>
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
                                    메세지 확인하기
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_1.svg"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">제안해주신 아이디어에 대해 제언하고자 합니다.</div>
                                        <div class="small text-gray-500">test123 · 58m</div>
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
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=member.getId() %></span>
                                <img class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    프로필 설정
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    회원정보 수정
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                   활동 내역
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    로그아웃
                                </a>
                            </div>
                        </li>
						<% } else {%>
						 <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="login.jsp" aria-haspopup="true" aria-expanded="false">
                                <img class="img-profile rounded-circle" src="img/undraw_profile.svg">
                            </a>
                         </li>
                         <% }%>
                    </ul>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
				<div id="content">
				<!-- 스크롤 베너 ]-->
				<div class="box"  style="position: relative;    width: 100%;    padding-right: 150px;    padding-left: 150px;">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">게시글 작성</h6>
                                    
                                </div>
                                <!-- Card Body -->
                                <div class="card-body"  style="height: 435vh;">
                                    <div class="chart-area" style="text-align:center;">
                                    <div class="chartjs-size-monitor">
                                    <div class="chartjs-size-monitor-expand">
                                    <div class=""></div>
                                    </div>
                                    <div class="chartjs-size-monitor-shrink">
                                    <div class=""  >
                                    </div></div></div>
                                   <div class="bg-type1" aria-hidden="false">
		
		<div id="challenge-wrap">
		<table>
			<tbody>
			<style>
			.btn-box{ width:100%; }
			.btn-box .btn-left {float:left; margin:0 0 10px 5px;}
			.btn-box .btn-right { float:right; margin:0 0 10px 5px;}
			ul { list-style: none;}
			
			</style>
			

<div class="content">
	<div class="upload">
	<div id="uploadForms" class="file_step">
		<!-- <span class="up_link_pop" id ="addedSingForm">※ 자료는 <span style="text-decoration: underline;font-weight: bold;color:#1064bd;">본인에게 저작권이 있는 자료</span>만 판매가능합니다.</span> -->
		<div class="tb_list2" id="singleForm" style="border-bottom: none;">
			<form method="post" action="Upload" style="margin:0">
				<table cellpadding="10" cellspacing="10" border="0">
					<tbody>
						<tr>
							<th>제목</th>
							<td>
								<!-- <span class="up_txt1"><em>ㆍ</em>자료의  내용을 대표할 수 있도록 구체적으로 기재하시기 바랍니다.</span> -->
								<%
								if (session.getAttribute("post") != null) {
															PostDTO post = (PostDTO)session.getAttribute("post");
								%>
								<input type="text" id="title" maxlength="200" name="title" class="up_in2" style="width:800px;" value=<%=post.getTitle()%>>
								<%
								} else {
								%>
								<input type="text" id="title" maxlength="200" name="title" class="up_in2" style="width:800px;" onfocus="Upload.changeTitle('title');" onblur="Upload.resetBox();Upload.checkTitleAllowChars(this.value, 'notice');Upload.checkDefaultIntro('titleBlur');" onchange="Upload.checkStringLength('title', 200, '제목은');">
								<%
								}
								%>
							</td>
						</tr>
						<tr></tr>
						<tr></tr>
						
		                <tr>
							<th>요약</th>
							<td>
								<%
								if (session.getAttribute("post") != null) {
															PostDTO post = (PostDTO)session.getAttribute("post");
								%>
								<textarea id="abstarct" rows="1" cols="100" name="abs" class="up_in2" style="width:800px; height: 150px; resize: none;" ><%=post.getAbs()%></textarea>
								<%
								} else {
								%>
								<textarea id="abstarct" rows="1" cols="100" name="abs" class="up_in2" style="width:800px; height: 150px; resize: none;" ></textarea>
								<%
								}
								%>
								
								<span id="titleErrorNotice" class="up_alert_txt" style="display: none;"></span>
							</td>
						</tr>
		                <tr>
							<th>본문</th>
							<td>
								<%
								if (session.getAttribute("post") != null) {
															PostDTO post = (PostDTO)session.getAttribute("post");
								%>
								<textarea rows="1" cols="100" name="content" class="up_in2" style="width:800px; height: 400px; resize: none;" ><%=post.getContent()%></textarea>
								<%
								} else {
								%>
								<textarea rows="1" cols="100" name="content" class="up_in2" style="width:800px; height: 400px; resize: none;" ></textarea>
								<%
								}
								%>
								<span id="titleErrorNotice" class="up_alert_txt" style="display: none;"></span>
							</td>
						</tr>
						<tr id="thumbnailDiv">
							<th>카테고리</th>
							<td style="text-align:left;">
								<!-- <div id="categoryShowButton" onclick="Upload.selectCategory('categoryPrimary','report','','리포트','toggle');" style="width:135px; cursor: pointer;" class="up_sel_w">
									<div class="btn_select" id="selectedCategoryTitle"></div> -->
								<select name="ipc" style="width:120px;">
									<option value=0>생활필수품</option>
									<option value=1>운수</option>
									<option value=2>화학</option>
									<option value=3>섬유</option>
									<option value=4>고정구조물</option>
									<option value=5>기계공학</option>
									<option value=6>물리</option>
									<option value=7>전기</option>
								</select>
							</td>
						</tr>
						
						<!-- <tr id="thumbnailDiv"  style="display:none;"> -->
						
		                <tr>
							<th> 유사특허</th>
							<td style="text-align:left;">
								<a class="link_pop" href="javascript:void(0);" id="tagGuide" onclick="Common.hcLogTrace(207, 471); Common.showHelp('tagGuide', 'tagGuideDiv', '/help/?p=tagGuide', 400, 300, '', 'left');"></a>
		                        <div class="fl up_guide" style="padding-left:10px; width: 200px;" >
		                        	<input type="button" value="검색" onclick="return search(this.form)" >
		                        </div>
		                        <div>
			                    </div>
							</td>
						</tr>
		                <tr>
		                    <th></th>
		                    <!-- 검색 결과 -->
		                    	
		                    <% if (session.getAttribute("patent") != null) {
		                    	ArrayList<PatentDTO> patents = (ArrayList<PatentDTO>)session.getAttribute("patent");%>
		                    	<tr>
		                    		<td><b>출원번호</b></td>
		                    		<td><b>제목 및 요약</b></td>
		                    		<td><b>유사도</b></td>
		                    	</tr>
		                    	<% for (int i=0; i<patents.size(); i++) {
		                    		PatentDTO patent = patents.get(i);
		                    	%>
		                    	
		                    	<tr>
		                    		<td><span><%=patent.getNum() %></span></td>
		                    		<td><b><%=patent.getTitle() %><br><br></b><span><%=patent.getAbs() %></span></td>
		                    		<td><span> <%=patent.getSim() %></span></td>
		                    	</tr>
		                    	
		                    <%	} %>
		                    <%} %>
		                    
		                </tr>
					</tbody>
				</table>
		
				<div id="singleFormButton" style="text-align:center;">
					<div class="up_info_txt" >기재하신 내용은 자료검수시, 관리자에 의해 조정될 수 있습니다.</div>
					<div class="btn_corm">
						<input type="submit" value="확인">  <input type="button" value="취소" onclick="return cancel(this.form)">  
					</div>
				</div>
		
		
				
			</form>
		</div>
	</div>
</div>
</div>
</body>
</html>