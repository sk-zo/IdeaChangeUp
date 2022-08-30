
<!DOCTYPE html>







<!--
/*************************************************************************
* @ 서비스경로   : 아이디어광장 > 아이디어나눔 > 목록
* @ 페이지설명  : 아이디어 나눔
* @ 파일명     : html/07_square/UMN-PIP-21-001.html
* @ 작성자     : 김은옥 (publisher@to-be.co.kr)
* @ 작성일     : 2020-10-22
************************** 수정이력 ****************************************
* 날짜                    작업자                 변경내용
*_________________________________________________________________________
* 2020-10-22             김은옥                 최초작성
*************************************************************************/
-->
<html lang="ko">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/commonuni.css?">
<link rel="stylesheet" href="assets/css/min.css?">
<link rel="stylesheet" href="assets/css/yoosj.css?">
<link rel="stylesheet" href="assets/css/spinners.css?">
</head>
<body onload="setSearch();">
	






<meta http-equiv="Content-Type" content="text/html; charset=utf-8">






<div id="mo-view-wrap" aria-hidden="false">
	<!-- view-wrap S -->
	<header id="mo-header">
		<div class="mo-top-box">
			<div class="inner">
				<a href="javascript:window.history.back();" class="icon btn-prev">
					<span>뒤로가기</span>
				</a>
				 <a href='/idearo/' class="logo">
					<span>IDEASTORE</span>
				</a> 
				 <a href='/idearo/' class="logo logo2">
					<span>IDEASTORE</span>
				</a> 
				<div class="btn">
					<a href="javascript:showMobilSearch();" class="icon search">
						<span>검색</span>
					</a>
					<button type="button" class="btn-allmenu">
						<span>전체메뉴보기</span>
					</button>
				</div>

				<div class="mo-text-box" id="headerMobilSearchBox">
					<input type="text" id="mainSearchM" placeholder="검색어를 입력해 주세요" onkeydown="onKeySearchM()">
					<button type="button" onclick="javascript:window.history.back();" class="btn-prev">
						<span>이전</span>
					</button>
					<button type="button" onclick="javascript:goSearchM();" class="btn-search">
						<span>검색</span>
					</button>
				</div>

				<div class="mo-menu-popup">

					<button type="button" class="mo-btn-close">
						<span>닫기</span>
					</button>
					
						<div class="mo-login">
							<a href='/idearo/service/cmn/login/loginUsr.do?loginType=TOP' class="txt border-right">
								<span>로그인</span>
							</a>
							<a href='/idearo/service/cmn/member/mberSbscrb.do' class="txt">
								<span>회원가입</span>
							</a>
							<a href="javascript:openHelpLayer();" class="txt">
								<span>방개설 도움요청</span>
							</a>
						</div>
					
					

					<div class="mo-btn">
						<a href="javascript:showMobilSearch();" class="icon search">
							<span>검색</span>
						</a>
						
						<a href="/idearo/service/cmn/cust/CustQnaList.do?pageNm=/service/cmn/cust&crntMnuId=1147" class="icon customer">
							<span>
								고객지원
								
							</span>
						</a>
					</div>

					<div id="mbGnb" class="mo-menu-list"></div>
					<div style="margin-top:100px; font-size:17px; color:#313131; text-align:center;">
						<a href="/idearo/service/cmn/intro/introManageShow.do?introManageId=INTROMNG_00000000023">
							<span>개인정보 침해신고</span>
						</a> &nbsp;&nbsp;&nbsp;
						<a href="/idearo/service/cmn/intro/introManageShow.do?introManageId=INTROMNG_00000000022">
							<span>개인정보 처리방침</span>
						</a> &nbsp;&nbsp;&nbsp; 
						<a href="/idearo/service/cmn/intro/introManageShow.do?introManageId=INTROMNG_00000000024">
							<span>이용약관</span>
						</a>
					</div>

				</div>
			</div>
		</div>
	</header>

</div>
<!-- view-wrap E -->



	
	
		<div id="view-wrap" class="bg-type1" aria-hidden="false">
	





	

<div id="header" style="display:">
	<div class="top-box right">
		<div class="inner">
			<!-- <a href="/ideastore" class="logo">
				<span>IDEASTORE</span>
			</a> -->
			 <a href="/idearo/" class="logo logo2">
				<span>IDEASTORE</span>
			</a> 
			<div class="btn" id="headerToolBox">
				<a href="javascript:showSearch();" class="icon search">
					<span>
						검색
						
					</span>
				</a>
				
				
					<a href="/idearo/service/cmn/cust/CustQnaList.do?pageNm=/service/cmn/cust&crntMnuId=1147" class="icon customer">
						<span>
							고객지원
							
						</span>
					</a>
					<a href="/idearo/service/cmn/login/loginUsr.do?loginType=TOP" class="txt">
						<span>
							로그인
							
						</span>
					</a>
					<a href="/idearo/service/cmn/member/mberSbscrb.do" class="txt">
						<span>
							회원가입
							
						</span>
					</a>
				
			</div>
			
				<a href="javascript:openHelpLayer();" class="top-helf-box">
					기업회원 가입 <span>방개설 도움요청</span>
				</a>
			
				
			<div class="btn width-380" id="headerSearchBox" style="display: none;">
				<div id="serachBox" class="text-box">
					<input type="text" id="mainSearch" placeholder="검색어를 입력해 주세요">
					<button type="button" onclick="javascript:goHeaderToolBox();" class="btn-prev"></button>
					<button type="button" onclick="javascript:goSearch()" class="btn-search"></button>
				</div>
			</div>
		</div>
	</div>
	<div class="bottom-box">
		<div class="gnb-wrap">
			<div class="inner">
				
				<div id="gnb" style="display:flex; justify-content:space-between;"></div>
			</div>
		</div>
	</div>
</div>

<form id="HpcmRequstVO" name="HpcmRequstVO" action="" method="post" onSubmit="fn_egov_regist_HpcmRequst(document.HpcmRequstVO); return false;">
	
	<div aria-hidden="false" class="cmm-layer-wrap width-1000" id="membershipHelp">
		

		<div class="inner-wrap">
			<div class="content-wrap">
				<div class="header">
					<h1>기업회원 가입/방개설 도움요청</h1>
					<button type="button" class="btn-close">닫기</button>
				</div>

				<div class="content">
					<div class="helf-text-box">
						<h2 class="tit">기업회원으로 가입하거나 아이디어방을 개설하는 과정이 어려우신가요?</h2>
						<p class="txt">원하신다면 플랫폼담당자가 직접 연락 또는 내방하여 기업회원가입 및 아이디어방 개설을 도와드립니다.</p>
					</div>

					<div class="cmm-table-wrap">
						<div class="cmm-top-box">
							<h2 class="tit-h2">도움 받고자 하시는 분의 정보</h2>
						</div>
						<div class="form-table">
							<dl>
								<dt>
									회사 명
									<span class="cmm-required">필수</span>
								</dt>
								<dd>
									<div class="cmm-input">
										<input type="text" id="hpcmRequst_cmpnyNm" name="cmpnyNm" value="" placeholder="회사 명을 입력해 주세요" />
									</div>
								</dd>
							</dl>
							<dl>
								<dt>
									담당자명
									<span class="cmm-required">필수</span>
								</dt>
								<dd>
									<div class="cmm-input">
										<input type="text" id="hpcmRequst_chrgrNm" name="chrgrNm" value="" placeholder="담당자명을 입력해 주세요" />
									</div>
								</dd>
							</dl>
							<dl>
								<dt>
									이메일 주소
									<span class="cmm-required">필수</span>
								</dt>
								<dd>
									<div class="cmm-input">
										<input type="text" id="hpcmRequst_email" name="email" value="" placeholder="Honggildong.naver.com" />
									</div>
								</dd>
							</dl>
							<dl>
								<dt>
									연락처
									<span class="cmm-required">필수</span>
								</dt>
								<dd>
									<div class="cmm-input">
										<input type="text" id="hpcmRequst_cntct" name="cntct" value="" placeholder="010-0000-0000" />
									</div>
								</dd>
							</dl>
							<dl>
								<dt>
									도움 받고자
									<br>
									하는 사항
								</dt>
								<dd>
									<div class="cmm-textarea">
										<textarea cols="40" rows="5" id="hpcmRequst_cn" name="cn" title="내용을 입력해 주세요" placeholder="내용을 입력해 주세요"></textarea>
									</div>
								</dd>
							</dl>
						</div>
					</div>

					<div class="cmm-btn-wrap">
						<div class="btn-box">
							<button type="button" class="cmm-btn-white" id="hpcmRequstBtn">
								<span>도움요청하기</span>
							</button>
							<button type="button" class="cmm-btn-navy btn-close">
								<span>닫기</span>
							</button>
						</div>
					</div>

					<div class="cmm-btn-wrap">
						<div class="cmm-top-box border-bottom">
							<h2 class="cmm-tit-h2 img">기업회원 주요서비스 바로가기</h2>
						</div>
						<div class="center">
							<a href="/idearo/service/cmn/member/cmpnyStplatAgre.do" class="btn-border">
								<span>기업회원가입</span>
							</a>
							<a href="/idearo/service/idc/chlg/idcMain.do?pageNm=/service/idc/chlg&crntMnuId=1047" class="btn-border">
								<span>아이디어방 개설</span>
							</a>
							<a href="/idearo/service/ids/store/ideaStoreList.do?pageNm=/ids&crntMnuId=1094" class="btn-border">
								<span>아이디어스토어(아이디어 구매)</span> 
							</a>
						</div>
					</div>
				</div>
			</div>
			<button type="button" class="btn-close">팝업닫기</button>
		</div>
	</div>
	
</form>

<script language="javascript">
	$( document ).on( 'click' , '.sub-menu .sub-scroll .next' , function()
	{
		$( this ).siblings( '.btn-prev' ).hide().siblings( '.btn-next' ).show();
	} );
	$( document ).on( 'click' , '.sub-menu .sub-scroll .prev' , function()
	{
		$( this ).siblings( '.btn-prev' ).show().siblings( '.btn-next' ).hide();
	} );

	/* ********************************************************
	 * 저장처리화면
	 ******************************************************** */
	function fn_egov_regist_HpcmRequst( form )
	{
		//input item Client-Side validate
		// 		if ( !validateHpcmRequstVO( form ) )
		// 		{
		// 			return false;
		// 		}
		// 		else
		// 		{
		// 기업회원 가입/방개설 도움요청
		fnHpcmRequst( form );
		// 		}
	}

	/* ********************************************************
	 * 기업회원 가입/방개설 도움요청
	 ******************************************************** */
	function fnHpcmRequst( form )
	{
		var msgTitle = "기업회원 가입/방개설 도움요청 안내";
		if ( isEmpty( $( "#hpcmRequst_cmpnyNm" ).val() ) )
		{
			swal( msgTitle , "회사명을 입력하세요." , "warning" );
			return false;
		}
		if ( isEmpty( $( "#hpcmRequst_chrgrNm" ).val() ) )
		{
			swal( msgTitle , "담당자명을 입력하세요." , "warning" );
			return false;
		}
		if ( isEmpty( $( "#hpcmRequst_email" ).val() ) )
		{
			swal( msgTitle , "이메일주소를 입력하세요." , "warning" );
			return false;
		}
		if ( isEmpty( $( "#hpcmRequst_cntct" ).val() ) )
		{
			swal( msgTitle , "연락처를 입력하세요." , "warning" );
			return false;
		}
		if ( isEmpty( $( "#hpcmRequst_cn" ).val() ) )
		{
			swal( msgTitle , "도움 받고자 하는 사항을 입력하세요." , "warning" );
			return false;
		}

		$.ajax( {
			url : "/idearo/service/cmn/nct/HpcmRequstSave.do" ,
			type : "POST" ,
			data : $( "#HpcmRequstVO" ).serialize() ,
			dataType : 'json' ,
			success : function( data )
			{
				if ( data.rCode == "0000" )
				{
					swal( {
						title : msgTitle ,
						text : "기업회원 가입/방개설 도움 요청 되었습니다." ,
						type : "success" ,
						showCancelButton : false ,
						confirmButtonClass : "btn-warning" ,
						confirmButtonText : "예" ,
						cancelButtonText : "아니오" ,
						closeOnConfirm : false ,
						closeOnCancel : true
					} , function( isConfirm )
					{
						location.href = "/idearo/";
					} );
					return true;
				}
				else
				{
					swal( msgTitle , data.rMsg , "warning" );
					return false;
				}
			} ,
			error : function()
			{
				swal( msgTitle , "기업회원 가입/방개설 도움 요청 중 오류가 발생하였습니다." , "error" );
				return false;
			}
		} );
	}

	$( document ).ready( function()
	{
		/* if ( '/service/idp/' == 'Customer' )
		{
			var mnuHtml = '';
			mnuHtml += '<div class="gnb-menu active">';
			mnuHtml += '	<a href="javascript:;"><span>고객지원</span></a>';
			mnuHtml += '	<div class="sub-menu">';
			mnuHtml += '	<a href=\"/idearo/service/cmn/nct/CmnNoticeList.do?pageNm=Customer&crntMnuId=CUST_1\" id="M_CUST_1">
		<span>공지사항</span>
		</a>
		'; mnuHtml += '
		<a href=\"/idearo/service/cmn/cust/CustFaqList.do?crntMnuId=CUST_2&pageNm=Customer\" id="M_CUST_2"><span>FAQ </span>';
			mnuHtml += '	<a href=\"/idearo/service/cmn/cust/CustQnaList.do?crntMnuId=CUST_3&pageNm=Customer\" id="M_CUST_3"><span>Q&A </span>';
			mnuHtml += '	</div>';
			mnuHtml += '</div>';
			$( '#gnb' ).append( mnuHtml );
		} */

		{
			$( '#gnb' ).append( '<div class="gnb-menu"><a href="javascript:;"><span>플랫폼 소개</span></a><div class="sub-menu"><a href="/idearo/service/itr/pltfrm/itfIntrdctn.do?pageNm=/service/itr/pltfrm/&crntMnuId=1035" id="M_1035"><span>Dear Your Idea(플랫폼소개) </span></a><a href="/idearo/service/itr/pltfrm/itfmainIntrdctn.do?pageNm=/service/itr/pltfrm/&crntMnuId=1036" id="M_1036"><span>주요서비스 </span></a><a href="/idearo/service/itr/mns/selectItrMediaNewsList.do?pageNm=/itr/mns/&crntMnuId=1039" id="M_1039"><span>언론보도 </span></a><a href="/idearo/service/itr/pltfrm/successStory.do?pageNm=/service/itr/pltfrm/&crntMnuId=1038" id="M_1038"><span>성공스토리 </span></a><a href="/idearo/service/itr/evt/eventlist.do?pageNm=/service/itr/evt/&crntMnuId=1041" id="M_1041"><span>이벤트/행사 </span></a></div></div><div class="gnb-menu"><a href="javascript:;"><span>아이디어챌린지</span></a><div class="sub-menu"><a href="/idearo/service/idc/chlg/idcMain.do?pageNm=/service/idc/chlg&crntMnuId=1047" id="M_1047"><span>오늘의도전과제(기업과제 해결 ) </span></a><a href="/idearo/service/idc/srcng/idcMain.do?pageNm=/service/idc/srcng/&crntMnuId=1048" id="M_1048"><span>아이디어소싱(아이디어 구체화) </span></a><a href="/idearo/service/idc/faq/selectFaqList.do?pageNm=/idc/faq/&crntMnuId=1092" id="M_1092"><span>FAQ </span></a></div></div><div class="gnb-menu"><a href="javascript:;"><span>아이디어스토어</span></a><div class="sub-menu"><a href="/idearo/service/ids/store/ideaStoreList.do?pageNm=/ids&crntMnuId=1094" id="M_1094"><span>아이디어스토어(아이디어 판매) </span></a><a href="/idearo/service/ids/faq/selectFaqList.do?pageNm=/ids/faq/&crntMnuId=1116" id="M_1116"><span>FAQ </span></a></div></div><div class="gnb-menu"><a href="javascript:;"><span>아이디어광장</span></a><div class="sub-menu"><a href="/idearo/service/idp/petition/petitionList.do?pageNm=/idp/petition/&crntMnuId=1118" id="M_1118"><span>아이디어청원(불편사항 요청) </span></a><a href="/idearo/service/idp/shareList.do?pageNm=/service/idp/&crntMnuId=1124" id="M_1124"><span>아이디어나눔(아이디어 공유) </span></a><a href="/idearo/service/idp/edu/eduList.do?pageNm=/service/idp/edu/&crntMnuId=1127" id="M_1127"><span>교육 </span></a><a href="/idearo/service/cop/cmy/selectCommuMasterList.do?pageNm=/cmn/customer/&crntMnuId=1131" id="M_1131"><span>커뮤니티 </span></a><a href="/idearo/service/idp/faq/selectFaqList.do?pageNm=/idp/faq/&crntMnuId=1142" id="M_1142"><span>FAQ </span></a></div></div><div class="gnb-menu"><a href="javascript:;"><span>고객지원</span></a><div class="sub-menu"><a href="/idearo/service/cmn/cust/CustQnaList.do?crntMnuId=CUST_3&pageNm=Customer&pageNm=/service/cmn/cust/&crntMnuId=1147" id="M_1147"><span>Q&A </span></a><a href="/idearo/service/cmn/cust/CustFaqList.do?crntMnuId=CUST_2&pageNm=Customer&pageNm=/service/cmn/cust/&crntMnuId=1146" id="M_1146"><span>FAQ </span></a><a href="/idearo/service/cmn/nct/CmnNoticeList.do?pageNm=/service/cmn/nct&crntMnuId=1144" id="M_1144"><span>공지사항 </span></a></div></div>' );
			$( '#mbGnb' ).append( '<ul><li class="d1"><p>플랫폼 소개<em class="updown-arrow f-right"></em></p><ul><li class="d2"><a href="/idearo/service/itr/pltfrm/itfIntrdctn.do?pageNm=/service/itr/pltfrm/&crntMnuId=1035" id="M_1035">Dear Your Idea(플랫폼소개) <em class="arrow"></em></a></li><li class="d2"><a href="/idearo/service/itr/pltfrm/itfmainIntrdctn.do?pageNm=/service/itr/pltfrm/&crntMnuId=1036" id="M_1036">주요서비스 <em class="arrow"></em></a></li><li class="d2"><a href="/idearo/service/itr/mns/selectItrMediaNewsList.do?pageNm=/itr/mns/&crntMnuId=1039" id="M_1039">언론보도 <em class="arrow"></em></a></li><li class="d2"><a href="/idearo/service/itr/pltfrm/successStory.do?pageNm=/service/itr/pltfrm/&crntMnuId=1038" id="M_1038">성공스토리 <em class="arrow"></em></a></li><li class="d2"><a href="/idearo/service/itr/evt/eventlist.do?pageNm=/service/itr/evt/&crntMnuId=1041" id="M_1041">이벤트/행사 <em class="arrow"></em></a></li></ul></li></ul><ul><li class="d1"><p>아이디어챌린지<em class="updown-arrow f-right"></em></p><ul><li class="d2"><a href="/idearo/service/idc/chlg/idcMain.do?pageNm=/service/idc/chlg&crntMnuId=1047" id="M_1047">오늘의도전과제(기업과제 해결 ) <em class="arrow"></em></a></li><li class="d2"><a href="/idearo/service/idc/srcng/idcMain.do?pageNm=/service/idc/srcng/&crntMnuId=1048" id="M_1048">아이디어소싱(아이디어 구체화) <em class="arrow"></em></a></li><li class="d2"><a href="/idearo/service/idc/faq/selectFaqList.do?pageNm=/idc/faq/&crntMnuId=1092" id="M_1092">FAQ <em class="arrow"></em></a></li></ul></li></ul><ul><li class="d1"><p>아이디어스토어<em class="updown-arrow f-right"></em></p><ul><li class="d2"><a href="/idearo/service/ids/store/ideaStoreList.do?pageNm=/ids&crntMnuId=1094" id="M_1094">아이디어스토어(아이디어 판매) <em class="arrow"></em></a></li><li class="d2"><a href="/idearo/service/ids/faq/selectFaqList.do?pageNm=/ids/faq/&crntMnuId=1116" id="M_1116">FAQ <em class="arrow"></em></a></li></ul></li></ul><ul><li class="d1"><p>아이디어광장<em class="updown-arrow f-right"></em></p><ul><li class="d2"><a href="/idearo/service/idp/petition/petitionList.do?pageNm=/idp/petition/&crntMnuId=1118" id="M_1118">아이디어청원(불편사항 요청) <em class="arrow"></em></a></li><li class="d2"><a href="/idearo/service/idp/shareList.do?pageNm=/service/idp/&crntMnuId=1124" id="M_1124">아이디어나눔(아이디어 공유) <em class="arrow"></em></a></li><li class="d2"><a href="/idearo/service/idp/edu/eduList.do?pageNm=/service/idp/edu/&crntMnuId=1127" id="M_1127">교육 <em class="arrow"></em></a></li><li class="d2"><a href="/idearo/service/cop/cmy/selectCommuMasterList.do?pageNm=/cmn/customer/&crntMnuId=1131" id="M_1131">커뮤니티 <em class="arrow"></em></a></li><li class="d2"><a href="/idearo/service/idp/faq/selectFaqList.do?pageNm=/idp/faq/&crntMnuId=1142" id="M_1142">FAQ <em class="arrow"></em></a></li></ul></li></ul><ul><li class="d1"><p>고객지원<em class="updown-arrow f-right"></em></p><ul><li class="d2"><a href="/idearo/service/cmn/cust/CustQnaList.do?crntMnuId=CUST_3&pageNm=Customer&pageNm=/service/cmn/cust/&crntMnuId=1147" id="M_1147">Q&A <em class="arrow"></em></a></li><li class="d2"><a href="/idearo/service/cmn/cust/CustFaqList.do?crntMnuId=CUST_2&pageNm=Customer&pageNm=/service/cmn/cust/&crntMnuId=1146" id="M_1146">FAQ <em class="arrow"></em></a></li><li class="d2"><a href="/idearo/service/cmn/nct/CmnNoticeList.do?pageNm=/service/cmn/nct&crntMnuId=1144" id="M_1144">공지사항 <em class="arrow"></em></a></li></ul></li></ul>' );
		}

		$( '#mainBanner' ).append( '' );

	$( '#view-wrap #M_' + '1124' ).addClass( "active" );
		$( '#view-wrap #M_' + '1124' ).parent().parent().addClass( "active" );

	$( '#mo-view-wrap #M_' + '1124' ).addClass( "active" );
		$( '#mo-view-wrap #M_' + '1124' ).parent().parent().parent().addClass( "active" );

		$( "#hpcmRequstBtn" ).click( function()
		{
			$( "#hpcmRequstBtn" ).css("display", "none");
			fn_egov_regist_HpcmRequst( document.HpcmRequstVO );
		} );

		selectNewAlimCnt();
	} );

	function openHelpLayer()
	{
		// 초기화
		$( "#hpcmRequst_cmpnyNm" ).val( "" );
		$( "#hpcmRequst_chrgrNm" ).val( "" );
		$( "#hpcmRequst_email" ).val( "" );
		$( "#hpcmRequst_cntct" ).val( "" );
		$( "#hpcmRequst_cn" ).val( "" );

		layerPopupOpen( $( this ) , '#membershipHelp' );
	}
	// layer Popup Close
	$( document ).on( 'click' , '.btn-close' , function()
	{
		layerPopupClose( $( this ) );
	} );

	/** 검색 영역 Show */
	function showSearch()
	{
		/*
		var html = '<div id="serachBox" class="text-box">';
		html += '        <input type="text" id="mainSearch" placeholder="검색어를 입력해 주세요">';
		html += '		 <button type="button" class="btn-prev"></button>';			// TODO : 눌렀을 때 아이콘들 돌아오게
		html += '        <button type="button" onclick="javascript:goSearch()" class="btn-search"></button>';
		html += '   </div>';
		$("#headerToolBox").append(html);

		$('#mainSearch').focus();
		$('#mainSearch').keydown(function(event) {
			if (event.keyCode == '13') {
				event.preventDefault();
				goSearch();
			};
		});
		 */
		$( '#headerToolBox' ).hide();
		$( '#headerSearchBox' ).show();
		$( '#mainSearch' ).focus();
	}

	/** 모바일 검색 영역 Show */
	function showMobilSearch()
	{

		//$('#headerToolBox').hide();
		$( '#headerMobilSearchBox' ).show();

		$( '#mainSearchM' ).focus();
	}

	$( '#mainSearch' ).keydown( function( event )
	{
		if ( event.keyCode == '13' )
		{
			event.preventDefault();
			goSearch();
		}
		;
	} );

	/** 검색 영역에서 다시 처음 툴박스로 돌아가기 */
	function goHeaderToolBox()
	{
		$( '#headerSearchBox' ).hide();
		$( '#headerToolBox' ).show();
		$( '#mainSearch' ).val('');
	}

	function goSearch()
	{
		var keyword = $("#mainSearch").val();
		if (keyword.length < 1) {
			swal( "필수 " , "검색어를 입력해 주세요." , "warning" );
			return false;
		}
		
		keyword = encodeURI(keyword); 
	    document.location.href = '/idearo/service/cmn/search/search.do?mainSearch=' + keyword;
	}

	function goSearchM()
	{
		var keyword = $("#mainSearchM").val();
		
		if (keyword.length < 1) {
			alert("검색어를 입력해 주세요.");
			return false;
		}
		
		keyword = encodeURI(keyword);
		console.log(keyword);
    	document.location.href = '/idearo/service/cmn/search/search.do?mainSearch=' + keyword;
	}
	
	function onKeySearchM()
	{
		if (event.keyCode == 13) {
			goSearchM();
		}
	}
	
	function selectNewAlimCnt()
	{
		$.ajax( {
			url : "/idearo/service/mym/chatAlim/checkNewAlim.do" ,
			type : "POST" ,
			success : function( data , textStatus , jqXHR )
			{
				if ( data != null && data.status == "100" )
				{
					if ( data.newAlimTarkCnt && data.newAlimTarkCnt != "0" && !isEmpty(data.newAlimTarkCnt) )
					{
						$( "span[name=spAlimIcon]" ).append( "<em>" + data.newAlimTarkCnt + "</em>" );
					}
					if ( data.newChatRoomCnt && data.newChatRoomCnt != "0" && !isEmpty(data.newChatRoomCnt) )
					{
						$( "span[name=spChatIcon]" ).append( "<em>" + data.newChatRoomCnt + "</em>" );
					}
				}
			} ,
			error : function( jqXHR , textStatus , errorThrown )
			{
			}
		} );
	}
</script>

	<div class="bg-type1" aria-hidden="false">
		<!-- view-wrap S -->
		<div id="challenge-wrap">
			<div id="content">
				<div class="challenge-list-area">
					<div class="visual-wrap sub08">
						<p class="tit">
							아이디어 나눔
						</p>
						<p class="txt">
							내게는 작은 아이디어지만, 누군가에게는 정말 소중하고 귀한 아이디어일 수 있습니다.
							<br>
							나의 아이디어를 필요로 하는 모든 사람들에게 나누어 주세요.
						</p>
						<a class="line" href="/idearo/guide/pdf/이용방법_및_주의사항(아이디어_나눔).pdf" target="_blank" title="개인회원 아이디어 나눔 가이드">
							<span>이용방법 및 주의사항</span>
						</a>
						
						
							
								<div class="btn-box">
									<a class="bg" href="ideaShareRgstview.do">
										<span>
											아이디어나눔 등록
										</span>
									</a>
									
								</div>
							
							
						
					</div>
					<form id="searchVO" name="searchVO" action="shareList.do" method='post'>
						<div class="challenge-list-wrap">
							<div class="category-box">
								<span class="cmm-radio checked" data="ALL">
									<input type="radio" name="radio_lrgCtgry" id="category-type-1">
									<label for="category-type-1">전체</label>
								</span>
								
									<span class="cmm-radio" data="CAT010">
										<input type="radio" name="radio_lrgCtgry" id="category-type-2">
										<label for="category-type-2">
											생활/주방/육아
										</label>
									</span>
								
									<span class="cmm-radio" data="CAT020">
										<input type="radio" name="radio_lrgCtgry" id="category-type-3">
										<label for="category-type-3">
											패션/잡화/뷰티
										</label>
									</span>
								
									<span class="cmm-radio" data="CAT030">
										<input type="radio" name="radio_lrgCtgry" id="category-type-4">
										<label for="category-type-4">
											식자재/식음료/기호제품
										</label>
									</span>
								
									<span class="cmm-radio" data="CAT040">
										<input type="radio" name="radio_lrgCtgry" id="category-type-5">
										<label for="category-type-5">
											의료/건강/방역/위생
										</label>
									</span>
								
									<span class="cmm-radio" data="CAT050">
										<input type="radio" name="radio_lrgCtgry" id="category-type-6">
										<label for="category-type-6">
											가전/모바일/게임/광학기기
										</label>
									</span>
								
									<span class="cmm-radio" data="CAT060">
										<input type="radio" name="radio_lrgCtgry" id="category-type-7">
										<label for="category-type-7">
											건축/건설/토목/환경
										</label>
									</span>
								
									<span class="cmm-radio" data="CAT070">
										<input type="radio" name="radio_lrgCtgry" id="category-type-8">
										<label for="category-type-8">
											기계/에너지
										</label>
									</span>
								
									<span class="cmm-radio" data="CAT080">
										<input type="radio" name="radio_lrgCtgry" id="category-type-9">
										<label for="category-type-9">
											화학/바이오/소재
										</label>
									</span>
								
									<span class="cmm-radio" data="CAT090">
										<input type="radio" name="radio_lrgCtgry" id="category-type-10">
										<label for="category-type-10">
											전기/전자/정보통신
										</label>
									</span>
								
									<span class="cmm-radio" data="CAT100">
										<input type="radio" name="radio_lrgCtgry" id="category-type-11">
										<label for="category-type-11">
											미디어/컨텐츠/여가/스포츠
										</label>
									</span>
								
									<span class="cmm-radio" data="CAT110">
										<input type="radio" name="radio_lrgCtgry" id="category-type-12">
										<label for="category-type-12">
											사무/전문서비스
										</label>
									</span>
								
									<span class="cmm-radio" data="CAT120">
										<input type="radio" name="radio_lrgCtgry" id="category-type-13">
										<label for="category-type-13">
											기타
										</label>
									</span>
								
							</div>
						</div>
						<div class="search-box t-center">
							<span class="cmm-input wd">
								<input type="text" title="키워드 입력" name="searchKeyword"  value= "" placeholder="키워드를 입력해주세요">
							</span>
							<button type="submit" class="search">
								<span>검색</span>
							</button>
						</div>
						<div class="cmm-top-box border-none">
							<h2 class="cmm-tit-h2">
								전체 목록
							</h2>
							<div class="t-right">
								<span class="cmm-select">
									<select title="정렬 선택" id="sel_searchOrdr" name="searchCondition">
										<option value="1" selected>최신순</option>
										<option value="2">제목순</option>
										<option value="3">조회순</option>
										<option value="4">평점순</option>
									</select>
								</span>
							</div>
						</div>
						<input id="lrgCtgry" name="lrgCtgry" type="hidden" value="">
						<input id="searchOrdr" name="searchCondition" type="hidden" value="">
						<input id="pageIndex" name="pageIndex" type="hidden" value="1">
					</form>
					<div class="challenge-list-wrap">
						<ul class="list-box star-box p-l0">
							
							
								<li>
									<div class="category">
										건축․건설․토목 자재/설비/장비/용품 관련
									</div>
									<a href="IdeaShareDetail.do?pageNm=/service/idp/&crntMnuID=1124&shareId=IDEASHARE_0000001900" class="tit ">
										맨홀 추락방지 사다리 도입으로 안전한 작업환경 조성
									</a>
									<p class="name">
										<em>
											shshin**
										</em>
										<em>
											2022-06-20
										</em>
										<em class="view">
											83
										</em>
									</p>
									<div class="star-num">
										<span>
											<em class="star-avg"></em>
											<strong class="star-rate">
												0.0
											</strong>
										</span>
									</div>
								</li>
							
								<li>
									<div class="category">
										아웃도어/스포츠 관련
									</div>
									<a href="IdeaShareDetail.do?pageNm=/service/idp/&crntMnuID=1124&shareId=IDEASHARE_0000001929" class="tit ">
										위치추적기가 달려있는 우산
									</a>
									<p class="name">
										<em>
											qwer53**
										</em>
										<em>
											2022-06-20
										</em>
										<em class="view">
											33
										</em>
									</p>
									<div class="star-num">
										<span>
											<em class="star-avg"></em>
											<strong class="star-rate">
												0.0
											</strong>
										</span>
									</div>
								</li>
							
								<li>
									<div class="category">
										영상/음향가전 관련
									</div>
									<a href="IdeaShareDetail.do?pageNm=/service/idp/&crntMnuID=1124&shareId=IDEASHARE_0000001895" class="tit ">
										모션 인식 TV (손을 움직여서 채널이나 음량을 조절할 수 있음)
									</a>
									<p class="name">
										<em>
											qwer53**
										</em>
										<em>
											2022-06-15
										</em>
										<em class="view">
											23
										</em>
									</p>
									<div class="star-num">
										<span>
											<em class="star-avg"></em>
											<strong class="star-rate">
												0.0
											</strong>
										</span>
									</div>
								</li>
							
								<li>
									<div class="category">
										청소/욕실/식기/조리도구/주방용품 관련
									</div>
									<a href="IdeaShareDetail.do?pageNm=/service/idp/&crntMnuID=1124&shareId=IDEASHARE_0000001881" class="tit ">
										건조기능발매트
									</a>
									<p class="name">
										<em>
											bloomin**
										</em>
										<em>
											2022-06-15
										</em>
										<em class="view">
											30
										</em>
									</p>
									<div class="star-num">
										<span>
											<em class="star-avg"></em>
											<strong class="star-rate">
												0.0
											</strong>
										</span>
									</div>
								</li>
							
								<li>
									<div class="category">
										기타
									</div>
									<a href="IdeaShareDetail.do?pageNm=/service/idp/&crntMnuID=1124&shareId=IDEASHARE_0000001855" class="tit ">
										소리함
									</a>
									<p class="name">
										<em>
											bloomin**
										</em>
										<em>
											2022-06-15
										</em>
										<em class="view">
											13
										</em>
									</p>
									<div class="star-num">
										<span>
											<em class="star-avg"></em>
											<strong class="star-rate">
												0.0
											</strong>
										</span>
									</div>
								</li>
							
								<li>
									<div class="category">
										기타 패션/잡화/뷰티용품 관련
									</div>
									<a href="IdeaShareDetail.do?pageNm=/service/idp/&crntMnuID=1124&shareId=IDEASHARE_0000001851" class="tit ">
										힐로 변신하는 단화
									</a>
									<p class="name">
										<em>
											bloomin**
										</em>
										<em>
											2022-06-15
										</em>
										<em class="view">
											33
										</em>
									</p>
									<div class="star-num">
										<span>
											<em class="star-avg"></em>
											<strong class="star-rate">
												0.0
											</strong>
										</span>
									</div>
								</li>
							
								<li>
									<div class="category">
										기타
									</div>
									<a href="IdeaShareDetail.do?pageNm=/service/idp/&crntMnuID=1124&shareId=IDEASHARE_0000001871" class="tit ">
										현수막으로 만든 드레스 문화제
									</a>
									<p class="name">
										<em>
											bloomin**
										</em>
										<em>
											2022-06-15
										</em>
										<em class="view">
											15
										</em>
									</p>
									<div class="star-num">
										<span>
											<em class="star-avg"></em>
											<strong class="star-rate">
												0.0
											</strong>
										</span>
									</div>
								</li>
							
								<li>
									<div class="category">
										화장품/미용/다이어트 관련
									</div>
									<a href="IdeaShareDetail.do?pageNm=/service/idp/&crntMnuID=1124&shareId=IDEASHARE_0000001841" class="tit ">
										화장품유효기간아이디어
									</a>
									<p class="name">
										<em>
											kakaka10**
										</em>
										<em>
											2022-06-10
										</em>
										<em class="view">
											48
										</em>
									</p>
									<div class="star-num">
										<span>
											<em class="star-avg"></em>
											<strong class="star-rate">
												4.0
											</strong>
										</span>
									</div>
								</li>
							
								<li>
									<div class="category">
										기타 건축/건설/토목/환경용품 관련
									</div>
									<a href="IdeaShareDetail.do?pageNm=/service/idp/&crntMnuID=1124&shareId=IDEASHARE_0000001753" class="tit ">
										라이스 페이퍼 빨대
									</a>
									<p class="name">
										<em>
											ojt14**
										</em>
										<em>
											2022-06-07
										</em>
										<em class="view">
											17
										</em>
									</p>
									<div class="star-num">
										<span>
											<em class="star-avg"></em>
											<strong class="star-rate">
												0.0
											</strong>
										</span>
									</div>
								</li>
							
								<li>
									<div class="category">
										기타 전기/전자/정보통신 제품 관련
									</div>
									<a href="IdeaShareDetail.do?pageNm=/service/idp/&crntMnuID=1124&shareId=IDEASHARE_0000001780" class="tit ">
										전기가 생산되는 헬스장
									</a>
									<p class="name">
										<em>
											kimm14**
										</em>
										<em>
											2022-06-07
										</em>
										<em class="view">
											62
										</em>
									</p>
									<div class="star-num">
										<span>
											<em class="star-avg"></em>
											<strong class="star-rate">
												4.0
											</strong>
										</span>
									</div>
								</li>
							
						</ul>
						<div class="cmm-paging-box" id="page">
											<button type="button" class="btn-first"  onclick="javascript:fn_egov_select_linkPage('1')" disabled>
					처음으로이동
				</button>
				<button type="button" class="btn-prev"  onclick="javascript:fn_egov_select_linkPage('1')" disabled>
					이전으로이동
				</button>
				<div class="paging">
					<button type="button" class="active" onclick="javascript:fn_egov_select_linkPage('1'); return false;">
						<span>1</span>
					</button>
					<button type="button" onclick="javascript:fn_egov_select_linkPage('2'); return false;">
						<span>2</span>
					</button>
					<button type="button" onclick="javascript:fn_egov_select_linkPage('3'); return false;">
						<span>3</span>
					</button>
					<button type="button" onclick="javascript:fn_egov_select_linkPage('4'); return false;">
						<span>4</span>
					</button>
					<button type="button" onclick="javascript:fn_egov_select_linkPage('5'); return false;">
						<span>5</span>
					</button>
					<button type="button" onclick="javascript:fn_egov_select_linkPage('6'); return false;">
						<span>6</span>
					</button>
					<button type="button" onclick="javascript:fn_egov_select_linkPage('7'); return false;">
						<span>7</span>
					</button>
					<button type="button" onclick="javascript:fn_egov_select_linkPage('8'); return false;">
						<span>8</span>
					</button>
					<button type="button" onclick="javascript:fn_egov_select_linkPage('9'); return false;">
						<span>9</span>
					</button>
					<button type="button" onclick="javascript:fn_egov_select_linkPage('10'); return false;">
						<span>10</span>
					</button>
				</div>
				<button type="button" class="btn-next"  onclick="javascript:fn_egov_select_linkPage('2')">
					다음으로이동
				</button>
				<button type="button" class="btn-last"  onclick="javascript:fn_egov_select_linkPage('23')">
					마지막으로이동
				</button>


						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- view-wrap E -->
	


<div id="footer" style="display:">
	<div class="top-box">
		<div class="inner">
			<div class="site-link">
				<!--<a href="/idearo/service/cmn/intro/introManageShow.do?introManageId=INTROMNG_00000000020">
					<span>
						이용안내
						
					</span>
				</a>
				<a href="/idearo/service/cmn/intro/introManageShow.do?introManageId=INTROMNG_00000000021">
					<span>
						저작권정책
						
					</span>
				</a> -->
				<a class="mdn" href="/idearo/service/cmn/intro/introManageShow.do?introManageId=INTROMNG_00000000022">
					<span>
						개인정보 <br>처리방침
						
					</span>
				</a>
				<a class="mdn" href="/idearo/service/cmn/intro/introManageShow.do?introManageId=INTROMNG_00000000023">
					<span>
						개인정보 <br>침해신고
						
					</span>
				</a>
				<a class="mdn" href="/idearo/service/cmn/intro/introManageShow.do?introManageId=INTROMNG_00000000024">
					<span>
						 이용약관
						
					</span>
				</a>
					   <!-- <a href="mailto:east@kipa.org"> -->  
					     
					 <!-- <input type="button" value="아이디어 탈취 및 도용신고" onclick="go_pop()"> -->
				<a href="/idearo/service/cmn/intro/introManageShow.do?introManageId=INTROMNG_00000000030">
					<span style="margin-right:15px;">
						아이디어 탈취 및 도용신고
						
					</span>
					</a>				
				
			</div>
			
			<div data-ui-toggle="footer" class="select-link" style="height:80px" >
				<button type="button" class="site" aria-expanded="false">
					<span>
						관련 사이트
						
					</span>
					<em class="open">
						열기
						
					</em>
					<em class="close">
						닫기
						
					</em>
				</button>
				<div class="view-box">
					
						<a href="https://www.ippolice.go.kr/bp/main/main.do" target="blank">
							<span>
								산업재산 침해 신고센터
							</span>
						</a>
					
						<a href="https://www.kipo.go.kr/" target="blank">
							<span>
								특허청
							</span>
						</a>
					
						<a href="https://www.kipa.org/" target="blank">
							<span>
								발명진흥회
							</span>
						</a>
					
						<a href="http://www.ipmarket.or.kr/" target="blank">
							<span>
								국가지식재산거래플랫폼
							</span>
						</a>
					
						<a href="https://www.patent.go.kr/" target="blank">
							<span>
								특허로
							</span>
						</a>
					
						<a href="http://www.kipris.or.kr/khome/main.jsp" target="blank">
							<span>
								키프리스
							</span>
						</a>
					
				</div>
			</div>
			
			<div class="t13">
				본 사이트는 구글 크롬, MS 엣지에 최적화 되어 있습니다. <br>
				타 브라우저에서는 일부기능이 동작하지 않을 수 있습니다.
			</div>
			
		</div>
	</div>
			
	<div class="bottom-box">
		<div class="inner">
                <div>
                    <!--  a href="#" class="logo"><span>IDEARO</span></a-->
                    <p class="spc-logo01"></p>
                    <p>35208 대전광역시 서구 청사로 189 (둔산동) 정부대전청사 4동</p>
                    <!-- p>대표전화 : 1544-8080 | Fax : 042-489-0184</p -->
                    <p>Copyright ⓒ KIPO All Rights Reserved.</p> 
                      <!--<p class="spc-logo02"></p>
                    <p>06133 서울특별시 강남구 테헤란로 131(역삼동, 발명진흥회)</p>
                    <p>대표전화 : 02-3459-2809/2728 | Fax : 02-3459-2999</p><br>
                    <p>E-mail : idea@kipa.org<p>-->
                </div> 
                <!-- <p class="email"><a href="mailto:east@kipa.org"></a></p> -->
               <div class="f-right">
                <p class="spc-logo02"></p>
                    <p>06133 서울특별시 강남구 테헤란로 131(역삼동, 발명진흥회)</p>
                    <p>대표전화 : 02-3459-2809/2728 | Fax : 02-3459-2999</p><br>
                    <p>E-mail : idea@kipa.org | 사업자등록번호 : 214-82-04275<p>
                </div> 
            </div>
	</div>
</div>
</div>

<div class="modal fade" id="modal-overlay">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="overlay d-flex justify-content-center align-items-center">
				<i class="fas fa-2x fa-sync fa-spin"></i>
			</div>
			<div class="modal-header">
				<h4 class="modal-title">Default Modal</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="preloader1">
					<svg class="circular" viewBox="25 25 50 50">
						<circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
				</div>
			</div>
			<div class="modal-footer justify-content-between">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
		
	</div>
	
</div>

<script type="text/javascript" src="/idearo/assets/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript" src="/idearo/assets/plugins/jquery/jquery.slimscroll.js" charset="utf-8"></script>
<script type="text/javascript" src="/idearo/js/kpoip/service/getInit.js" charset="utf-8"></script>



	
	<script type="text/javascript" src="/idearo/assets/plugins/synapEditor/synapeditor.config.js" charset="utf-8"></script>
	<script type="text/javascript" src="/idearo/assets/plugins/synapEditor/synapeditor.min.js" charset="utf-8"></script>
	
	<script type="text/javascript" src="/idearo/assets/plugins/synapEditor/externals/SEDocModelParser/SEDocModelParser.min.js" charset="utf-8"></script>
	
	<script type="text/javascript" src="/idearo/assets/plugins/synapEditor/externals/SEShapeManager/SEShapeManager.min.js" charset="utf-8"></script>


<script type="text/javascript">
	function go_pop(){
		window.open("/idearo/service/cmn/ideapop.do","new","width=370, height=360, resizable=no, status=no, location=no, directories=no;");
	}
</script>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-VLS8SY0LN9"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-VLS8SY0LN9');
</script>

<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PC5KCWG"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<!-- Naver Analytics -->
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
if(!wcs_add) var wcs_add = {};
wcs_add["wa"] = "fd787b651a2988";
if(window.wcs) {
  wcs_do();
}
</script>
<!-- Naver Analytics -->

<script>
	$.post("/idearo/assets/api/page_title.jsp", {
		"uri": location.pathname
	}).done(function(res) {
		console.log(res);
		document.title = res;
	});
</script>






	



	<script type="text/javascript">
		$( document ).ready( function()
		{
			$( "#sel_searchOrdr" ).change( function()
			{
				var value = $( this ).val();
				$( '#searchOrdr' ).val( value );
				fn_idp_search_petit();
			} );

			$( "input:radio[name=radio_lrgCtgry]" ).click( function()
			{
				var value = $( this ).parent().attr( 'data' );
				$( '#lrgCtgry' ).val( value );
				fn_idp_search_petit();
			} );
		} )

		function fn_idp_search_petit()
		{
			document.searchVO.pageIndex.value = 1;
			document.searchVO.submit();
		}

		function fn_egov_select_linkPage( pageNo )
		{
			document.searchVO.pageIndex.value = pageNo;
			document.searchVO.action = "/idearo/service/idp/shareList.do?crntMnuId=1124&pageNm=/service/idp/";
			document.searchVO.submit();
		}
		function setSearch()
		{

			//default
			if ( $( '#searchOrdr' ).val() == "" )
				$( "#searchOrdr" ).val( 1 );
			if ( $( '#lrgCtgry' ).val() == "" )
				$( "#lrgCtgry" ).val( "ALL" );

			//순서
			$( "#sel_searchOrdr" ).val( $( '#searchOrdr' ).val() );

			//분야
			$( "input:radio[name=radio_lrgCtgry]" ).each( function()
			{
				var value = $( this ).parent().attr( 'data' );
				if ( value == $( '#lrgCtgry' ).val() )
				{
					$( this ).parent().addClass( "checked" );
				}
				else
				{
					$( this ).parent().removeClass( "checked" );
				}
			} )

		}

		$( "#nonUserCheck" ).click( function()
		{
			swal( "확인" , "전문가는 등록할 수 없습니다." , "warning" );
		} )
	</script>
</body>
</html>