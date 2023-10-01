<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp" />
<c:set var="url"
	value="${requestScope['javax.servlet.forward.request_uri']}" />
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript"
	src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="content_box">
	<form:form commandName="moviesVO" name="defaultFrm" id="defaultFrm"
		method="post">
		<!--  commandName이 VO와 일치한다면 자동으로 값을 넣어줌  일치하지 않으면 500 에러  -->
		<!-- path는 name같은 것  -->
		<form:hidden path="twSeq" id="twSeq" />
		<form:hidden path="pageIndex" id="pageIndex" />
		<form:hidden path="twAtchFileSeq" id="twAtchFileSeq" />
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp" />
		<div class="tbl_wrap">
			<table class="tbl_row_type01">
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>
					<col style="width: 20%;">
					<col style="width: 80%;">
				</colgroup>
				<tbody>
					<!-- required="required"  삭제함 -->
					<tr>
						<th scope="row"><strong class="th_tit">제목</strong></th>
						<td colspan="3"><input type="text" name="twTitle" id="twTitle" class="text w100p" maxlength="50" value="${util:unEscape(moviesVO.twTitle) }" />
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">영제목</strong></th>
						<td colspan="3"><input type="text" name="twETitle" id="twETitle" class="text w100p" maxlength="50"	value="${util:unEscape(moveVO.twETitle) }" />
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">영화코드</strong></th>
						<td colspan="3"><input type="text" name="twCode" id="twCode" class="text w100p" maxlength="50"	value="${util:unEscape(moveVO.twCode) }" />
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">제작년도</strong></th>
						<td colspan="3"><input type="text" name="twMakeYear" id="twMakeYear" class="text w100p" maxlength="50" value="${util:unEscape(moveVO.twMakeYear) }" />
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">국가</strong></th>
						<td colspan="3"><input type="text" name="twNational" id="twNational" class="text w100p" maxlength="50" value="${util:unEscape(moveVO.twNational) }" /></td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">개봉</strong></th>
						<td colspan="3"><input type="text" name="twStaDate" id="twStaDate" class="text w100p" maxlength="50" value="${util:unEscape(moveVO.twStaDate) }" />
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">마감</strong></th>
						<td colspan="3"><input type="text" name="twEndDate" id="twEndDate" class="text w100p" maxlength="50" value="${util:unEscape(moveVO.twEndDate) }" />
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">유형</strong></th>
						<td colspan="3"><input type="text" name="twType" id="twType" class="text w100p" maxlength="50"	value="${util:unEscape(moveVO.twType) }" />
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">장르</strong></th>
						<td colspan="3"><input type="text" name="twGenre" id="twGenre" class="text w100p" maxlength="50" value="${util:unEscape(moveVO.twGenre) }" />
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">감독<strong></th>
						<td colspan="3"><input type="text" name="twDirector" id="twDirector" class="text w100p" maxlength="50"	value="${util:unEscape(moveVO.twDirector) }" />
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">회사<strong></th>
						<td colspan="3"><input type="text" name="twCompany" id="twCompany" class="text w100p" maxlength="50" value="${util:unEscape(moveVO.twCompany) }" />
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">배우<strong></th>
						<td colspan="3"><input type="text" name="twActor" id="twActor" class="text w100p" maxlength="50" value="${util:unEscape(moveVO.twActor) }" />
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">배급사</strong></th>
						<td colspan="3"><input type="text" name="twTcom" id="twTcom" class="text w100p" maxlength="50"	value="${util:unEscape(moveVO.twTcom) }" />
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">평점</strong></th>
						<td colspan="3"><input type="text" name="twLati" id="twLati" class="text w100p" maxlength="50"	value="${util:unEscape(moveVO.twLati) }" />
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">내용</strong></th>
						<td colspan="3" ><textarea name="twCont" id="twCont" class="txt_area w_100p">${util:unEscape(moviesVO.twCont)}</textarea>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3"><iframe name="atchFileIdFrame" id="atchFileIdFrame"	src="/atch/fileUpload.do?twAtchFileSeq=${moviesVO.twAtchFileSeq }&fileCnt=5&atchFileIdNm=twAtchFileSeq&updateType=upload" style="width: 100%;" height="100" frameborder="0" title="파일 업로드 폼"></iframe></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="btn_area">
			<a href="#"
				class="btn btn_mdl btn_${searchVO.procType eq 'update'? 'rewrite':'save'}"
				id="btn_submit">${searchVO.procType eq  'update' ? '수정' : '등록'}</a>
			<c:if test="${searchVO.procType eq  'update'}">
				<a href="#" class="btn btn_mdl btn_cancel" id="btn_returnView">취소</a>
			</c:if>
			<c:if test="${searchVO.procType ne  'update'}">
				<a href="#" class="btn btn_mdl btn_cancel" id="btn_list">취소</a>
			</c:if>
		</div>
	</form:form>
	<script type="text/javascript">
		var oEditors = [];
		$(document).ready(function() {
	<%-- 에디터 --%>
		nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "twCont",
				sSkinURI : "/resource/editor/SmartEditor2Skin.html",
				fCreator : "createSEditor2"
			});
	<%-- 예전에는 bind 썻는데 요즘은 on 쓰니까 bind 보이면 on 해주자--%>
		$("#btn_submit").on("click", function() {

				if (!$("#twTitle").val()) {
					alert("제목을 입력해주세요");
					$("#twTitle").focus();
					return false;
				}
				oEditors.getById["twCont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */

				if ($("#twCont").val() == '<p>&nbsp;</p>') {
					alert("내용을 입력해주세요");
					oEditors.getById["twCont"].exec("FOCUS"); /* 에디터 */
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