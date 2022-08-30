$( function()
{
	$( ".preloader" ).fadeOut();
} );

var pageUrl = $( location ).attr( "pathname" ).split( "/" ); // get
// page_url[ex)/ts/menu/get.do]

var serviceName = pageUrl[ 1 ]; // ts
var aliasName1 = pageUrl[ 2 ]; // alias
var aliasName2 = pageUrl[ 3 ]; // alias

function getUrlVar( key )
{
	var result = new RegExp( key + "=([^&]*)" , "i" ).exec( $( location ).attr( "search" ) );
	return result && unescape( result[ 1 ] ) || "";
}

( function( $ )
{
	'use strict'
	// /*왼쪽 메뉴 시작 */
	// /*
	// //$("#gnb").empty();
	// $.ajax({
	// url : serviceRoot+"/sym/mnu/mpm/mnuList.do",
	// type : "POST",
	// dataType : "json",
	// contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	// data : {
	// mnu_id : "1"
	// },
	// beforeSend : function() { //
	//
	// },
	// success : function(data, textStatus, jqXHR) {
	// //console.log("data"+ JSON.stringify(data.data));
	// //$("#gnb").append(data.data);
	// },
	// error : function(jqXHR, textStatus, errorThrown) {
	// // if fails
	// }
	//
	// });
	//
	//
	//
	// setTimeout(function(){
	// pageCrumb(crntMnuId);
	// }, 300);
	// */
	// /*페이지명, 단계 구조 및 메뉴 고정 끝 */

} )( jQuery )

function pageCrumb( parameter )
{

	$.ajax( {
		url : serviceRoot + "/sym/mnu/mpm/crumb.do" ,
		type : "POST" ,
		dataType : "json" ,
		contentType : "application/x-www-form-urlencoded; charset=UTF-8" ,
		data : {
			crntMenuId : parameter
		} ,
		beforeSend : function()
		{ //

		} ,
		success : function( data , textStatus , jqXHR )
		{

			// 페이지 타이틀
			var page_title = "<h3 class=\"m-0 text-dark\" >" + data[ 0 ][ "MENU_NM" ] + "</h3>";
			$( "#page_title" ).html( page_title );

			$( "#breadcrumb_view" ).empty();
			var arrNm = data[ 0 ][ "CRUMB_NM" ].split( '>' );
			var breadcrumb_view = "<ol class=\"breadcrumb float-sm-right\">";
			breadcrumb_view += "<li class=\"breadcrumb-item\"><a href=\"#\">Home</a></li>";

			$.each( arrNm , function( idx , val )
			{
				// if(idx > 0){
				if ( idx == ( arrNm.length - 1 ) )
				{
					breadcrumb_view += "<li class=\"breadcrumb-item active\">" + val + "</li>";
				}
				else
				{
					breadcrumb_view += "<li class=\"breadcrumb-item\">" + val + "</li>";
				}
				// }
				// console.log("idx::" + idx + "name:" + val +" id " + arrId[idx]);
			} );
			breadcrumb_view += '</ol>';
			$( "#breadcrumb_view" ).append( breadcrumb_view );
			// 메뉴 고정
			setTimeout( function()
			{
				var breadcrumbArr = data[ 0 ][ "CRUMB_ID" ].split( ',' );
				leftMnuSelectCss( breadcrumbArr );
			} , 100 );

		} ,
		error : function( jqXHR , textStatus , errorThrown )
		{
			// if fails
		}

	} );

}

// 메뉴 고정하기
function leftMnuSelectCss( breadcrumbArr )
{
	$.each( breadcrumbArr , function( idx , val )
	{
		// console.log("idx::" + idx + "name:" + val);
		if ( idx == new String( "0" ) )
		{
			$( "#M_" + val ).attr( "class" , "nav-item menu-open" );
			$( "#M_" + val + " a" ).first().attr( "class" , "nav-link active" );
		}
		else if ( idx == new String( "1" ) )
		{

			$( "#M_" + val ).attr( "class" , "nav-item menu-open" );
			$( "#M_" + val + " a" ).first().attr( "class" , "nav-link  active" );
		}
		else if ( idx == new String( "2" ) )
		{

			$( "#M_" + val ).attr( "class" , "nav-item menu-open" );
			$( "#M_" + val + " a" ).first().attr( "class" , "nav-link  active" );
		}
		else if ( idx == new String( "3" ) )
		{
			// $("#M_"+arrId[idx]).attr("class","nav-item menu-open");
			$( "#M_" + val + " a" ).first().attr( "class" , "nav-link  active" );
		}
	} );
}

function gotoAdminPage( p_id )
{

	// gotoPage
	$.ajax( {
		url : serviceRoot + "/admin/mnuMngt/view.do" ,
		type : "POST" ,
		dataType : "json" ,
		data : {
			mnu_id : p_id
		} ,
		beforeSend : function()
		{ //

		} ,
		success : function( data , textStatus , jqXHR )
		{
			var gotoPage = serviceRoot + "/gotoAdminPage.do";
			gotoPage += "?pageNm=" + data[ "MNU_JSP_PGE" ];
			gotoPage += "&curId=" + p_id;
			$( location ).attr( 'href' , gotoPage );
		} ,
		error : function( jqXHR , textStatus , errorThrown )
		{
			// if fails
		}
	} );
}

/** *********************************************************************************************************** */
/** *********************************************************************************************************** */
/** ************************************* 상단 바로가가기(관리실..) 바로가기 ****************************** */
/** *********************************************************************************************************** */
/** *********************************************************************************************************** */

function goMyMenu()
{

	var url = serviceRoot + "/menu/getRoleMenuListData.do";
	$.ajax( {

		url : url ,
		type : "post" ,
		data : {
			bi_portal_menu_parent_id : "#"
		} ,
		datatype : 'json' ,
		beforeSend : function()
		{

			// strTopMenu += "<div id=\"box-1\"><img src=\"../assets/images/img/ajax-loader_blue.gif\"></div>";
			// strTopMenu += "<li style=\"margin-left:45%\"><img src=\"../assets/images/img/ajax-loader_blue.gif\"></li>";
			// $("#topMenu").html(strTopMenu);

		} ,
		success : function( data )
		{

			// alert(JSON.stringify(data));

			var strTopMenu = "";

			strTopMenu += "<li><a href=\"#\" onClick=\"goHome();\">HOME</a></li>";

			$.each( data , function( key , value )
			{

				if ( data[ key ][ 0 ] != menuServCode )
				{ // 서비스 코드만 없어짐

					if ( data.length == ( key + 1 ) )
					{
						strTopMenu += "<li style=\"border-right:none;\"><a href=\"#\" onClick=\"" + data[ key ][ 3 ] + "\">" + data[ key ][ 2 ] + "</a></li>";

					}
					else
					{

						strTopMenu += "<li><a href=\"#\" onClick=\"" + data[ key ][ 3 ] + "\">" + data[ key ][ 2 ] + "</a></li>";
					}
				}
			} );

			$( "#topHome" ).html( strTopMenu );

		} ,
		error : function()
		{

			$( "#progress_modal" ).modal( 'hide' );
			$( ".progress" ).hide();
			$( '.progress-bar' ).attr( 'aria-valuetransitiongoal' , 0 ).progressbar();
			$( "#session_modal" ).modal( "show" );
			$( "#session_msg" ).html( "페이지 접속시간이 만료되었습니다." );

		}
	} );
}

/** *********************************************************************************************************** */
/** *********************************************************************************************************** */
/** ************************************* 사용자 정보 ****************************** */
/** *********************************************************************************************************** */
/** *********************************************************************************************************** */
function getUser()
{

	var url = serviceRoot + "/userInfo/getUserInfo.do";
	$.ajax( {

		url : url ,
		type : "post" ,
		datatype : 'json' ,
		// / beforeSend: function () {
		// },
		success : function( data )
		{

			var userStr = "";
			if ( data.rows[ 'bi_unity_cust_id' ] == 'admin' )
			{
				userStr += "<a href=\"#\" onClick=\"goInit();\" title=\"초기설정\"><span class=\"glyphicon glyphicon-cog\"></span></a>&nbsp;";
			}

			userStr += data.rows[ 'bi_deptnm' ] + " (" + data.rows[ 'bi_user_nm' ] + ")";
			$( "#userInfo" ).html( userStr );
			$( "#pmLoginID" ).val( data.id );
		} ,
		error : function()
		{

			// $("#progress_modal").modal('hide');
			// $(".progress").hide();
			// $('.progress-bar').attr('aria-valuetransitiongoal', 0).progressbar();
			$( "#session_modal" ).modal( "show" );
			$( "#session_msg" ).html( "페이지 접속시간이 만료되었습니다." );

		}
	} );

}

/** ******************************************************************* */
/** ********************* 로그아웃 페이지 이동********************** */
/** ******************************************************************** */
function logout()
{
	var gotoPage = serviceRoot + "/j_spring_security_logout";
	$( location ).attr( 'href' , gotoPage );
}

/** ************************************************************ */
/** ********************** 로그인 페이지 이동********************** */
/** ********************************************************** */
function gotoLoginPage()
{
	location.href = serviceRoot + "/service/cmn/login/loginUsr.do";
}

/** ************************************************************ */
/** ********************** 메일 주소 변경 ********************** */
/** ********************************************************** */
function fnChangeEmail( targetId , mailAddr )
{
	if ( !isEmpty( mailAddr ) )
	{
		var email = $("#" + targetId).val();
		if(email.indexOf('@')){
			var emailSp =email.split("\@");
			$( "#" + targetId ).val(emailSp[0]+ "@" + mailAddr);
		}else{
			$( "#" + targetId ).val($("#" + targetId).val()+ "@" + mailAddr );
		}
	}
	else
	{
		$( "#" + targetId ).val( "" );
	}
}

/** ************************************************ */
// Validation 체크- 2020.03.03
/** ************************************************* */

function isEmpty( value )
{
	if ( value == "" //
			|| value == null //
			|| value == undefined //
			|| ( value != null && typeof value == "object" && !Object.keys( value ).length ) //
	)
	{
		return true;
	}
	else
	{
		return false;
	}
};

/** ******************************************************* */
/** 문자열 -> 태그 변환 */
/** ****************************************************** */
function replaceStrToTag( val )
{
	if ( val )
	{
		return val.replace( /&amp;/g , '&' ).replace( /&lt;/g , '<' ).replace( /&gt;/g , '>' ).replace( /&quot;/g , '"' ).replace( /&#39;/g , '\\' );
	}
	return "";
}
/** ******************************************************************* */
/** ********************* 파일업로드 시작 ********************** */
/** ******************************************************************** */
// +++++++++++++++++++++파일사이즈표시 정보추가 ++++++++++++++++++++++++++++++//
function getFileSize( x )
{
	if ( x > 0 )
	{
		var s = [
				'BYTE' , 'KB' , 'MB' , 'GB' , 'TB' , 'PB'
		];
		var e = Math.floor( Math.log( x ) / Math.log( 1024 ) );
		return ( ( x / Math.pow( 1024 , e ) ).toFixed( 2 ) + " " + s[ e ] );
	}
	else
	{
		return "0";
	}

}

// 업로드된 파일 정보 HTML추가
function addHtml( appendInputId , atchFileId , orignlFileNm , streFileNm , fileMg , fileSe , fileSn , fileExtsn )
{
	// start the table
	var html = '';
	html += '<div class="cmm-input" id="fileView_' + atchFileId + '">';
	html += '<input type="hidden" name="fileSn" id="fileSn" value="' + fileSn + '">';
	html += '<input type="hidden" name="fileSe" id="fileSe" value="' + fileSe + '">';
	html += '<input type="hidden" name="streFileNm" id="streFileNm" value="' + streFileNm + '">';
	html += '<input type="hidden" name="atchFileId" id="atchFileId" value="' + atchFileId + '">';
	html += '<input type="text" title="파일명" value="' + orignlFileNm + ' (' + getFileSize( fileMg ) + ')" onclick="fn_downFile(\'' + atchFileId + '\', \'' + fileSn + '\');">';
	html += '<button type="button" class="trash" onclick="fileDel(\'' + atchFileId + '\',\'' + orignlFileNm + '\',\'' + KeyStr + '\');"><span>삭제</span></button>';
	html += '</div>';
	// insert into div
	$( "#" + appendInputId ).after( html );
	$( "#fileEmpty_1" ).hide();
	$( "#fileEmpty_2" ).hide();
	// $("#"+appendInputId+" #defaultFileMsg").remove();

}

function fileUplad( formName , fileUploadId , appendInputId , fileSe , cnt , updateYn )
{ // #files,#appendInputs

	var files = $( "#" + fileUploadId ).prop( "files" );
	var file = null;
	// for(var i=0;i< files.length;i++){
	file = files[ 0 ];
	var fileName = file.name;
	var end = fileName.lastIndexOf( "\." );
	var name = fileName.substring( 0 , end );
	var type = fileName.substring( end + 1 );

	if ( updateYn == "Y" )
	{ // 최종파일업로드 한개만 ..
		fileEmpty( fileUploadId , appendInputId );
		$( "#appendInputView_0" ).empty();
	}

	var orgFileNms = '<input type="hidden" name="orgFileNms" value="' + name + '" />';
	var fileExts = '<input type="hidden" name="fileExts" value="' + type + '" />';
	var keyStrs = '<input type="hidden" name="keyStrs" value="' + KeyStr + '" />';
	var fileSns = '<input type="hidden" name="fileSns" value="' + cnt + '" />';
	$( "#" + appendInputId ).append( orgFileNms );
	$( "#" + appendInputId ).append( fileExts );
	$( "#" + appendInputId ).append( keyStrs );
	$( "#" + appendInputId ).append( fileSns );

	var extFormat = "\(pdf|PDF|zip|ZIP|csv|CSV|xls|XLS|xlsx|txt|TXT|doc|DOCX|ppt|PPT|pptx|PPTX|jpg|JPG|jpeg|JPEG|png|PNG)";
	// var extFormat = "\(xls|XLS|xlsx|XLSX)";
	if ( !( new RegExp( extFormat , 'i' ) ).test( type ) )
	{

		fileEmpty( fileUploadId , appendInputId );
		swal( {
			title : '' ,
			text : '지원되는 파일유형이 아닙니다.' ,
			showConfirmButton : false ,
			timer : 2000
		} );
		return;
	}

	var formData = new FormData( formName[ 0 ] );
	formName.attr( "enctype" , "multipart/form-data" );
	// /*
	// for (let key of formData.keys()) {
	// console.log(key);
	// }
	// for (let value of formData.values()) {
	// console.log(value);
	// }
	// */
	// enctype="multipart/form-data"
	$.ajax( {
		type : 'POST' ,
		enctype : "multipart/form-data" ,
		url : serviceRoot + "/service/upload/fileuploadform.do" ,
		data : formData ,
		processData : false ,
		contentType : false ,
		cache : false ,
		async : false ,
		timeout : 600000 ,
		beforeSend : function()
		{ //
		} ,
		success : function( result , textStatus , jqXHR )
		{
			fileEmpty( fileUploadId , appendInputId );
			swal( {
				title : '' ,
				text : '파일전송이 완료되었습니다.' ,
				showConfirmButton : false ,
				timer : 2000
			} );
			// 엑셀 처리를 위한 ajax 호출 및 html화면 바인딩
			var atchFileId = result.data[ "atchFileId" ]; // 파일 ID
			var fileStreCours = result.data[ "fileStreCours" ]; // 파일경로
			var orignlFileNm = result.data[ "orignlFileNm" ]; // 파일명
			var streFileNm = result.data[ "streFileNm" ]; // 파일임시명
			var fileMg = result.data[ "fileMg" ]; // 파일사이즈
			var fileExtsn = result.data[ "fileExtsn" ]; // 파일종류
			var fileSn = result.data[ "fileSn" ]; // 파일업로드순번

			addHtml( appendInputId , atchFileId , orignlFileNm + "." + fileExtsn , streFileNm , fileMg , fileSe , fileSn , fileExtsn );

		} ,
		error : function( jqXHR , textStatus , errorThrown )
		{
			console.log( "[UPLOAD] 파일 업로드 실패 " );
			fileEmpty( fileUploadId , appendInputId );
			swal( {
				title : '파일전송중 오류가 발생했습니다.' ,
				showConfirmButton : false ,
				timer : 2000
			} );
		}
	} );
}

function fileThumnailUplad( formName , fileUploadId , prvImgId , thnImgId, callback )
{ // #files,#appendInputs

	var files = $( "#" + fileUploadId ).prop( "files" );
	var file = null;
	// for(var i=0;i< files.length;i++){
	file = files[ 0 ];
	var fileName = file.name;
	var end = fileName.lastIndexOf( "\." );
	var name = fileName.substring( 0 , end );
	var type = fileName.substring( end + 1 );

	var extFormat = "\(jpg|JPG|jpeg|JPEG|png|PNG)";
	// var extFormat = "\(xls|XLS|xlsx|XLSX)";
	if ( !( new RegExp( extFormat , 'i' ) ).test( type ) )
	{

		swal( {
			title : '' ,
			text : '지원되는 파일유형이 아닙니다.' ,
			showConfirmButton : false ,
			timer : 2000
		} );
		return;
	}

	var formData = new FormData( formName[ 0 ] );
	formName.attr( "enctype" , "multipart/form-data" );
	formData.append( "fileExts" , type );
	$.ajax( {
		type : 'POST' ,
		enctype : "multipart/form-data" ,
		url : serviceRoot + "/service/upload/fileThumnailUpload.do" ,
		data : formData ,
		processData : false ,
		contentType : false ,
		cache : false ,
		async : false ,
		timeout : 600000 ,
		beforeSend : function()
		{ //
		} ,
		success : function( result , textStatus , jqXHR )
		{
			if ( isEmpty( result ) )
			{
				swal( {
					title : '' ,
					text : '관리자에게 문의하세요.' ,
					showConfirmButton : false ,
					timer : 2000
				} );

			}
			else
			{
				$( "#" + thnImgId ).val( result.fileNm );
				$( "#" + prvImgId ).attr( "src" , "data:image/" + result.imgType + ";base64," + result.data );
				
				if (callback) {
					callback(result);
				}
			}
		} ,
		error : function( jqXHR , textStatus , errorThrown )
		{
			swal( {
				title : '' ,
				text : '파일전송중 오류가 발생했습니다.' ,
				showConfirmButton : false ,
				timer : 2000
			} );
		}
	} );
}

// ////파일 삭제
function fileDel( fileId , fileRealName , divId )
{

	swal( {
		title : '삭제' ,
		text : '삭제하시겠습니까?' ,
		type : "warning" ,
		showCancelButton : true ,
		confirmButtonColor : "#DD6B55" ,
		confirmButtonText : "예" ,
		cancelButtonText : "아니요" ,
		closeOnConfirm : false ,
		closeOnCancel : true
	} , function( isConfirm )
	{

		if ( isConfirm )
		{
			$.ajax( {
				url : deleteFileUrl ,
				type : "POST" ,
				data : {
					divId : divId ,
					fileId : fileId ,
					fileNm : fileRealName
				} ,
				beforeSend : function()
				{ //
				} ,
				success : function( data , textStatus , jqXHR )
				{
					swal( {
						type : 'success' ,
						title : ' ' ,
						text : '삭제 되었습니다.' ,
						showConfirmButton : false ,
						timer : 1000
					} );

					$( "#fileView_" + fileId ).remove();

				} ,
				error : function( jqXHR , textStatus , errorThrown )
				{
					// if fails
				}
			} );

		}
	} );
}

function fileEmpty( fileUploadId , appendInputId )
{

	if ( /MSIE \d|Trident.*rv:/.test( navigator.userAgent ) )
	{
		$( "#" + fileUploadId ).replaceWith( $( "#" + fileUploadId ).clone( true ) );
		$( "#" + fileUploadId ).val( "" );
	}
	else
	{
		$( "#" + fileUploadId ).val( "" );
	}
	$( "#" + appendInputId ).empty();
}

// 파일다운로드-QR코드
function fn_egov_downFile( folderNm , fileNm , orignlFileNm )
{
	window.open( serviceRoot + "/service/cmm/fms/qrFileDown.do?orignlFileNm=" + orignlFileNm + "&fileNm=" + fileNm );
}

// 파일다운로드
function fn_downFile( atchFileId , fileSn )
{
	window.open( serviceRoot + "/service/cmm/fms/FileDown.do?atchFileId=" + atchFileId + "&fileSn=" + fileSn );
}

/** ******************************************************************* */
/** ********************* 파일업로드 끝 ********************** */
/** ******************************************************************** */

/** ******************************************************************* */
/** ********************* KUPLOAD 시작 ********************** */
/** ******************************************************************** */

var G_UploadID;
var G_TempUniqValue = 0;
var G_TempUniqValue1 = 0;
var G_TempUniqValue2 = 0;
var G_TempUniqValue3 = 0;
var G_UploadYn = "Y"; // 파일업로드 여부
var G_UploadYn1 = "Y"; // 파일업로드 여부
var G_UploadYn2 = "Y"; // 파일업로드 여부
var G_UploadYn3 = "Y"; // 파일업로드 여부
// var G_Filedata = []; //파일데이터

// 생성완료 이벤트
function RAONKUPLOAD_CreationComplete( uploadID )
{

	setTimeout( function()
	{
		G_UploadID = uploadID;
		var logBox = document.getElementById( "logBox" );
		if ( G_UploadID == "kupload1" )
		{
			fn_addFile1( G_UploadID );
		}
		else if ( G_UploadID == "kupload2" )
		{
			fn_addFile2( G_UploadID );
		}
		else if ( G_UploadID == "kupload3" )
		{
			fn_addFile3( G_UploadID );
		}
		else
		{
			fn_addFile( G_UploadID );
		}

	} , 300 );
	// logBox.innerHTML = '업로드 생성 완료 : ' + uploadID + '<br/>';
}

// 전송 전 이벤트
function RAONKUPLOAD_BeforeUpload( uploadID )
{
	G_UploadID = uploadID;

	var logBox = document.getElementById( "logBox" );
	// logBox.innerHTML += '업로드 시작 : ' + uploadID + '<br/>';
}

// 파일추가후 이벤트
function RAONKUPLOAD_AfterAddFile( uploadID , paramObj )
{

	if ( uploadID == "kupload1" )
	{
		G_UploadYn1 = "N";
	}
	else if ( uploadID == "kupload2" )
	{
		G_UploadYn2 = "N";
	}
	else if ( uploadID == "kupload3" )
	{
		G_UploadYn3 = "N";
	}
	else
	{
		G_UploadYn = "N";
	}

	// 파일 추가 후 처리할 내용
}

function RAONKUPLOAD_AfterAddAllFile( uploadID )
{
	// 파일 추가 완료 후 처리할 내용
	if ( uploadID == "kupload1" )
	{
		G_UploadYn1 = "N";
	}
	else if ( uploadID == "kupload2" )
	{
		G_UploadYn2 = "N";
	}
	else if ( uploadID == "kupload3" )
	{
		G_UploadYn3 = "N";
	}
	else
	{
		G_UploadYn = "N";
	}
}

function RAONKUPLOAD_UploadComplete( uploadID )
{
	G_UploadID = uploadID;

	var logBox = document.getElementById( "logBox" );

	// K Upload는 array, json, xml, text delimit 방식으로 결과값을 제공합니다.

	// 파일에 대한 정보 중 업로드가 완료된 파일의 정보(업로드 된 파일경로,업로드 된 파일명)는
	// RAONKUPLOAD_UploadComplete 이벤트 안에서만 추출이 가능합니다.

	// 기존에 있던 업로드된 파일 리스트를 모두 가져옴.
	var jsonAll = RAONKUPLOAD.GetListInfo( 'json' , G_UploadID );
	// //

	// 새로 업로드된 파일 정보를 가져옴.
	var jsonNew = jsonAll.newFile;
	if ( jsonNew )
		fn_newJsonToString( jsonNew );
	// //

	var jsonDel = jsonAll.deleteFile;
	if ( jsonDel )
		fn_delJsonToString( jsonDel );

	// 아래 로직에서 새롭게 리스트를 추가하기 위해서 현재 업로드 리스트를 초기화 시킴
	RAONKUPLOAD.ResetUpload( uploadID );
	// //
	// 기존에 추가되어 있는 webFile을 다시 추가하기 위한 로직.
	if ( jsonAll )
	{
		var jsonWebFile = jsonAll.webFile;
		if ( jsonWebFile )
		{
			var jsonWebFileLength = jsonWebFile.uploadPath.length;

			for ( var i = 0 ; i < jsonWebFileLength ; i++ )
			{
				RAONKUPLOAD.AddUploadedFile( jsonWebFile.uniqKey[ i ] , jsonWebFile.originalName[ i ] , jsonWebFile.uploadPath[ i ] , jsonWebFile.size[ i ] , '' , uploadID );
			}
		}
	}

	// 새로 업로드된 파일을 webFile로 새롭게 추가하기 위한 로직
	if ( jsonNew )
	{
		var jsonNewLength = jsonNew.uploadPath.length;
		var uploadHtml = "";
		for ( var i = 0 ; i < jsonNewLength ; i++ )
		{
			// 여기서 첫번째 파라미터인 uniqkey 값은 db 처리 후 db의 seq값을 넣으시거나 특정 uniq 값으로 넣으시면 됩니다.
			// 이 예제에서는 db처리까지 하지는 않기 때문에 임의의 값으로 넣었습니다.
			if ( uploadID == "kupload1" )
			{
				RAONKUPLOAD.AddUploadedFile( G_TempUniqValue1 + '' , jsonNew.originalName[ i ] , jsonNew.uploadPath[ i ] , jsonNew.size[ i ] , '' , uploadID );
				G_TempUniqValue1 = G_TempUniqValue1 + 1;
			}
			else if ( uploadID == "kupload2" )
			{
				RAONKUPLOAD.AddUploadedFile( G_TempUniqValue2 + '' , jsonNew.originalName[ i ] , jsonNew.uploadPath[ i ] , jsonNew.size[ i ] , '' , uploadID );
				G_TempUniqValue2 = G_TempUniqValue2 + 1;
			}
			else if ( uploadID == "kupload3" )
			{
				RAONKUPLOAD.AddUploadedFile( G_TempUniqValue3 + '' , jsonNew.originalName[ i ] , jsonNew.uploadPath[ i ] , jsonNew.size[ i ] , '' , uploadID );
				G_TempUniqValue3 = G_TempUniqValue3 + 1;
			}
			else
			{
				RAONKUPLOAD.AddUploadedFile( G_TempUniqValue + '' , jsonNew.originalName[ i ] , jsonNew.uploadPath[ i ] , jsonNew.size[ i ] , '' , uploadID );
				G_TempUniqValue = G_TempUniqValue + 1;
			}

			// /*
			// var end = jsonNew.uploadName[i].lastIndexOf("\.");
			// var name = jsonNew.uploadName[i].substring(0, end);
			// var type = jsonNew.uploadName[i].substring(end+1);
			// var fileData = [
			// {name: "atchFileId", value:name}
			// , {name: "orignlFileNm", value:jsonNew.originalName[i]}
			// , {name: "fileStreCours", value:jsonNew.uploadPath[i]}
			// , {name: "streFileNm", value:name}
			// , {name: "fileExtsn", value:jsonNew.extension[i]}
			// , {name: "fileSize", value:jsonNew.size[i]}
			// , {name: "fileSn", value:jsonNew.order[i]}
			// ];
			// G_Filedata.push(fileData);
			// */

			var end = jsonNew.uploadName[ i ].lastIndexOf( "\." );
			var name = jsonNew.uploadName[ i ].substring( 0 , end );
			var type = jsonNew.uploadName[ i ].substring( end + 1 );

			uploadHtml += '<div id="kupload_' + name + '">';
			uploadHtml += '<input type="hidden" name="atchFileId" value="' + name + '">';
			uploadHtml += '<input type="hidden" name="orignlFileNm" value="' + jsonNew.originalName[ i ] + '">';
			uploadHtml += '<input type="hidden" name="fileStreCours" value="' + jsonNew.uploadPath[ i ] + '">';
			uploadHtml += '<input type="hidden" name="streFileNm" value="' + name + '">';
			uploadHtml += '<input type="hidden" name="fileExtsn" value="' + jsonNew.extension[ i ] + '">';
			uploadHtml += '<input type="hidden" name="fileSize" value="' + jsonNew.size[ i ] + '">';
			uploadHtml += '<input type="hidden" name="fileSn" value="' + jsonNew.order[ i ] + '">';
			if ( uploadID == "kupload1" )
			{
				uploadHtml += '<input type="hidden" name="fileSe" value="F">';
			}
			else if ( uploadID == "kupload2" )
			{
				uploadHtml += '<input type="hidden" name="fileSe" value="S">';
			}
			else
			{
				uploadHtml += '<input type="hidden" name="fileSe" value="F">';
			}
			uploadHtml += '</div>';

			if ( G_UploadID == "kupload1" )
			{
				G_UploadYn1 = "Y";
			}
			else if ( G_UploadID == "kupload2" )
			{
				G_UploadYn2 = "Y";
			}
			else if ( G_UploadID == "kupload3" )
			{
				G_UploadYn3 = "Y";
			}
			else
			{
				G_UploadYn = "Y";
			}
		}

		if ( G_UploadID == "kupload1" )
		{
			$( "#fileBox1" ).append( uploadHtml );
		}
		else if ( G_UploadID == "kupload2" )
		{
			$( "#fileBox2" ).append( uploadHtml );
		}
		else if ( G_UploadID == "kupload3" )
		{
			$( "#fileBox3" ).append( uploadHtml );
		}
		else
		{
			$( "#fileBox" ).append( uploadHtml );
		}

		// console.log("G_Filedata::" + JSON.stringify(G_Filedata));
	}
	// logBox.innerHTML += '<br/>' + '업로드 완료 : ' + G_UploadID + '<br/>';
}

// 오류 이벤트
function RAONKUPLOAD_OnError( uploadID , paramObj )
{

	var logBox = document.getElementById( "logBox" );
	logBox.innerHTML += 'Error : ' + paramObj.strCode + ', ' + paramObj.strMessage + '<br/>';

	if ( paramObj.arrUploadedFileList != null && paramObj.arrUploadedFileList != '' )
	{
		logBox.innerHTML += '업로드 된 파일 리스트 - <br/>';
		var uploadedFileLen = paramObj.arrUploadedFileList.length;
		for ( var i = 0 ; i < uploadedFileLen ; i++ )
		{
			logBox.innerHTML += paramObj.arrUploadedFileList[ i ].uploadName + ', ' + paramObj.arrUploadedFileList[ i ].uploadPath + '</br>';
			// originName: paramObj.arrUploadedFileList[i].originName
			// fileSize: paramObj.arrUploadedFileList[i].fileSize
			// uploadName: paramObj.arrUploadedFileList[i].uploadName
			// uploadPath: paramObj.arrUploadedFileList[i].uploadPath
			// logicalPath: paramObj.arrUploadedFileList[i].logicalPath
			// order: paramObj.arrUploadedFileList[i].order
			// status: paramObj.arrUploadedFileList[i].status
			// customValue: paramObj.arrUploadedFileList[i].customValue
			// responseCustomValue: paramObj.arrUploadedFileList[i].responseCustomValue
		}
	}
}

// 취소 이벤트
function RAONKUPLOAD_UploadingCancel( uploadID , paramObj )
{
	G_UploadID = uploadID;
	var logBox = document.getElementById( "logBox" );
	logBox.innerHTML += '전송 취소 이벤트 : ' + G_UploadID + '<br/>';

	if ( paramObj.arrUploadedFileList != null && paramObj.arrUploadedFileList != '' )
	{
		logBox.innerHTML += '업로드 된 파일 리스트 - <br/>';
		var uploadedFileLen = paramObj.arrUploadedFileList.length;
		for ( var i = 0 ; i < uploadedFileLen ; i++ )
		{
			logBox.innerHTML += paramObj.arrUploadedFileList[ i ].uploadName + ', ' + paramObj.arrUploadedFileList[ i ].uploadPath + '</br>';

			// originName: paramObj.arrUploadedFileList[i].originName
			// fileSize: paramObj.arrUploadedFileList[i].fileSize
			// uploadName: paramObj.arrUploadedFileList[i].uploadName
			// uploadPath: paramObj.arrUploadedFileList[i].uploadPath
			// logicalPath: paramObj.arrUploadedFileList[i].logicalPath
			// order: paramObj.arrUploadedFileList[i].order
			// status: paramObj.arrUploadedFileList[i].status
			// customValue: paramObj.arrUploadedFileList[i].customValue
			// responseCustomValue: paramObj.arrUploadedFileList[i].responseCustomValue
		}
	}
}

// 파일 삭제 전 처리할 내용

// 파일 삭제 전 처리할 내용
function RAONKUPLOAD_BeforeDeleteFile( uploadID , paramObj )
{

	console.log( "paramObj::" + JSON.stringify( paramObj ) );

	console.log( "paramObj.strKey::" + paramObj.strKey );
	if ( !isEmpty( paramObj.strKey ) )
	{ // 전송 처리된 파일만 값이 존재합니다.

		if ( uploadID == "kupload1" )
		{
			G_TempUniqValue1 = G_TempUniqValue1 - 1;
		}
		else if ( uploadID == "kupload2" )
		{
			G_TempUniqValue2 = G_TempUniqValue2 - 1;
		}
		else if ( uploadID == "kupload3" )
		{
			G_TempUniqValue3 = G_TempUniqValue3 - 1;
		}
		else
		{
			G_TempUniqValue = G_TempUniqValue - 1;
		}

		if ( G_TempUniqValue == 0 )
		{
			G_UploadYn = "Y";
		}
		else if ( G_TempUniqValue1 == 0 )
		{
			G_UploadYn1 = "Y";
		}
		else if ( G_TempUniqValue2 == 0 )
		{
			G_UploadYn2 = "Y";
		}
		else if ( G_TempUniqValue3 == 0 )
		{
			G_UploadYn3 = "Y";
		}

		var strPath = paramObj.strPath;
		var end = strPath.lastIndexOf( "\/" );
		var name = strPath.substring( end + 1 );
		var nameEnd = name.lastIndexOf( "\." );
		var atchFileId = name.substring( 0 , nameEnd );

		$( "#kupload_" + atchFileId ).remove();
		// 파일 삭제하기 (디렉토리에 있는 파일과 , 테이블에 저장된 파일을 삭제한다.
		$.ajax( {
			url : deleteFileUrl ,
			type : "POST" ,
			data : {
				fileSe : fileSe ,
				atchFileId : atchFileId ,
				strPath : strPath
			} ,
			beforeSend : function()
			{ //
			} ,
			success : function( data , textStatus , jqXHR )
			{
				swal( {
					type : 'success' ,
					title : ' ' ,
					text : '삭제 되었습니다.' ,
					showConfirmButton : false ,
					timer : 1000
				} );
			} ,
			error : function( jqXHR , textStatus , errorThrown )
			{
				// if fails
			}
		} );
		// /* 배열값 삭제하기
		// for(var i=0; i<G_Filedata.length;i++){
		// console.log("+++++++++++++++++++++++++++++ start" + i +" +++++++++++++++++++++++++++");
		// var arrayObj = G_Filedata[i];
		// console.log("arrayObj::" + JSON.stringify(arrayObj));
		// var arrayAtchFileId = arrayObj[0].value;
		// console.log("arrayObj.name::" + arrayObj[0].name +" arrayObj.value::" + arrayObj[0].value);
		// //console.log("atchFileId::" + atchFileId);
		// //값과 동일한 것만 삭제한다.
		// if(arrayAtchFileId == atchFileId){
		//
		// //G_Filedata.splice(i, 1);
		//
		// $.ajax({
		// url : deleteFileUrl,
		// type : "POST",
		// data : {
		// fileSe : fileSe,
		// atchFileId : atchFileId,
		// strPath: strPath
		// },
		// beforeSend : function() { //
		// },
		// success : function(data, textStatus, jqXHR) {
		//
		// },
		// error : function(jqXHR, textStatus, errorThrown) {
		// // if fails
		// }
		// });
		//
		// break;
		// }
		//
		// console.log("+++++++++++++++++++++++++++++ end" + i +" +++++++++++++++++++++++++++");
		// }
		//
		// */
	}
	// console.log("G_Filedata::" + JSON.stringify(G_Filedata));
	return true;

}
/** ******************************************************************* */
/** ********************* 입력 숫자 , ********************** */
/** ******************************************************************** */

function numberWithCommas( pid , tId )
{
	var value = $( "#" + pid ).val();
	value = value.replace( /[^0-9]/g , '' ); // 입력값이 숫자가 아니면 공백
	value = value.replace( /,/g , '' ); // ,값 공백처리
	value = value.replace( /\B(?=(\d{3})+(?!\d))/g , "," ); // 정규식을 이용해서 3자리 마다 , 추가
	$( "#" + pid ).val( value );
	var intValue = $( "#" + pid ).val();
	intValue = intValue.replace( /,/gi , "" );
	$( "#" + tId ).val( intValue );
}
/** ******************************************************************* */
/** ********************* KUPLOAD 끝 ********************** */
/** ******************************************************************** */
