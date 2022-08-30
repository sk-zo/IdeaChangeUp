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
</head>

<body id="page-top">
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
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
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
                <a class="nav-link collapsed" href="Mypage.jsp" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>마이페이지</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">좋아요/댓글</h6>
                        <a class="collapse-item" href="MyInfo">내가 쓴 글 보기</a>
                        <a class="collapse-item" href="#">좋아요 누른 글 보기</a>
                        <a class="collapse-item" href="#">댓글 쓴 글 보기</a>
                    </div>
                </div>
            </li>
            <!-- 나눔선 -->
            <hr class="sidebar-divider">

            <!-- 대주제2 -->
            <div class="sidebar-heading">
                마이페이지
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="PostCompetition.jsp" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>공모전 게시</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">개인정보 수정</h6>
                        <a class="collapse-item" href="editmember.jsp">개인정보 수정</a>
                        <a class="collapse-item" href="#">회원탈퇴</a>
                    </div>
                </div>
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
                    <!-- 검색 아이콘 -->
                    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="검색어를 입력하세요"
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

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
                                    <h6 class="m-0 font-weight-bold text-primary">추천공모전</h6>
                                    <form name="searchForm" id="searchForm" method="POST">
						<input type="hidden" name="crntMnuId" value="1047">
						<input type="hidden" name="pageNm" value="/service/idc/chlg">
						<input type="hidden" name="code" id="code" value="">
						<input type="hidden" name="sortClmn" id="sortClmn" value="2">
						<input type="hidden" name="pageTp" id="pageTp" value="">
						<input type="hidden" name="pageIndex" id="pageIndex" value="">
						
					</form>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                             
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
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
		<!-- view-wrap S -->
		
		<div id="challenge-wrap">
		<table>
			<tbody>
			<style>
			.btn-box{ width:100%; }
			.btn-box .btn-left {float:left; margin:0 0 10px 5px;}
			.btn-box .btn-right { float:right; margin:0 0 10px 5px;}
			ul { list-style: none;}
			
			</style>
			<%
					PostDTO post = (PostDTO)session.getAttribute("detail_post");
					ArrayList<PatentDTO> patents = (ArrayList<PatentDTO>)session.getAttribute("detail_patent");
					ArrayList<CommentDTO> comments = (ArrayList<CommentDTO>)session.getAttribute("comments");
					int index = 0;
					if (request.getParameter("index") != null) {
						index = Integer.parseInt(request.getParameter("index"));
					}
				%>
				<script type="text/javascript">
				function delete(frm) {
					frm.action="DeleteComment";
					frm.submit();
					return true;
				}
				
				function cancel(frm) {
					frm.action="CancelPost";
					frm.submit();
					return true;
				}
				</script>	

<div class="top-wrap">
     <div class="content">
	<div class="sub_title"><a href="EditPost.jsp?index=<%=index%>">수정</a>|<a href="DeletePost?post_num=<%=post.getNum()%>">삭제</a></div>
	<div class="upload">
	<div id="uploadForms" class="file_step">
		<!-- <span class="up_link_pop" id ="addedSingForm">※ 자료는 <span style="text-decoration: underline;font-weight: bold;color:#1064bd;">본인에게 저작권이 있는 자료</span>만 판매가능합니다.</span> -->
		<div class="tb_list2" id="singleForm" style="border-bottom: none;">
				<table cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr>
							<th>제목</th>
							<td>
								<%=post.getTitle() %>
							</td>
							
						</tr>
						<tr><th><br></th></tr>
						
						<tr>
							<th>작성자</th>
							<td>
								<%=post.getWriter() %>
							</td>
							
						</tr>
						<tr><th><br></th></tr>
		                <tr>
							<th>요약</th>
							<td>
								<%=post.getAbs() %>
							</td>
						</tr>
						<tr><th><br></th></tr>
		                <tr>
							<th>본문</th>
							<td>
								<%=post.getContent() %>
							</td>
						</tr>
						<tr><th><br></th></tr>
						<tr>
							<th>카테고리</th>
							<td>
								<%=post.getCategory() %>
							</td>
						</tr>
						<tr><th><br></th></tr>
		                <tr id="thumbnailDiv">
							<th class="check">대표이미지</th>
							<td>
								<div id="representative" style="float:left; padding: 5px 0 0; width: 150px; height: 130px; overflow: hidden;"><img src="/images/sell/no_img01.gif"></div>
								<div style="float:left; padding: 5px 0 0 15px;">
									<!--
									<div id="thumb">
										<div style="padding:10px;text-align:center;background-color: #fff0cd;border:solid 2px #000000;color:#696969;">
											Flash Player가 설치되지 않았을 때 페이지에 다음 화면을 노출합니다.
											대표 이미지 선택을 위해서 Adobe Flash player 의 설치가 필요합니다.<br/>
											<a href="http://www.adobe.com/go/getflashplayer" target="_blank"><img title="Get Adobe Flash player" alt="Get Adobe Flash player" src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" rel="xe_gallery" /></a>
										</div>
									</div> -->
									<a class="btn_s_w2" href="javascript:void(0);" onclick="$('#imgFileInput').click();return false;">파일찾기</a><br>
									<span class="up_txt1" style="margin-bottom:5px">
										<em>ㆍ</em>이미지 파일(jpg, gif, png)로 첨부 가능합니다.<br>
										<em>ㆍ</em>이미지 사이즈는 500 x 700 픽셀 이하, 파일 용량은 500k 이하로 입력 가능합니다.
									</span>
									<input type="file" style="visibility: hidden;" name="imgFileInput" id="imgFileInput" onchange="uploadRepresentativeImage.fileHandler(event);">
								</div>
							</td>
						</tr>
						
						<tr>
							
							<td>
								<span class="up_txt1" style="margin-bottom:5px">
								</span>
								<div id="myTagList" class="up_often_word">
			                        <div>
			                        	
				                    </div>
								</div>
							</td>
						</tr>
						
		                <tr>
							<th> 유사특허</th>
							<td>
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
		                    	<tr>
		                    		<td><b>출원번호</b></td>
		                    		<td><b>제목 요약</b></td>
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
		                </tr>
					</tbody>
				</table>
		
		
			<div class="sub_title"><h4>댓글</h4></div>
			<div class="tb_list2">
				<table cellpadding="0" cellspacing="0" border="0">
				<form action="UploadComment">
					<tbody>
						<tr>
							<td><textarea rows="3" cols="150" name="comment"></textarea> <input type="submit" value="등록"></td>
						</tr>
						<%
							for(int i=0; i<comments.size(); i++) {
								CommentDTO comment = comments.get(i);
						%>
							<tr>
								<td><b><%=comment.getWriter() %></b><br><br><%=comment.getContent() %></td>
								<td><a href="DeleteComment?comment_num=<%=comment.getComment_num()%>">삭제</a></td>
							</tr>
						<%} %>
					</tbody>
				</form>
				</table>
			</div>
		</div>
	</div>
</div>
</div>
 </div>

			<tr></tr>
			</tbody>
		</table>
	</div>
	</div>
                                    </div>
                                </div>
                            </div>
                        </div>
							</div>
            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">정말 로그아웃하시겠습니까?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">로그아웃하시면 계정정보가 사라집니다.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-primary" href="index.jsp">로그아웃</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>

</body>

</html>