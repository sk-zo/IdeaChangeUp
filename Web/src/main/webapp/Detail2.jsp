<%@page import="Model.CommentDTO"%>
<%@page import="Model.CommentDAO"%>
<%@page import="Model.PatentDAO"%>
<%@page import="Model.BoardDTO"%>
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

<div class="content">
	<div class="sub_title"><a href="Board.jsp"><h4>게시글</h4></a></div>
	<div class="sub_title"><a href="EditPost.jsp?index=<%=index%>">수정</a><a href="DeletePost?post_num=<%=post.getNum()%>">삭제</a></div>
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
						<tr>
							<th>작성자</th>
							<td>
								<%=post.getWriter() %>
							</td>
						</tr>
		                <tr>
							<th>요약</th>
							<td>
								<%=post.getAbs() %>
							</td>
						</tr>
		                <tr>
							<th>본문</th>
							<td>
								<%=post.getContent() %>
							</td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td>
								<%=post.getCategory() %>
							</td>
						</tr>
						
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
							<td><textarea rows="3" cols="100" name="comment"></textarea> <input type="submit" value="등록"></td>
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
</body>
</html>