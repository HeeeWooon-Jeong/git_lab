<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="Content_box">
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="ctSeq" id="ctSeq"/>
		<form:hidden path="ctDatName" id="ctDatName"/>
		<%-- <form:hidden path="pageIndex" id="pageIndex"/>  --%>
		<form:hidden path="ctAtchFileSeq" id="ctAtchFileSeq"/>
		<form:hidden path="ctDatAtchFileSeq" id="ctDatAtchFileSeq"/>
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
		<!-- tbl -->
		<div class="tbl_wrap">
			<table class="tbl_row_type01">
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>
					<col style="width:15%;">
					<col style="width:35%;">
					<col style="width:15%;">
					<col style="width:35%;">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><strong>제목</strong></th>
						<td colspan="3">
							${ctwoVO.ctTitle }
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>등록자</strong></th>
						<td colspan="3">
							${ctwoVO.ctName }
						</td>
					</tr>
					<!-- content , file --> 
					<tr>
						<th scope="row"><strong>내용</strong></th>
						<td colspan="3">
							<div class="text_area">
								<c:out value="${util:unEscape(ctwoVO.ctCont)}" escapeXml="false"/>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${ctwoVO.ctAtchFileSeq}&fileCnt=5&atchFileIdNm=ctAtchFileSeq&updateType=view" style="width: 100%;" height="70" frameborder="0" title="파일 업로드 폼"></iframe>

						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	<div class="btn_area">
		<a href="javascript:void(0);" id="btn_update" class="btn btn_mdl btn_rewrite" >수정</a> 
		<a href="javascript:void(0);" id="btn_del" class="btn btn_mdl btn_del" >삭제</a>
		<a href="javascript:void(0);" id="btn_list" class="btn btn_mdl btn_list" >목록</a>
	</div>	
	
<h3 class="tit_page">댓글 목록</h3>
	
	<div class="tbl_top">
	<div class="tbl_left"><i class="i_all"></i><span>전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.pageIndex}/${paginationInfo.totalPageCount} Page) </span></div>
	<div class="tbl_right"></div>
</div>
<div class="tbl_wrap">
	<table class="tbl_col_type01">
		<caption>목록</caption>
		<colgroup> 
			<col style="width:5%">
			<col style="width:65%">
			<col style="width:15%">
			<col style="width:15%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col" class="subject">제목</th>
				<th scope="col">등록자</th>
				<th scope="col">등록일</th> 
			</tr>

		</thead>
		<tbody>
			
			<c:choose>
				<c:when test="${empty ctwoVO.ctDatSeq}">
					<tr style="heigh:200;"><td colspan="6" class="no_data">데이터가 없습니다.</td></tr>
				</c:when>
				<c:otherwise>
							<tr class="cursor">
							<td>${ctwoVO.ctDatSeq}</td>
							<td>${ctwoVO.ctDatTitle}</td>
							<td>${ctwoVO.ctDatName}</td>
							<td>${ctwoVO.ctDatRgstDt}</td>
						</tr>
						<tr>
							<th scope="row">첨부파일</th>
							<td colspan="3">
								<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${ctwoVO.ctDatAtchFileSeq }&fileCnt=5&atchFileIdNm=ctDatAtchFileSeq&updateType=upload" style="width: 100%;" height="100" frameborder="0" title="파일 업로드 폼"></iframe>
							</td>
						</tr>  
				</c:otherwise>
			</c:choose>
			
		</tbody>
	</table>
</div>
<%-- //tbl end --%>
			
			
				<div class="tbl_wrap" >
					<table class="tbl_row_type01"> 
						<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
						<colgroup>
							<col style="width:15%;">
							<col style="width:35%;">
							<col style="width:15%;">
							<col style="width:35%;">
						</colgroup> 
						<tbody>
							<tr>
								<th scope="row"><strong class="th_tit">제목</strong></th>
								<td colspan="3">
									<input type="text" name="ctDatTitle" id="ctDatTitle" class="text w100p" value="${ctwoVO.ctDatTitle}" />
								</td>
							</tr>
							<tr>
								<th scope="row">내용</th>
								<td colspan="3">
									<textarea name="ctDatCont" id="ctDatCont" class="txt_area w_100p" style="position: absolute; width: 100%;" height="100%" left:0; top:0; frameborder="0">${util:unEscape(ctwoVO.ctDatCont)}</textarea>
								</td> 
							</tr>
							<tr>
								<th scope="row">첨부파일</th>
								<td colspan="3">
									<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${ctwoVO.ctDatAtchFileSeq }&fileCnt=5&atchFileIdNm=ctDatAtchFileSeq&updateType=upload" style="width: 100%;" height="100" frameborder="0" title="파일 업로드 폼"></iframe>
								</td>
							</tr>    
						</tbody>
					</table>
				</div>
			<div class="btn_area">
				<a href="javascript:void(0);" class="btn btn_mdl btn_save" id="btn_submit" >등록</a>
				<c:if test="${searchVO.procType ne  'update'}">
					<a href="javascript:void(0);" class="btn btn_mdl btn_cancel" id="btn_returnView">취소</a>
				</c:if>
			</div>
	
	
	</form:form>
	
<script type="text/javascript">
		var oEditors = [];
		$(document).ready(function() {
	<%-- 에디터 --%>
		nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "ctDatCont",
				sSkinURI : "/resource/editor/SmartEditor2Skin.html",
				fCreator : "createSEditor2"
			});
	<%-- 예전에는 bind 썻는데 요즘은 on 쓰니까 bind 보이면 on 해주자--%>
		$("#btn_submit").on("click", function() {

			if (!$("#ctDatTitle").val()) {
				alert("제목을 입력해주세요");
				$("#ctDatTitle").focus();
				return false;
			}
				oEditors.getById["ctDatCont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */

				if ($("#ctDatCont").val() == '<p>&nbsp;</p>') {
					alert("내용을 입력해주세요");
					oEditors.getById["ctDatCont"].exec("FOCUS"); /* 에디터 */
					return false;
				}

				fncPageBoard('submit', 'update2Form.do');
				return false;
			});

			$("#btn_returnView").click(function() {
				$("#boardSeq").val($("#boardGrpSeq").val());
				fncPageBoard('view', 'view.do');
			});
		});
	</script>
	<script type="text/javascript" src="/publish/ma/js/board.js"></script>
	
</div>

	