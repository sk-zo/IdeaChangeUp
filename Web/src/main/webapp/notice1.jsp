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
						<div class="search-box">
							<span class="cmm-select">
								<select id="searchCnd" name="searchCnd" title="검색선택">
									<option value="1" selected="">제목</option>
									<option value="2">내용</option>
									<option value="3">구매자</option>
								</select>
							</span>
							<span class="cmm-input">
								<input type="text" id="searchWrd" name="searchWrd" title="키워드 입력" placeholder="키워드를 입력해주세요" value="" onkeypress="if( event.keyCode == 13 ){fn_egov_search();}">
							</span>
							<button type="button" class="search" id="searchBtn">
								<span>검색</span>
							</button>
						</div>
					</form>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                             <div class="array-type">					
									<span class="cmm-radio  checked ">
										<input type="radio" name="radioSortClmn" id="array-type-1" value="2" checked="checked">
										<label for="array-type-1">
											최신순
											<!--기본정렬 -->
										</label>
									</span>
									<span class="cmm-radio ">
										<input type="radio" name="radioSortClmn" value="1" id="array-type-2">
										<label for="array-type-2">
											마감임박순
											<!--마감임박순-->
										</label>
									</span>
									<span class="cmm-radio ">
										<input type="radio" name="radioSortClmn" value="3" id="array-type-3">
										<label for="array-type-3">
											참여자순
											<!--참여자순-->
										</label>
									</span>
									<span class="cmm-radio ">
										<input type="radio" name="radioSortClmn" value="4" id="array-type-4">
										<label for="array-type-4">
											총상금순
											<!--총상금순-->
										</label>
									</span>
									<span class="cmm-radio ">
										<input type="radio" name="radioSortClmn" value="5" id="array-type-5">
										<label for="array-type-5">
											조회순
										</label>
									</span>
						</div>
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
			<div id="content">
				<div class="challenge-list-area">
							<div class="challenge-list-wrap card" data-list="card"  style="text-align: left;">
					<div class="category-box">
								<span class="cmm-radio checked" id="cmm_radio_all">
									<!--   checked -->
									<input type="radio" name="radioCode" id="category-type-all" checked="checked">
									<label for="category-type-all">
										<a href="#" onclick="goFldMain();">
											전체
										</a>
									</label>
								</span>
									<span class="cmm-radio">
										<!--   checked -->
										<input type="radio" name="radioCode" id="category-type-CAT010" value="CAT010">
										<label for="category-type-CAT010">
											생활/주방/육아
										</label>
									</span>
									<span class="cmm-radio">
										<!--   checked -->
										<input type="radio" name="radioCode" id="category-type-CAT020" value="CAT020">
										<label for="category-type-CAT020">
											패션/잡화/뷰티
										</label>
									</span>
									<span class="cmm-radio">
										<!--   checked -->
										<input type="radio" name="radioCode" id="category-type-CAT030" value="CAT030">
										<label for="category-type-CAT030">
											식자재/식음료/기호제품
										</label>
									</span>
									<span class="cmm-radio">
										<!--   checked -->
										<input type="radio" name="radioCode" id="category-type-CAT040" value="CAT040">
										<label for="category-type-CAT040">
											의료/건강/방역/위생
										</label>
									</span>
								
									<span class="cmm-radio">
										<!--   checked -->
										<input type="radio" name="radioCode" id="category-type-CAT050" value="CAT050">
										<label for="category-type-CAT050">
											가전/모바일/게임/광학기기
										</label>
									</span>
									<span class="cmm-radio">
										<!--   checked -->
										<input type="radio" name="radioCode" id="category-type-CAT060" value="CAT060">
										<label for="category-type-CAT060">
											건축/건설/토목/환경
										</label>
									</span>
								
									<span class="cmm-radio">
										<!--   checked -->
										<input type="radio" name="radioCode" id="category-type-CAT070" value="CAT070">
										<label for="category-type-CAT070">
											기계/에너지
										</label>
									</span>
									<span class="cmm-radio">
										<!--   checked -->
										<input type="radio" name="radioCode" id="category-type-CAT080" value="CAT080">
										<label for="category-type-CAT080">
											화학/바이오/소재
										</label>
									</span>
								
									<span class="cmm-radio">
										<!--   checked -->
										<input type="radio" name="radioCode" id="category-type-CAT090" value="CAT090">
										<label for="category-type-CAT090">
											전기/전자/정보통신
										</label>
									</span>
									<span class="cmm-radio">
										<!--   checked -->
										<input type="radio" name="radioCode" id="category-type-CAT100" value="CAT100">
										<label for="category-type-CAT100">
											미디어/컨텐츠/여가/스포츠
										</label>
									</span>
								
									<span class="cmm-radio">
										<!--   checked -->
										<input type="radio" name="radioCode" id="category-type-CAT110" value="CAT110">
										<label for="category-type-CAT110">
											사무/전문서비스
										</label>
									</span>
									<span class="cmm-radio">
										<!--   checked -->
										<input type="radio" name="radioCode" id="category-type-CAT120" value="CAT120">
										<label for="category-type-CAT120">
											기타
										</label>
									</span>
					</div>
					
					</div>
					<ul class="list-box">
						<li style="white-space:nowrap; display: inline-block; position: relative;   zoom: 1; *display: inline;
    					 padding: 50px 15px 15px 15px;width: 270px;min-height: 380px;vertical-align: top;border-bottom: none;">
							<div class="img" onclick="goDetailPage('KPOIP_IDC_20220623100352649');" style="position: relative; padding: 0px 0px 0px 0px;min-height: 100%;
   									 font-size: 0; background: #eaecef; box-sizing: border-box; overflow: hidden;">
								<img id="imgPreview" src="img/TH_20220714013934599.png" alt="" style=" position: relative;
    							   padding: 0px 0px 0px 0px; height: 147px; font-size: 0;  background: #eaecef;  box-sizing: border-box; overflow: hidden;">
								<!-- D-Day 라벨 표시. 참여신청 기간 때만 표시.-->
								<span class="tag-group" style="left:auto; right: 10px;">
									<em class="step01" style="background: #666;">D-30 </em>
								</span>
							</div>
							<div class="category" style="text-overflow:ellipsis; overflow:hidden;" title="기타">기타</div>
							<!-- 아이디어 참여 기간    -->
							<!--  전문가 대기중   -->
								<a href="#" title="탄소배출 감축을 위한 순환경제 활성화 아이디어" style="width: 100%; text-overflow:ellipsis; overflow:hidden;  display: block;
							    margin-bottom: 10px;  color: #333;  font-size: 16px; text-overflow: ellipsis;
							    overflow: hidden;   white-space: nowrap;  word-break: normal;" class="tit ">
			                   		탄소배출 감축을 위한 순환경제 활성화 아이디어
								</a>
								<div class="cmpny" style="font-size:14px;">
									<p><span> 아이디어등록 마감일 &nbsp;2022-08-19</span></p>
									<p>기획재정부&nbsp; |  &nbsp; 등록일 &nbsp; 2022-06-29</p>
								</div>
								<div class="info">
									<span class="price" style="    display: block; margin-top: 20px;  padding: 0;height: 40px;line-height: 40px;
								    font-size: 18px; text-align: right;  border-top: solid 1px #ccc; background: none;"><em style="font-size: 18px; color: #003567;">
								    5,000,000 </em> 원</span>
									<span class="info-txt" style="display: block;padding: 10px 0; height: auto; line-height: 18px;   font-size: 18px; text-align: right; border-top: solid 1px #ccc;
								    background: none;text-overflow: ellipsis; white-space: nowrap; overflow: hidden;"><em  style="color: #666; font-size: 14px;">
								    [기술·제품 부문] 총 상금 1,180만원  </em></span>
								</div>
						</li>
							<li style="white-space:nowrap; display: inline-block; position: relative;   zoom: 1; *display: inline;
    					margin-left: 30px; padding: 50px 15px 15px 15px;width: 270px;min-height: 380px;vertical-align: top;border-bottom: none;">
							<div class="img" onclick="goDetailPage('KPOIP_IDC_20220623100352649');" style="position: relative; padding: 0px 0px 0px 0px;min-height: 100%;
   									 font-size: 0; background: #eaecef; box-sizing: border-box; overflow: hidden;">
								<img id="imgPreview" src="img/TH_20220714013934599.png" alt="" style=" position: relative;
    							   padding: 0px 0px 0px 0px; height: 147px; font-size: 0;  background: #eaecef;  box-sizing: border-box; overflow: hidden;">
								<!-- D-Day 라벨 표시. 참여신청 기간 때만 표시.-->
								<span class="tag-group" style="left:auto; right: 10px;">
									<em class="step01" style="background: #666;">D-30 </em>
								</span>
							</div>
							<div class="category" style="text-overflow:ellipsis; overflow:hidden;" title="기타">기타</div>
							<!-- 아이디어 참여 기간    -->
							<!--  전문가 대기중   -->
								<a href="#" title="탄소배출 감축을 위한 순환경제 활성화 아이디어" style="width: 100%; text-overflow:ellipsis; overflow:hidden;  display: block;
							    margin-bottom: 10px;  color: #333;  font-size: 16px; text-overflow: ellipsis;
							    overflow: hidden;   white-space: nowrap;  word-break: normal;" class="tit ">
			                   		탄소배출 감축을 위한 순환경제 활성화 아이디어
								</a>
								<div class="cmpny" style="font-size:14px;">
									<p><span> 아이디어등록 마감일 &nbsp;2022-08-19</span></p>
									<p>기획재정부&nbsp; |  &nbsp; 등록일 &nbsp; 2022-06-29</p>
								</div>
								<div class="info">
									<span class="price" style="    display: block; margin-top: 20px;  padding: 0;height: 40px;line-height: 40px;
								    font-size: 18px; text-align: right;  border-top: solid 1px #ccc; background: none;"><em style="font-size: 18px; color: #003567;">
								    5,000,000 </em> 원</span>
									<span class="info-txt" style="display: block;padding: 10px 0; height: auto; line-height: 18px;   font-size: 18px; text-align: right; border-top: solid 1px #ccc;
								    background: none;text-overflow: ellipsis; white-space: nowrap; overflow: hidden;"><em  style="color: #666; font-size: 14px;">
								    [기술·제품 부문] 총 상금 1,180만원  </em></span>
								</div>
						</li>
							<li style="white-space:nowrap; display: inline-block; position: relative;   zoom: 1; *display: inline;
    					margin-left: 30px; padding: 50px 15px 15px 15px;width: 270px;min-height: 380px;vertical-align: top;border-bottom: none;">
							<div class="img" onclick="goDetailPage('KPOIP_IDC_20220623100352649');" style="position: relative; padding: 0px 0px 0px 0px;min-height: 100%;
   									 font-size: 0; background: #eaecef; box-sizing: border-box; overflow: hidden;">
								<img id="imgPreview" src="img/TH_20220714013934599.png" alt="" style=" position: relative;
    							   padding: 0px 0px 0px 0px; height: 147px; font-size: 0;  background: #eaecef;  box-sizing: border-box; overflow: hidden;">
								<!-- D-Day 라벨 표시. 참여신청 기간 때만 표시.-->
								<span class="tag-group" style="left:auto; right: 10px;">
									<em class="step01" style="background: #666;">D-30 </em>
								</span>
							</div>
							<div class="category" style="text-overflow:ellipsis; overflow:hidden;" title="기타">기타</div>
							<!-- 아이디어 참여 기간    -->
							<!--  전문가 대기중   -->
								<a href="#" title="탄소배출 감축을 위한 순환경제 활성화 아이디어" style="width: 100%; text-overflow:ellipsis; overflow:hidden;  display: block;
							    margin-bottom: 10px;  color: #333;  font-size: 16px; text-overflow: ellipsis;
							    overflow: hidden;   white-space: nowrap;  word-break: normal;" class="tit ">
			                   		탄소배출 감축을 위한 순환경제 활성화 아이디어
								</a>
								<div class="cmpny" style="font-size:14px;">
									<p><span> 아이디어등록 마감일 &nbsp;2022-08-19</span></p>
									<p>기획재정부&nbsp; |  &nbsp; 등록일 &nbsp; 2022-06-29</p>
								</div>
								<div class="info">
									<span class="price" style="    display: block; margin-top: 20px;  padding: 0;height: 40px;line-height: 40px;
								    font-size: 18px; text-align: right;  border-top: solid 1px #ccc; background: none;"><em style="font-size: 18px; color: #003567;">
								    5,000,000 </em> 원</span>
									<span class="info-txt" style="display: block;padding: 10px 0; height: auto; line-height: 18px;   font-size: 18px; text-align: right; border-top: solid 1px #ccc;
								    background: none;text-overflow: ellipsis; white-space: nowrap; overflow: hidden;"><em  style="color: #666; font-size: 14px;">
								    [기술·제품 부문] 총 상금 1,180만원</em></span>
								</div>
						</li>
							<li style="white-space:nowrap; display: inline-block; position: relative;   zoom: 1; *display: inline;
    					margin-left: 30px; padding: 50px 15px 15px 15px;width: 270px;min-height: 380px;vertical-align: top;border-bottom: none;">
							<div class="img" onclick="goDetailPage('KPOIP_IDC_20220623100352649');" style="position: relative; padding: 0px 0px 0px 0px;min-height: 100%;
   									 font-size: 0; background: #eaecef; box-sizing: border-box; overflow: hidden;">
								<img id="imgPreview" src="img/TH_20220714013934599.png" alt="" style=" position: relative;
    							   padding: 0px 0px 0px 0px; height: 147px; font-size: 0;  background: #eaecef;  box-sizing: border-box; overflow: hidden;">
								<!-- D-Day 라벨 표시. 참여신청 기간 때만 표시.-->
								<span class="tag-group" style="left:auto; right: 10px;">
									<em class="step01" style="background: #666;">D-30 </em>
								</span>
							</div>
							<div class="category" style="text-overflow:ellipsis; overflow:hidden;" title="기타">기타</div>
							<!-- 아이디어 참여 기간    -->
							<!--  전문가 대기중   -->
								<a href="#" title="탄소배출 감축을 위한 순환경제 활성화 아이디어" style="width: 100%; text-overflow:ellipsis; overflow:hidden;  display: block;
							    margin-bottom: 10px;  color: #333;  font-size: 16px; text-overflow: ellipsis;
							    overflow: hidden;   white-space: nowrap;  word-break: normal;" class="tit ">
			                   		탄소배출 감축을 위한 순환경제 활성화 아이디어
								</a>
								<div class="cmpny" style="font-size:14px;">
									<p><span> 아이디어등록 마감일 &nbsp;2022-08-19</span></p>
									<p>기획재정부&nbsp; |  &nbsp; 등록일 &nbsp; 2022-06-29</p>
								</div>
								<div class="info">
									<span class="price" style="    display: block; margin-top: 20px;  padding: 0;height: 40px;line-height: 40px;
								    font-size: 18px; text-align: right;  border-top: solid 1px #ccc; background: none;"><em style="font-size: 18px; color: #003567;">
								    5,000,000 </em> 원</span>
									<span class="info-txt" style="display: block;padding: 10px 0; height: auto; line-height: 18px;   font-size: 18px; text-align: right; border-top: solid 1px #ccc;
								    background: none;text-overflow: ellipsis; white-space: nowrap; overflow: hidden;"><em  style="color: #666; font-size: 14px;">
								    [기술·제품 부문] 총 상금 1,180만원</em></span>
								</div>
						</li>
							<li style="white-space:nowrap; display: inline-block; position: relative;   zoom: 1; *display: inline; margin-right: 30px;
    					margin-left: 30px; padding: 50px 15px 15px 15px;width: 270px;min-height: 380px;vertical-align: top;border-bottom: none;">
							<div class="img" onclick="goDetailPage('KPOIP_IDC_20220623100352649');" style="position: relative; padding: 0px 0px 0px 0px;min-height: 100%;
   									 font-size: 0; background: #eaecef; box-sizing: border-box; overflow: hidden;">
								<img id="imgPreview" src="img/TH_20220714013934599.png" alt="" style=" position: relative;
    							   padding: 0px 0px 0px 0px; height: 147px; font-size: 0;  background: #eaecef;  box-sizing: border-box; overflow: hidden;">
								<!-- D-Day 라벨 표시. 참여신청 기간 때만 표시.-->
								<span class="tag-group" style="left:auto; right: 10px;">
									<em class="step01" style="background: #666;">D-30 </em>
								</span>
							</div>
							<div class="category" style="text-overflow:ellipsis; overflow:hidden;" title="기타">기타</div>
							<!-- 아이디어 참여 기간    -->
							<!--  전문가 대기중   -->
								<a href="#" title="탄소배출 감축을 위한 순환경제 활성화 아이디어" style="width: 100%; text-overflow:ellipsis; overflow:hidden;  display: block;
							    margin-bottom: 10px;  color: #333;  font-size: 16px; text-overflow: ellipsis;
							    overflow: hidden;   white-space: nowrap;  word-break: normal;" class="tit ">
			                   		탄소배출 감축을 위한 순환경제 활성화 아이디어
								</a>
								<div class="cmpny" style="font-size:14px;">
									<p><span> 아이디어등록 마감일 &nbsp;2022-08-19</span></p>
									<p>기획재정부&nbsp; |  &nbsp; 등록일 &nbsp; 2022-06-29</p>
								</div>
								<div class="info">
									<span class="price" style="    display: block; margin-top: 20px;  padding: 0;height: 40px;line-height: 40px;
								    font-size: 18px; text-align: right;  border-top: solid 1px #ccc; background: none;"><em style="font-size: 18px; color: #003567;">
								    5,000,000 </em> 원</span>
									<span class="info-txt" style="display: block;padding: 10px 0; height: auto; line-height: 18px;   font-size: 18px; text-align: right; border-top: solid 1px #ccc;
								    background: none;text-overflow: ellipsis; white-space: nowrap; overflow: hidden;"><em  style="color: #666; font-size: 14px;">
								    [기술·제품 부문] 총 상금 1,180만원</em></span>
								</div>
						</li>
					</ul>
					<div class="cmm-paging-box">
										<div class="paging">
					<button type="button" class="active" onclick="javascript:;">
						<span>1</span>
					</button>
					<button type="button" class="" onclick="javascript:fn_egov_select_linkPage('2');">
						<span>2</span>
					</button>
					<button type="button" class="" onclick="javascript:fn_egov_select_linkPage('3');">
						<span>3</span>
					</button>
					<button type="button" class="" onclick="javascript:fn_egov_select_linkPage('4');">
						<span>4</span>
					</button>
					<button type="button" class="" onclick="javascript:fn_egov_select_linkPage('5');">
						<span>5</span>
					</button>
					<button type="button" class="" onclick="javascript:fn_egov_select_linkPage('6');">
						<span>6</span>
					</button>
					<button type="button" class="" onclick="javascript:fn_egov_select_linkPage('7');">
						<span>7</span>
					</button>
					<button type="button" class="" onclick="javascript:fn_egov_select_linkPage('8');">
						<span>8</span>
					</button>
					<button type="button" class="" onclick="javascript:fn_egov_select_linkPage('9');">
						<span>9</span>
					</button>
					<button type="button" class="" onclick="javascript:fn_egov_select_linkPage('10');">
						<span>10</span>
					</button>
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