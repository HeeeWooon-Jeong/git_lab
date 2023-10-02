<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp" />
<c:set var="url"
	value="${requestScope['javax.servlet.forward.request_uri']}" />
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript"
	src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="content_box">
	<form:form commandName="careVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="caSeq" id="caSeq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="caAtchFileSeq" id="caAtchFileSeq"/>
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
						<th scope="row"><strong class="th_tit">이름</strong></th>
						<td colspan="3">
							<input type="text" name="caErum" id="caErum" class="text w100p"  required="required"  maxlength="50" value="${util:unEscape(careVO.caErum) }" />
						</td>
					</tr>
					<tr>
						<th scope="row">연락처</th>
						<td colspan="3">
							<input type="text" name="caPhon" id="caPhon" class="text w100p" required="required"	maxlength="50" value="${util:unEscape(careVO.caPhon) }" /> 
					</tr>
					<tr>
						<th scope="row">관리차량</th>
						<td colspan="14"><input type="text" name="caVehi"
							id="caVehi" class="text w100p" required="required"
							maxlength="50" value="${util:unEscape(careVO.caVehi) }" />
					</tr>
					<tr>
						<th scope="row">차량번호</th>
						<td colspan="14"><input type="text" name="caNum"
							id="caNum" class="text w100p" required="required"
							maxlength="50" value="${util:unEscape(careVO.caNum) }" />
					</tr>
					<tr>
						<th scope="row">배송지</th>
						<td colspan="14"><input type="text" name="caDel"
							id="caDel" class="text w100p" required="required"
							maxlength="50" value="${util:unEscape(careVO.caDel) }" />
						</td>
					</tr>
					<tr>
						<th scope="row">방문지역</th>
						<td colspan="14"><input type="text" name="caLocal"
							id="caLocal" class="text w100p" required="required"
							maxlength="50" value="${util:unEscape(careVO.caLocal) }" />
					</tr>
					<tr>
						<th scope="row">배송여부</th>
						<td colspan="14"><input type="text" name="caTf"
							id="caTf" class="text w100p" required="required"
							maxlength="50" value="${util:unEscape(careVO.caTf) }" />
					</tr>
					<tr>
						<th scope="row">특이사항</th>
						<td colspan="14"><input type="text" name="caEtc"
							id="caEtc" class="text w100p" required="required"
							maxlength="50" value="${util:unEscape(careVO.caEtc) }" /> 
					</tr>
					<tr>
						<th scope="row">출근시간</th>
						<td colspan="14"><input type="text" name="caStart"
							id="caStart" class="text w100p" required="required"
							maxlength="50" value="${util:unEscape(careVO.caStart) }" />
					</tr>
					<tr>
						<th scope="row">퇴근시간<strong></th>
						<td colspan="14"><input type="text" name="caEnd"
							id="caEnd" class="text w100p" required="required"
							maxlength="50" value="${util:unEscape(careVO.caEnd) }" />
					</tr>
					<tr>
						<th scope="row">휴가일<strong></th>
						<td colspan="14"><input type="text" name="caVac"
							id="caVac" class="text w100p" required="required"
							maxlength="50" value="${util:unEscape(careVO.caVac) }" /> 
					</tr>
					<tr>
						<th scope="row">사원코드<strong></th>
						<td colspan="14"><input type="text" name="caCode"
							id="caCode" class="text w100p" required="required"
							maxlength="50" value="${util:unEscape(careVO.caCode) }" />
					</tr>
					<tr>
						<th scope="row">사원레벨</th>
						<td colspan="14"><input type="text" name="caLev"
							id="caLev" class="text w100p" required="required"
							maxlength="50" value="${util:unEscape(careVO.caLev) }" /> 
					</tr>
					<tr>
						<th scope="row">인사평점</th>
						<td colspan="14"><input type="text" name="caSco"
							id="caSco" class="text w100p" required="required"
							maxlength="50" value="${util:unEscape(careVO.caSco) }" />
					</tr>
					<tr>
						<th scope="row">특이사항 내용</th>
						<td colspan="3">
							<textarea name="caCont" id="caCont" class="txt_area w_100p" style="position: absolute; width: 100%;" height="100%" left:0; top:0; frameborder="0">${util:unEscape(careVO.caCont)}</textarea>
						</td> 
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</th>
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?caAtchFileSeq=${careVO.caAtchFileSeq }&fileCnt=5&atchFileIdNm=caAtchFileSeq&updateType=upload" style="width: 100%;" height="100" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr> 
				</tbody>
			</table>
		</div>
		<div class="btn_area">
			<a href="#" class="btn btn_mdl btn_${searchVO.procType eq 'update'? 'rewrite':'save'}" id="btn_submit">${searchVO.procType eq  'update' ? '수정' : '등록'}</a>
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
				elPlaceHolder : "caCont",
				sSkinURI : "/resource/editor/SmartEditor2Skin.html",
				fCreator : "createSEditor2"
			});
	<%-- 예전에는 bind 썻는데 요즘은 on 쓰니까 bind 보이면 on 해주자--%>
		$("#btn_submit").on("click", function() {

				if (!$("#caErum").val()) {
					alert("제목을 입력해주세요");
					$("#caErum").focus();
					return false;
				}
				oEditors.getById["caCont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */

				if ($("#caCont").val() == '<p>&nbsp;</p>') {
					alert("내용을 입력해주세요");
					oEditors.getById["caCont"].exec("FOCUS"); /* 에디터 */
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