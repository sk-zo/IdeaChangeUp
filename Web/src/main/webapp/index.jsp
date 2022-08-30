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
    <title>메인 화면</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
        <style>@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
				*{font-family: 'Noto Sans KR', sans-serif;}</style>

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.css" rel="stylesheet">
    <link href="css/min.css" rel="stylesheet">
    <link href="css/spinners.css" rel="stylesheet">
    <link href="css/yoosj.css" rel="stylesheet">
    <link href="css/slick.css" rel="stylesheet">
    <link href="css/sweetalert.css" rel="stylesheet">
    <link href="css/commoonui.css" rel="stylesheet">
    <link href="javas/slick.js" rel="javascript">
    <link href="javas/commonui2.js" rel="javascript">
    <link href="javas/genlnit.js" rel="javascript">
    <link href="javas/jquery.slimscroll.js" rel="javascript">
    <link href="javas/moment.min.js" rel="javascript">
</head>

<body id="page-top">
<% MemberDTO member = (MemberDTO)session.getAttribute("member"); %>
    <!-- Page Wrapper -->
        <% if(member != null) {%>
    <div id="wrapper">
        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
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
                <a class="nav-link" href="index.jsp">
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
                <a class="nav-link collapsed" href="#">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>공모전 소개</span>
                </a>
            </li>
               <!-- 소주제3 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="Board2.jsp">
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
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>회원정보 관리</span>
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
				<div class="mainbenner-wrap">
					<p style="margin: 16px 0px; display: block; overflow-wrap: break-word; text-align: center;">
					<img src="img/banner_20220630040700024.png" style="width: auto;">
					</p>
					<div class="category">
						<ul style="list-style:none;">
							<li>
								<span class="tit">오늘의 도전과제</span>
								<a href=""></a>
							</li>
							<li>
								<span class="tit">아이디어 소싱</span>
								<a href=""></a>
							</li>
							<li>
								<span class="tit">아이디어 나눔</span>
								<a href=""></a>
							</li>
							<li class="community">
								<span class="tit">커뮤니티</span>
								<a href=""></a>
							</li>
						</ul>
					</div>
				</div>
				
				<!--[ 스크롤 베너 -->
				<style type="text/css">
					.main_notice {max-width:1170px; margin:-40px auto 50px; background:#f4f8fb;}
					.main_notice .list {border:1px solid #dddfe0; overflow:hidden;}
					.main_notice .box {position:relative; padding:20px 100px 20px 20px; font-size:16px; color:#003567; line-height:28px;}
					.main_notice .box .day {position:absolute; top:20px; right:20px;}
					.main_notice .box a {display:block; color:#003567; text-overflow:ellipsis; white-space:nowrap; overflow:hidden;}
					@media screen and (max-width:1025px){
						.main_notice {margin:-20px 1.5% 30px;}
					}
				</style>
				<script type="text/javascript">	
					$(document).ready(function() {
						$('.main_notice .list').slick({
						  	autoplay: true,
						  	autoplaySpeed: 4000,
							arrows : false,
							vertical : true
						});
					});
				</script>
				<div class="main_notice">
					<div class="list slick-initialized slick-slider slick-vertical"><div class="slick-list draggable" style="height: 71px;"><div class="slick-track" style="opacity: 1; height: 1491px; transform: translate3d(0px, -284px, 0px);"><div class="slick-slide slick-cloned" data-slick-index="-1" aria-hidden="true" style="width: 307px;" tabindex="-1"><div><div class="box" style="width: 100%; display: inline-block;">
								<a title="아이디어로(IDEARO)-혁신지제품(F2) 추천 연계 공지" href="">
									[공지사항]&nbsp;아이디어로(IDEARO)-혁신지제품(F2) 추천 연계 공지
								</a>
								<span class="day">2022.07.07</span>
							</div></div></div><div class="slick-slide" data-slick-index="0" aria-hidden="true" style="width: 307px;" tabindex="-1"><div><div class="box" style="width: 100%; display: inline-block;">
								<a title="[공고] 미래한국 아이디어 공모전 개최 기념 SNS 공유 이벤트(~22.08.06)" href="/idearo/service/itr/evt/eventMngtDetail.do;jsessionid=CB002C27E11CF9E51E92785C8B015A41.was1?eventMngtId=EVENT_00000000000331">
									[이벤트/행사]&nbsp;[공고] 미래한국 아이디어 공모전 개최 기념 SNS 공유 이벤트(~22.08.06)
								</a>
								<span class="day">2022-07-12</span>
							</div></div></div><div class="slick-slide" data-slick-index="1" aria-hidden="true" style="width: 307px;" tabindex="-1"><div><div class="box" style="width: 100%; display: inline-block;">
								<a title="[공고] 2022 미래한국 아이디어 공모전을 시작합니다! ( ~ 22. 08. 19.)" href="/idearo/service/itr/evt/eventMngtDetail.do;jsessionid=CB002C27E11CF9E51E92785C8B015A41.was1?eventMngtId=EVENT_00000000000321">
									[이벤트/행사]&nbsp;[공고] 2022 미래한국 아이디어 공모전을 시작합니다! ( ~ 22. 08. 19.)
								</a>
								<span class="day">2022-06-29</span>
							</div></div></div><div class="slick-slide" data-slick-index="2" aria-hidden="true" style="width: 307px;" tabindex="-1"><div><div class="box" style="width: 100%; display: inline-block;">
								<a title="[종료] 공공기관 혁신 아이디어 공모전 개최개념 1일 1리뷰 인증이벤트" href="/idearo/service/itr/evt/eventMngtDetail.do;jsessionid=CB002C27E11CF9E51E92785C8B015A41.was1?eventMngtId=EVENT_00000000000311">
									[이벤트/행사]&nbsp;[종료] 공공기관 혁신 아이디어 공모전 개최개념 1일 1리뷰 인증이벤트
								</a>
								<span class="day">2022-06-13</span>
							</div></div></div><div class="slick-slide slick-current slick-active" data-slick-index="3" aria-hidden="false" style="width: 307px;"><div><div class="box" style="width: 100%; display: inline-block;">
								<a title="[종료] 아이디어로 카카오톡 채널 친구추가 이벤트" href="/idearo/service/itr/evt/eventMngtDetail.do;jsessionid=CB002C27E11CF9E51E92785C8B015A41.was1?eventMngtId=EVENT_00000000000302">
									[이벤트/행사]&nbsp;[종료] 아이디어로 카카오톡 채널 친구추가 이벤트
								</a>
								<span class="day">2022-06-02</span>
							</div></div></div><div class="slick-slide" data-slick-index="4" aria-hidden="true" style="width: 307px;" tabindex="-1"><div><div class="box" style="width: 100%; display: inline-block;">
								<a title="[공고] 아이디어 올림픽, 전국민 아이디어 경진대회(2회차) 안내" href="/idearo/service/itr/evt/eventMngtDetail.do;jsessionid=CB002C27E11CF9E51E92785C8B015A41.was1?eventMngtId=EVENT_00000000000301">
									[이벤트/행사]&nbsp;[공고] 아이디어 올림픽, 전국민 아이디어 경진대회(2회차) 안내
								</a>
								<span class="day">2022-06-02</span>
							</div></div></div><div class="slick-slide" data-slick-index="5" aria-hidden="true" style="width: 307px;" tabindex="-1"><div><div class="box" style="width: 100%; display: inline-block;">
								<a title="※[오늘의 도전과제] 팀으로 참여하는 방법 공지※" href="/idearo/service/cmn/nct/CmnNoticeDetail.do;jsessionid=CB002C27E11CF9E51E92785C8B015A41.was1?nctId=NOT_00000000000000001770&amp;pageIndex=1&amp;crntMnuId=CUST_1&amp;pageNm=Customer">
									[공지사항]&nbsp;※[오늘의 도전과제] 팀으로 참여하는 방법 공지※
								</a>
								<span class="day">2022.03.03</span>
							</div></div></div><div class="slick-slide" data-slick-index="6" aria-hidden="true" style="width: 307px;" tabindex="-1"><div><div class="box" style="width: 100%; display: inline-block;">
								<a title="[공지] 아이디어로 카카오톡 채널 친구추가 이벤트 당첨자 발표" href="/idearo/service/cmn/nct/CmnNoticeDetail.do;jsessionid=CB002C27E11CF9E51E92785C8B015A41.was1?nctId=NOT_00000000000000001990&amp;pageIndex=1&amp;crntMnuId=CUST_1&amp;pageNm=Customer">
									[공지사항]&nbsp;[공지] 아이디어로 카카오톡 채널 친구추가 이벤트 당첨자 발표
								</a>
								<span class="day">2022.07.13</span>
							</div></div></div><div class="slick-slide" data-slick-index="7" aria-hidden="true" style="width: 307px;" tabindex="-1"><div><div class="box" style="width: 100%; display: inline-block;">
								<a title="[공지] 공모전 아이디어 보호 가이드라인 안내(2022.07)" href="/idearo/service/cmn/nct/CmnNoticeDetail.do;jsessionid=CB002C27E11CF9E51E92785C8B015A41.was1?nctId=NOT_00000000000000001980&amp;pageIndex=1&amp;crntMnuId=CUST_1&amp;pageNm=Customer">
									[공지사항]&nbsp;[공지] 공모전 아이디어 보호 가이드라인 안내(2022.07)
								</a>
								<span class="day">2022.07.11</span>
							</div></div></div><div class="slick-slide" data-slick-index="8" aria-hidden="true" style="width: 307px;" tabindex="-1"><div><div class="box" style="width: 100%; display: inline-block;">
								<a title="[기간연장] 공공기관과 함께하는 혁신 아이디어 공모전 기간 연장 공지(~ 2022. 7. 31.)" href="/idearo/service/cmn/nct/CmnNoticeDetail.do;jsessionid=CB002C27E11CF9E51E92785C8B015A41.was1?nctId=NOT_00000000000000001970&amp;pageIndex=1&amp;crntMnuId=CUST_1&amp;pageNm=Customer">
									[공지사항]&nbsp;[기간연장] 공공기관과 함께하는 혁신 아이디어 공모전 기간 연장 공지(~ 2022. 7. 31.)
								</a>
								<span class="day">2022.07.08</span>
							</div></div></div><div class="slick-slide" data-slick-index="9" aria-hidden="true" style="width: 307px;" tabindex="-1"><div><div class="box" style="width: 100%; display: inline-block;">
								<a title="아이디어로(IDEARO)-혁신지제품(F2) 추천 연계 공지" href="/idearo/service/cmn/nct/CmnNoticeDetail.do;jsessionid=CB002C27E11CF9E51E92785C8B015A41.was1?nctId=NOT_00000000000000001960&amp;pageIndex=1&amp;crntMnuId=CUST_1&amp;pageNm=Customer">
									[공지사항]&nbsp;아이디어로(IDEARO)-혁신지제품(F2) 추천 연계 공지
								</a>
								<span class="day">2022.07.07</span>
							</div></div></div><div class="slick-slide slick-cloned" data-slick-index="10" aria-hidden="true" style="width: 307px;" tabindex="-1"><div><div class="box" style="width: 100%; display: inline-block;">
								<a title="[공고] 미래한국 아이디어 공모전 개최 기념 SNS 공유 이벤트(~22.08.06)" href="/idearo/service/itr/evt/eventMngtDetail.do;jsessionid=CB002C27E11CF9E51E92785C8B015A41.was1?eventMngtId=EVENT_00000000000331">
									[이벤트/행사]&nbsp;[공고] 미래한국 아이디어 공모전 개최 기념 SNS 공유 이벤트(~22.08.06)
								</a>
								<span class="day">2022-07-12</span>
							</div></div></div><div class="slick-slide slick-cloned" data-slick-index="11" aria-hidden="true" style="width: 307px;" tabindex="-1"><div><div class="box" style="width: 100%; display: inline-block;">
								<a title="[공고] 2022 미래한국 아이디어 공모전을 시작합니다! ( ~ 22. 08. 19.)" href="/idearo/service/itr/evt/eventMngtDetail.do;jsessionid=CB002C27E11CF9E51E92785C8B015A41.was1?eventMngtId=EVENT_00000000000321">
									[이벤트/행사]&nbsp;[공고] 2022 미래한국 아이디어 공모전을 시작합니다! ( ~ 22. 08. 19.)
								</a>
								<span class="day">2022-06-29</span>
							</div></div></div><div class="slick-slide slick-cloned" data-slick-index="12" aria-hidden="true" style="width: 307px;" tabindex="-1"><div><div class="box" style="width: 100%; display: inline-block;">
								<a title="[종료] 공공기관 혁신 아이디어 공모전 개최개념 1일 1리뷰 인증이벤트" href="/idearo/service/itr/evt/eventMngtDetail.do;jsessionid=CB002C27E11CF9E51E92785C8B015A41.was1?eventMngtId=EVENT_00000000000311">
									[이벤트/행사]&nbsp;[종료] 공공기관 혁신 아이디어 공모전 개최개념 1일 1리뷰 인증이벤트
								</a>
								<span class="day">2022-06-13</span>
							</div></div></div><div class="slick-slide slick-cloned" data-slick-index="13" aria-hidden="true" style="width: 307px;" tabindex="-1"><div><div class="box" style="width: 100%; display: inline-block;">
								<a title="[종료] 아이디어로 카카오톡 채널 친구추가 이벤트" href="/idearo/service/itr/evt/eventMngtDetail.do;jsessionid=CB002C27E11CF9E51E92785C8B015A41.was1?eventMngtId=EVENT_00000000000302">
									[이벤트/행사]&nbsp;[종료] 아이디어로 카카오톡 채널 친구추가 이벤트
								</a>
								<span class="day">2022-06-02</span>
							</div></div></div><div class="slick-slide slick-cloned" data-slick-index="14" aria-hidden="true" style="width: 307px;" tabindex="-1"><div><div class="box" style="width: 100%; display: inline-block;">
								<a title="[공고] 아이디어 올림픽, 전국민 아이디어 경진대회(2회차) 안내" href="/idearo/service/itr/evt/eventMngtDetail.do;jsessionid=CB002C27E11CF9E51E92785C8B015A41.was1?eventMngtId=EVENT_00000000000301">
									[이벤트/행사]&nbsp;[공고] 아이디어 올림픽, 전국민 아이디어 경진대회(2회차) 안내
								</a>
								<span class="day">2022-06-02</span>
							</div></div></div><div class="slick-slide slick-cloned" data-slick-index="15" aria-hidden="true" style="width: 307px;" tabindex="-1"><div><div class="box" style="width: 100%; display: inline-block;">
								<a title="※[오늘의 도전과제] 팀으로 참여하는 방법 공지※" href="/idearo/service/cmn/nct/CmnNoticeDetail.do;jsessionid=CB002C27E11CF9E51E92785C8B015A41.was1?nctId=NOT_00000000000000001770&amp;pageIndex=1&amp;crntMnuId=CUST_1&amp;pageNm=Customer">
									[공지사항]&nbsp;※[오늘의 도전과제] 팀으로 참여하는 방법 공지※
								</a>
								<span class="day">2022.03.03</span>
							</div></div></div><div class="slick-slide slick-cloned" data-slick-index="16" aria-hidden="true" style="width: 307px;" tabindex="-1"><div><div class="box" style="width: 100%; display: inline-block;">
								<a title="[공지] 아이디어로 카카오톡 채널 친구추가 이벤트 당첨자 발표" href="/idearo/service/cmn/nct/CmnNoticeDetail.do;jsessionid=CB002C27E11CF9E51E92785C8B015A41.was1?nctId=NOT_00000000000000001990&amp;pageIndex=1&amp;crntMnuId=CUST_1&amp;pageNm=Customer">
									[공지사항]&nbsp;[공지] 아이디어로 카카오톡 채널 친구추가 이벤트 당첨자 발표
								</a>
								<span class="day">2022.07.13</span>
							</div></div></div><div class="slick-slide slick-cloned" data-slick-index="17" aria-hidden="true" style="width: 307px;" tabindex="-1"><div><div class="box" style="width: 100%; display: inline-block;">
								<a title="[공지] 공모전 아이디어 보호 가이드라인 안내(2022.07)" href="">
									[공지사항]&nbsp;[공지] 공모전 아이디어 보호 가이드라인 안내(2022.07)
								</a>
								<span class="day">2022.07.11</span>
							</div></div></div><div class="slick-slide slick-cloned" data-slick-index="18" aria-hidden="true" style="width: 307px;" tabindex="-1"><div><div class="box" style="width: 100%; display: inline-block;">
								<a title="[기간연장] 공공기관과 함께하는 혁신 아이디어 공모전 기간 연장 공지(~ 2022. 7. 31.)" href="">
									[공지사항]&nbsp;[기간연장] 공공기관과 함께하는 혁신 아이디어 공모전 기간 연장 공지(~ 2022. 7. 31.)
								</a>
								<span class="day">2022.07.08</span>
							</div></div></div><div class="slick-slide slick-cloned" data-slick-index="19" aria-hidden="true" style="width: 307px;" tabindex="-1"><div><div class="box" style="width: 100%; display: inline-block;">
								<a title="아이디어로(IDEARO)-혁신지제품(F2) 추천 연계 공지" href="">
									[공지사항]&nbsp;아이디어로(IDEARO)-혁신지제품(F2) 추천 연계 공지
								</a>
								<span class="day">2022.07.07</span>
							</div></div></div></div></div></div>
				</div>
				<!-- 스크롤 베너 ]-->
				<div class="box"  style="position: relative;    width: 100%;    padding-right: 150px;    padding-left: 150px;">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">추천공모전</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                             <img src="./img/cmm_name_tag_add.png">
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
                                <div class="card-body">
                                    <div class="chart-area"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                    <div class="store-benner-wrap">
						<ul style="list-style:none;">
							<li class="left-benner pc-sub-bennerlist">
								<a href=""> 
									<div class="se-contents" style="font-family: Arial, Helvetica, sans-serif; font-size: 11pt; line-height: 1.2;">
										<p style="margin: 16px 0px; display: block; overflow-wrap: hidden;">
											<span class="se-drawing-object-wrapper se-image" style="vertical-align: baseline; text-indent: 0px; display: inline-block;">
												<img src="img/banner_pick1.png" alt="">
											</span>
										</p>
									</div>
								</a>
							</li>
							<a href="" class="swiper-slide"> </a>
							<li class="right-benner pc-sub-bennerlist">
								<a href="index.jsp"> 
									<div class="se-contents" style="font-family: Arial, Helvetica, sans-serif; font-size: 11pt; line-height: 1.2;">
										<p style="margin: 16px 0px; display: block; overflow-wrap: hidden;">
											<span class="se-drawing-object-wrapper se-image" style="vertical-align: baseline; text-indent: 0px; display: inline-block;">
												<img src="img/banner_pick1.png" alt="">
											</span>
										</p>
									</div>
								</a>
							</li>
							<li class="left-benner mb-sub-bennerlist">
								<a href="index.jsp"> 
								<div class="se-contents" style="font-family: Arial, Helvetica, sans-serif; font-size: 11pt; line-height: 1.2;">
									<p style="margin: 16px 0px; display: block; overflow-wrap: hidden;">
										<span class="se-drawing-object-wrapper se-image" style="vertical-align: baseline; text-indent: 0px; display: inline-block;">
											<img src="img/banner_pick1.png" alt="">
										</span>
									</p>
								</div>
								</a>
							</li>
							<a href="index.jsp" class="swiper-slide"> </a>
							<li class="right-benner mb-sub-bennerlist">
								<a href="">
									<div class="se-contents" style="font-family: Arial, Helvetica, sans-serif; font-size: 11pt; line-height: 1.2;">
										<p style="margin: 16px 0px; display: block; overflow-wrap: hidden;">
											<span class="se-drawing-object-wrapper se-image" style="vertical-align: baseline; text-indent: 0px; display: inline-block;">
												<img src="img/banner_pick1.png" alt="">
											</span>
										</p>
									</div>
								</a>
							</li>
						</ul>
					</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box"  style="position: relative;    width: 100%;    padding-right: 150px;    padding-left: 150px;">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">오늘의 도전과제</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink">
                                        <img src="./img/cmm_name_tag_add.png">
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
                                <div class="card-body">
                                    <div class="chart-area"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                    <div class="list-box-wrap">
						<div class="assignment-box list-box2" id="main-swiper01">
							<div class="title-box">
						</div>
						<div class="swiper-container swiper-container-initialized swiper-container-horizontal">
							<ul class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);padding-left: 0px;">
									<li class="swiper-slide swiper-slide-active" style="white-space:nowrap;">
										<div class="img">
											<a href="javascript:chlgGoDetailPage('KPOIP_IDC_20220623100352649');" style="position:relative;">
														<img id="imgPreview" src="img/TH_20220714013934599.png" alt="기획재정부" title="기획재정부">
												<span class="tag" style="position:absolute; top:10px; left:10px;"> 
												</span>
												<!-- D-Day 라벨 표시. 참여신청 기간 때만 표시.-->
														<span class="tag-group" style="left:auto; right: 10px; position:absolute; top:10px;">
															<em style="display: inline-block; padding: 0 10px; line-height: 30px; color: #fff; font-size: 14px; border-radius: 5px; background: #666;">
																  D-13
															</em>
														</span>
											</a>
										</div>
										<div class="category" style="text-overflow:ellipsis; overflow:hidden;" title="기타">기타</div>
											<a href="javascript:;" title="탄소배출 감축을 위한 순환경제 활성화 아이디어" style="width: 100%; text-overflow:ellipsis; overflow:hidden;" class="tit " onclick="chlgGoDetailPage('KPOIP_IDC_20220623100352649');">
											탄소배출 감축을 위한 순환경제 활성화 아이디어
											</a>
											<div class="cmpny" style="font-size:14px;">
												<p style="margin-bottom: 0px;">
												<span> 아이디어등록 마감일 &nbsp;2022-08-19</span> 
												</p>
												<p style="margin-bottom: 0px;">기획재정부 &nbsp; |  &nbsp;  등록일  &nbsp; 2022-06-29</p>
											</div>
											<div>
												<p class="price">
													<em>5,000,000</em>원
												</p>
												<p class="info"></p>
											</div>
									</li>
									<li class="swiper-slide swiper-slide-next" style="white-space:nowrap;">
										<div class="img">
											<a href="javascript:chlgGoDetailPage('KPOIP_IDC_20220623100408785');" style="position:relative;">
												<img id="imgPreview" src="img/TH_20220714013934599.png" alt="기획재정부" title="기획재정부" >
													<span class="tag" style="position:absolute; top:10px; left:10px;"> 
													</span>
												<!-- D-Day 라벨 표시. 참여신청 기간 때만 표시.-->
													<span class="tag-group" style="left:auto; right: 10px; position:absolute; top:10px;">
														<em style="display: inline-block; padding: 0 10px; line-height: 30px; color: #fff; font-size: 14px; border-radius: 5px; background: #666;">
																  D-32
														</em>
													</span>
											</a>
										</div>
										<div class="category" style="text-overflow:ellipsis; overflow:hidden;" title="기타">기타</div>
											<a href="javascript:;" title="탄소중립 실천을 위한 국민참여 확대· 활성화 아이디어" style="width: 100%; text-overflow:ellipsis; overflow:hidden;" class="tit " onclick="chlgGoDetailPage('KPOIP_IDC_20220623100408785');">
												탄소중립 실천을 위한 국민참여 확대· 활성화 아이디어
											</a>
											<div class="cmpny" style="font-size:14px;">
												<p style="margin-bottom: 0px;"><span> 아이디어등록 마감일 &nbsp;2022-08-19</span></p>
												<p style="margin-bottom: 0px;">기획재정부 &nbsp; |  &nbsp;  등록일  &nbsp; 2022-06-29</p>
											</div>
											<div>
													<p class="price">
														<em>5,000,000</em>원
													</p>
													<p class="info"></p>
											</div>
									</li>
									<li class="swiper-slide" style="white-space:nowrap;">
										<div class="img">
											<a href="javascript:chlgGoDetailPage('KPOIP_IDC_20220510111657239');" style="position:relative;">
														<img id="imgPreview" src="img/TH_20220714013934599.png" alt="한국자산관리공사" title="한국자산관리공사" >
												<span class="tag" style="position:absolute; top:10px; left:10px;"> 
												</span>
												<!-- D-Day 라벨 표시. 참여신청 기간 때만 표시.-->
														<span class="tag-group" style="left:auto; right: 10px; position:absolute; top:10px;">
															<em style="display: inline-block; padding: 0 10px; line-height: 30px; color: #fff; font-size: 14px; border-radius: 5px; background: #666;">
																  D-13
															</em>
														</span>
											</a>
										</div>
										<div class="category" style="text-overflow:ellipsis; overflow:hidden;" title="기타/사무/전문서비스">기타/사무/전문서비스</div>
												<a href="javascript:;" title="무역·무역보험·무역통계 관련 공공데이터 활용 아이디어" style="width: 100%; text-overflow:ellipsis; overflow:hidden;" class="tit " onclick="chlgGoDetailPage('KPOIP_IDC_20220510014937477');">
															무역·무역보험·무역통계 관련 공공데이터 활용 아이디어
												</a>
											<div class="cmpny" style="font-size:14px;">
												<p style="margin-bottom: 0px;"><span> 아이디어등록 마감일 &nbsp;2022-07-31</span></p>
												<p style="margin-bottom: 0px;">한국무역보험공사(K-SURE) &nbsp; |  &nbsp;  등록일  &nbsp; 2022-05-10</p>
											</div>
										<div>
													<p class="price"><em>1,000,000</em>원</p>
															<p class="info"></p>
										</div>
									</li>
							</ul>
						<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					</div>
					 </div>
                                    </div>
                                </div>
                            </div>
                        </div>
				    <div class="box"  style="position: relative;    width: 100%;    padding-right: 150px;    padding-left: 150px;">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">아이디어 소싱</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <img src="./img/cmm_name_tag_add.png">
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
                                <div class="card-body">
                                    <div class="chart-area"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                    <div class="sosing-box list-box2" id="main-swiper02"">
						<div class="swiper-container swiper-container-initialized swiper-container-horizontal">
							<ul class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);padding-left: 0px;">
								
									<li class="swiper-slide swiper-slide-active" style="white-space:nowrap;">
										<div class="img">
											<a href="javascript:idcsGoDetail('KPOIP_IDC_20220713023344075')">
														<img id="imgPreview" src="img/TH_20220714013934599.png" alt="(주)아쿠아픽" title="(주)아쿠아픽" >
											</a>
											<span class="tag-group" style="position: absolute; left: 10px; top: 10px;">
														<em class="step01" style="display: inline-block; padding: 0 10px; line-height: 30px; color: #fff; font-size: 14px; border-radius: 5px; background: #003567;">참여신청중</em>
											</span>
											<span class="tag-group" style="position: absolute; right: 10px; top: 10px;">
												<em class="step01" style="display: inline-block; padding: 0 10px; line-height: 30px; color: #fff; font-size: 14px; border-radius: 5px; background: #666;">
													
												</em>
											</span>
										</div>
										<p class="category" style="text-overflow:ellipsis; overflow:hidden;" title="생활/주방/육아/의료/건강/방역/위생/패션/잡화/뷰티">생활/주방/육아/의료/건강/방역/위생/패션/잡화/뷰티</p>
										<a href="javascript:;" class="tit new" onclick="idcsGoDetail('KPOIP_IDC_20220713023344075')">
													<!--  전문가 대기중   -->
			                   		 	    	"뚜껑없는 튜브형 치약용기" 아이디어..
										</a>
											<p class="cate" style="font-size: 13px; margin-bottom: 0px;">
													1 단계 
														  <span>&nbsp;|&nbsp; 참여신청 마감일 &nbsp;2022-07-24</span> 
											</p>
											<p class="cate" style="font-size: 13px; margin-bottom: 0px;">
												등록일  &nbsp; 2022-07-13
											</p>
										<p class="price">
											<em>10,000,000</em>원
										</p>
												<p class="info">&nbsp;</p>
									</li>
								
									<li class="swiper-slide swiper-slide-next" style="white-space:nowrap;">
										<div class="img">
											<a href="javascript:idcsGoDetail('KPOIP_IDC_20210831091730493')">
														<img id="imgPreview" src="img/TH_20220714013934599.png" alt="주식회사 김스애드" title="주식회사 김스애드">
											</a>
											<span class="tag-group" style="position: absolute; left: 10px; top: 10px;">
											</span>
											<span class="tag-group" style="position: absolute; right: 10px; top: 10px;">
												<em class="step01" style="display: inline-block; padding: 0 10px; line-height: 30px; color: #fff; font-size: 14px; border-radius: 5px; background: #666;">
													
												</em>
											</span>
										</div>
										<p class="category" style="text-overflow:ellipsis; overflow:hidden;" title="기계/에너지/전기/전자/정보통신">기계/에너지/전기/전자/정보통신</p>
										<a href="javascript:;" class="tit " onclick="idcsGoDetail('KPOIP_IDC_20210831091730493')">
													<!--  전문가 대기중   -->
			                   		 	    	태양광을 활용한 LED 도로표지병의 휘도 저하 문제 해..
										</a>
											<p class="cate" style="font-size: 13px; margin-bottom: 0px;">
													 소싱완료 
											</p>
											<p class="cate" style="font-size: 13px; margin-bottom: 0px;">
												등록일  &nbsp; 2021-11-17
											</p>
										<p class="price" >
											<em>5,000,000</em>원</p>
												<p class="info" >&nbsp;</p>
											
									</li>
								
							</ul>
						<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
					</div>
                                    </div>
                                </div>
                            </div>
                        </div>
					    <div class="box"  style="position: relative;    width: 100%;    padding-right: 150px;    padding-left: 150px;">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">이벤트 및 공지사항</h6>
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
                                <div class="card-body">
                                    <div class="chart-area"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                    <div class="noticeboard-wrap" style="margin-bottom: 675px;">
						<div class="noticeboard-box" style="width: auto;  " >
							<div class="petition">
								<h2>
									이벤트/행사
									<a href=""><img src="./img/cmm_name_tag_add.png" style="display:inline-block;margin-bottom:5px;margin-left:30px;width:25px;height:25px;text-indent:-9999px;background-size:100% auto;">
								</a></h2>
								<ul style="padding-left: 10px">
										<li class="ing" style="white-space:nowrap;">
											<a href="" title="엘레베이터 변기" style="text-overflow:ellipsis; overflow:hidden;">
												엘레베이터 변기
											</a>
											<span>2022-08-09까지</span>
										</li>
										<li class="ing" style="white-space:nowrap;">
											<a href="" title="침대 등받이 중앙 분리대 (다기능)" style="text-overflow:ellipsis; overflow:hidden;">
												침대 등받이 중앙 분리대 (다기능)
											</a>
											<span>2022-09-03까지</span>
										</li>
										<li class="ing" style="white-space:nowrap;">
											<a href="" title="장대등에 각종도구를 연결하여 작업할 수 있는 연결도구" style="text-overflow:ellipsis; overflow:hidden;">
												장대등에 각종도구를 연결하여 작업할 수 있는 연결도구
											</a>
											<span>2022-08-27까지</span>
										</li>
										<li class="ing" style="white-space:nowrap;">
											<a href="" title="화재수신기 다운시 경보가능" style="text-overflow:ellipsis; overflow:hidden;">
												화재수신기 다운시 경보가능
											</a>
											<span>2022-08-14까지</span>
										</li>
								</ul>
								</div>
							<div class="share">
								<h2>공지사항
									<a href=""><img src="./img/cmm_name_tag_add.png" style="display:inline-block;margin-bottom:5px;margin-left:30px;width:25px;height:25px;text-indent:-9999px;background-size:100% auto;">
								</a></h2>
								<ul style="padding-left: 10px">
									<li class="ing" style="white-space:nowrap;">
										<a href="/idearo/service/idp/IdeaShareDetail.do;jsessionid=CB002C27E11CF9E51E92785C8B015A41.was1?pageNm=/service/idp/&amp;crntMnuId=1124&amp;shareId=IDEASHARE_0000001950" title="광고 리어카" style="text-overflow:ellipsis; overflow:hidden;">
											[기타]광고 리어카
										</a>
											<div class="star-num">
												<span>
													<em class="star-avg"></em>
													<strong class="star-rate">0.0</strong>
												</span>
											</div>
										</li>
										<li class="ing" style="white-space:nowrap;">
											<a href="/idearo/service/idp/IdeaShareDetail.do;jsessionid=CB002C27E11CF9E51E92785C8B015A41.was1?pageNm=/service/idp/&amp;crntMnuId=1124&amp;shareId=IDEASHARE_0000001929" title="위치추적기가 달려있는 우산" style="text-overflow:ellipsis; overflow:hidden;">
												[아웃도어/스포츠 관련]위치추적기가 달려있는 우산
											</a>
											<div class="star-num">
												<span>
													<em class="star-avg"></em>
													<strong class="star-rate">0.0</strong>
												</span>
											</div>
										</li>
									
										<li class="ing" style="white-space:nowrap;">
											<a href="/idearo/service/idp/IdeaShareDetail.do;jsessionid=CB002C27E11CF9E51E92785C8B015A41.was1?pageNm=/service/idp/&amp;crntMnuId=1124&amp;shareId=IDEASHARE_0000001900" title="맨홀 추락방지 사다리 도입으로 안전한 작업환경 조성" style="text-overflow:ellipsis; overflow:hidden;">
												[건축․건설․토목 자재/설비/장비/용품 관련]맨홀 추락방지 사다리 도입으로 안전한 작업환경 조성
											</a>
											<div class="star-num">
												<span>
													<em class="star-avg"></em>
													<strong class="star-rate">0.0</strong>
												</span>
											</div>
										</li>
									
										<li class="ing" style="white-space:nowrap;">
											<a href="/idearo/service/idp/IdeaShareDetail.do;jsessionid=CB002C27E11CF9E51E92785C8B015A41.was1?pageNm=/service/idp/&amp;crntMnuId=1124&amp;shareId=IDEASHARE_0000001881" title="건조기능발매트" style="text-overflow:ellipsis; overflow:hidden;">
												[청소/욕실/식기/조리도구/주방용품 관련]건조기능발매트
											</a>
											<div class="star-num">
												<span>
													<em class="star-avg"></em>
													<strong class="star-rate">0.0</strong>
												</span>
											</div>
										</li>
								</ul>
							</div>
							</div>
                                    </div>
                                </div>
                            </div>
                        </div>
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