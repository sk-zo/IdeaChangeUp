<%@page import="java.io.FileReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
<script type="text/javascript">
	var fileValue = $("#filename").val()
	document.getElementById("filename").value=fileValue;
</script>

<div class="content">
	<div class="sub_title"><h4>자료등록</h4></div>
	<div class="upload">
	<div id="uploadForms" class="file_step">
		<!-- <span class="up_link_pop" id ="addedSingForm">※ 자료는 <span style="text-decoration: underline;font-weight: bold;color:#1064bd;">본인에게 저작권이 있는 자료</span>만 판매가능합니다.</span> -->
		<div class="tb_list2" id="singleForm" style="border-bottom: none;">
			
			<form method="post" action="UploadCompetition" style="margin:0" enctype="multipart/form-data">
				<table cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr>
							<th>제목</th>
							<td>
								<input type="text" id="title" maxlength="200" name="title" class="up_in2" style="width:620px;">
								<!-- <span class="up_txt1"><em>ㆍ</em>자료의  내용을 대표할 수 있도록 구체적으로 기재하시기 바랍니다.</span> -->
							</td>
						</tr>
		                <tr>
							<th>상금</th>
							<td>
								<input type="text" id="title" maxlength="200" name="price" class="up_in2" style="width:620px;">
							</td>
						</tr>
		                <tr>
							<th>마감일</th>
							<td>
								<input type="text" id="title" maxlength="200" name="title" class="up_in2" style="width:620px;">
							</td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td>
								<!-- <div id="categoryShowButton" onclick="Upload.selectCategory('categoryPrimary','report','','리포트','toggle');" style="width:135px; cursor: pointer;" class="up_sel_w">
									<div class="btn_select" id="selectedCategoryTitle"></div> -->
								<select name="category" style="width:40px;">
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
						<tr id="thumbnailDiv">
							<th class="check">미리보기 이미지</th>
							<td>
								<input type="file" name="prefile" id="imgFileInput" onchange="javascript:document.getElementById('filename').value = this.value" multiple>
								<input type="text" name="filename" id="filename">
							</td>
						</tr>
						
						<!-- <tr id="thumbnailDiv"  style="display:none;"> -->
		                <tr id="thumbnailDiv">
							<th class="check">공모전 포스터</th>
							<td>
								<input type="file" name="imgfile" id="imgFileInput" onchange="javascript:document.getElementById('filename').value = this.value" multiple>
								<input type="text" name="filename" id="filename">
							</td>
						</tr>
						
						<tr>
							<th> 첨부파일</th>
							<td>
								<input type="file" name="docfile" id="imgFileInput">
							</td>
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