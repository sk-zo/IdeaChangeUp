<%@page import="Model.PostDTO"%>
<%@page import="Model.PatentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/common.css?">
<link rel="stylesheet" href="assets/css/regist.css?">
</head>
<body style="margin-left: 30%; margin-right: 30%;">
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
<div class="content">
	<div class="sub_title"><h4>자료등록</h4></div>
	<div class="upload">
	<div id="uploadForms" class="file_step">
		<!-- <span class="up_link_pop" id ="addedSingForm">※ 자료는 <span style="text-decoration: underline;font-weight: bold;color:#1064bd;">본인에게 저작권이 있는 자료</span>만 판매가능합니다.</span> -->
		<div class="tb_list2" id="singleForm" style="border-bottom: none;">
			<form method="post" action="Upload" style="margin:0">
				<table cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr>
							<th>제목</th>
							<td>
								<!-- <span class="up_txt1"><em>ㆍ</em>자료의  내용을 대표할 수 있도록 구체적으로 기재하시기 바랍니다.</span> -->
								<%
								if (session.getAttribute("post") != null) {
															PostDTO post = (PostDTO)session.getAttribute("post");
								%>
								<input type="text" id="title" maxlength="200" name="title" class="up_in2" style="width:620px;" value=<%=post.getTitle()%>>
								<%
								} else {
								%>
								<input type="text" id="title" maxlength="200" name="title" class="up_in2" style="width:620px;" onfocus="Upload.changeTitle('title');" onblur="Upload.resetBox();Upload.checkTitleAllowChars(this.value, 'notice');Upload.checkDefaultIntro('titleBlur');" onchange="Upload.checkStringLength('title', 200, '제목은');">
								<%
								}
								%>
							</td>
						</tr>
		                <tr>
							<th>요약</th>
							<td>
								<%
								if (session.getAttribute("post") != null) {
															PostDTO post = (PostDTO)session.getAttribute("post");
								%>
								<textarea id="abstarct" rows="1" cols="100" name="abs" class="up_in2" style="width:620px; height: 60px; resize: none;" ><%=post.getAbs()%></textarea>
								<%
								} else {
								%>
								<textarea id="abstarct" rows="1" cols="100" name="abs" class="up_in2" style="width:620px; height: 60px; resize: none;" ></textarea>
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
								<textarea rows="1" cols="100" name="content" class="up_in2" style="width:620px; height: 120px; resize: none;" ><%=post.getContent()%></textarea>
								<%
								} else {
								%>
								<textarea rows="1" cols="100" name="content" class="up_in2" style="width:620px; height: 120px; resize: none;" ></textarea>
								<%
								}
								%>
								<span id="titleErrorNotice" class="up_alert_txt" style="display: none;"></span>
							</td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td>
								<!-- <div id="categoryShowButton" onclick="Upload.selectCategory('categoryPrimary','report','','리포트','toggle');" style="width:135px; cursor: pointer;" class="up_sel_w">
									<div class="btn_select" id="selectedCategoryTitle"></div> -->
								<select name="ipc" style="width:40px;">
									<option value=0>A</option>
									<option value=1>B</option>
									<option value=2>C</option>
									<option value=3>D</option>
									<option value=4>E</option>
									<option value=5>F</option>
									<option value=6>G</option>
									<option value=7>H</option>
								</select>
							</td>
						</tr>
						
						<!-- <tr id="thumbnailDiv"  style="display:none;"> -->
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
							<th> 태그작성</th>
							<td>
								<span class="up_txt1" style="margin-bottom:5px">
									<em>ㆍ</em>여러개의 태그는 쉼표(,)로 구분하여 최대 5개까지 등록이 가능합니다.<br>
								</span>
								<%
								if (session.getAttribute("post") != null) {
									PostDTO post = (PostDTO)session.getAttribute("post");
								%>
								<input type="text" name="tag" id="tag" class="up_in2" style="width:620px" value=<%=post.getTag() %>>
								<%} else {%>
								<input type="text" name="tag" id="tag" class="up_in2" style="width:620px">
								<% } %>
								
								<span id="tagErrorNotice" class="up_alert_txt" style="display: none;"></span>
								
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
		                    	
		                    <% if (session.getAttribute("patent") != null) {
		                    	ArrayList<PatentDTO> patents = (ArrayList<PatentDTO>)session.getAttribute("patent");%>
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
		                    <%} %>
		                    
		                </tr>
					</tbody>
				</table>
		
				<div id="singleFormButton">
					<div class="up_info_txt">기재하신 내용은 자료검수시, 관리자에 의해 조정될 수 있습니다.</div>
					<div class="btn_corm">
						<input type="submit" value="확인">  <input type="button" value="취소" onclick="return cancel(this.form)">  
					</div>
				</div>
		
		
				<div class="r_upload">
					<a class="upload_link" href="#" onclick="Common.hcLogTrace(207, 474); Upload.submitUpload();return false;"><span class="blind">자료등록</span></a>
					<a class="preview_link" href="#" onclick="Common.hcLogTrace(207, 475); Upload.showUploadPreview();return false;"><span class="blind">미리보기</span></a>
				</div>
			</form>
		</div>
	</div>
</div>
</div>
</body>
</html>