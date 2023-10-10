<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp" />
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="content_box">
	<form:form commandName="ctwoVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="ctSeq" id="ctSeq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="ctAtchFileSeq" id="ctAtchFileSeq"/>
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
		<div class="tbl_wrap">
			<table class="tbl_row_type01"> 
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>
					<col style="width:20%;">
					<col style="width:30%;">
					<col style="width:20%;">
					<col style="width:30%;">
				</colgroup> 
				<tbody>
					<tr>
						<th scope="row"><strong class="th_tit" style="font-weight:bold; !important;">제목</strong></th>
						<td colspan="3">
							<input type="text" name="ctTitle" id="ctTitle" class="text w100p" value="${ctwoVO.ctTitle}" />
						</td>
					</tr>
					<tr>
						<th scope="row">내용</th>
						<td colspan="3">
							<textarea name="ctCont" id="ctCont" class="txt_area w_100p" style="position: absolute; width: 100%;" height="100%" left:0; top:0; frameborder="0">${util:unEscape(ctwoVO.ctCont)}</textarea>
						</td> 
					</tr>
					<tr>
						<th scope="row">첨부파일</th>
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${ctwoVO.ctAtchFileSeq }&fileCnt=5&atchFileIdNm=ctAtchFileSeq&updateType=upload" style="width: 100%;" height="100" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>    
				</tbody>
			</table>
		</div>
		<div class="btn_area">
			<a href="javascript:void(0);" class="btn btn_mdl btn_${searchVO.procType eq 'update'? 'rewrite':'save'}" id="btn_submit">${searchVO.procType eq  'update' ? '수정' : '등록'}</a>
			<c:if test="${searchVO.procType eq 'update'}">
				<a href="javascript:void(0);" class="btn btn_mdl btn_cancel" id="btn_returnView">취소</a>
			</c:if>
			<c:if test="${searchVO.procType ne 'update'}">
				<a href="javascript:void(0);" class="btn btn_mdl btn_cancel" id="btn_list">취소</a>
			</c:if>
		</div>
	</form:form>
		<script type="text/javascript">
		var oEditors = [];
		$(document).ready(function() {
	<%-- 에디터 --%>
		nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "ctCont",
				sSkinURI : "/resource/editor/SmartEditor2Skin.html",
				fCreator : "createSEditor2"
			});
	<%-- 예전에는 bind 썻는데 요즘은 on 쓰니까 bind 보이면 on 해주자--%>
		$("#btn_submit").on("click", function() {

			if (!$("#ctTitle").val()) {
				alert("제목을 입력해주세요");
				$("#ctTitle").focus();
				return false;
			}
				oEditors.getById["ctCont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */

				if ($("#ctCont").val() == '<p>&nbsp;</p>') {
					alert("내용을 입력해주세요");
					oEditors.getById["ctCont"].exec("FOCUS"); /* 에디터 */
					return false;
				}

				fncPageBoard('submit', '${searchVO.procType}Proc.do');
				return false;
			});

			$("#btn_returnView").click(function() {
				$("#boardSeq").val($("#boardGrpSeq").val());
				fncPageBoard('view', 'view.do');
			});
		});
	</script>
</div>