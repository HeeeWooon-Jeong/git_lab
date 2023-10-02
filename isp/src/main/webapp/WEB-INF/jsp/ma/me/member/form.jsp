<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp" />
<c:set var="url"
	value="${requestScope['javax.servlet.forward.request_uri']}" />
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript"
	src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="content_box">
	<form:form commandName="memberVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="meSeq" id="meSeq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
	<%-- 	<form:hidden path="atchFileSeq" id="atchFileSeq"/> --%>
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
						<th scope="row"><strong class="th_tit">사번</strong></th>
						<td colspan="3">
							<input type="text" name="meCnum" id="meCnum" class="text w100p"  value="${util:unEscape(memberVO.meCnum) }" />
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">이름</strong></th>
						<td colspan="3">
							<input type="text" name="meMnam" id="meMnam" class="text w100p"  value="${util:unEscape(memberVO.meMnam) }" />
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">연락처</strong></th>
						<td colspan="3">
							<input type="text" name="meCall" id="meCall" class="text w100p"  value="${util:unEscape(memberVO.meCall) }" />
						</td>
					</tr>
					<tr>
						<th scope="row">부서</th>
						<td colspan="3">
							<input type="text" name="meBusu" id="meBusu" class="text w100p"  value="${util:unEscape(memberVO.meBusu) }" />
						</td>
					</tr>
					<tr>
						<th scope="row">직급</th>
						<td colspan="3">
							<input type="text" name="meLeve" id="meLeve" class="text w100p"  value="${util:unEscape(memberVO.meLeve) }" />
						</td>
					</tr>
					<tr>
						<th scope="row">입사일</th>
						<td colspan="3">
							<input type="date" name="meStaDate" id="meStaDate" class="text w100p"  value="${util:unEscape(memberVO.meStaDate) }" />
						</td>
					</tr>
					<tr>
						<th scope="row">퇴사일</th>
						<td colspan="3">
							<input type="text" name="meEndDate" id="meEndDate" class="text w100p"  value="${util:unEscape(memberVO.meEndDate) }" />
						</td>
					</tr>
					<tr>
						<th scope="row">휴가일</th>
						<td colspan="3">
							<input type="text" name="meVac" id="meVac" class="text w100p"  value="${util:unEscape(memberVO.meVac) }" />
						</td>
					</tr>
					<tr>
						<th scope="row">총근무일수</th>
						<td colspan="3">
							<input type="text" name="meTotaL" id="meTotaL" class="text w100p"  value="${util:unEscape(memberVO.meTotaL) }" />
						</td>
					</tr>
					<tr>
						<th scope="row">주소</th>
						<td colspan="3">
							<input type="text" name="meAdre" id="meAdre" class="text w100p"  value="${util:unEscape(memberVO.meAdre) }" />
						</td>
					</tr>
					<tr>
						<th scope="row">인사고과</th>
						<td colspan="3">
							<input type="text" name="meGood" id="meGood" class="text w100p"  value="${util:unEscape(memberVO.meGood) }" />
						</td>
					</tr>
					<tr>
						<th scope="row">근무연차</th>
						<td colspan="3">
							<input type="text" name="meYear" id="meYear" class="text w100p"  value="${util:unEscape(memberVO.meYear) }" />
						</td>
					</tr>
					<tr>
						<th scope="row">이메일</th>
						<td colspan="3">
							<input type="text" name="meMail" id="meMail" class="text w100p"  value="${util:unEscape(memberVO.meMail) }" />
						</td>
					</tr>
					<tr>
						<th scope="row">인트라아이디</th>
						<td colspan="3">
							<input type="text" name="meTid" id="meTid" class="text w100p"  value="${util:unEscape(memberVO.meTid) }" />
						</td>
					</tr>
				
					<tr>	
						<th scope="row">인적사항</strong></th>
						<td colspan="3">
							<textarea name="meCont" id="meCont" class="txt_area w_100p" >${util:unEscape(memberVO.meCont)}</textarea>
						</td> 
					</tr> 
					
	<%--  				<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?twAtchFileSeq=${memberVO.twAtchFileSeq }&fileCnt=5&atchFileIdNm=twAtchFileSeq&updateType=upload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>  --%>
				</tbody>
			</table>
		</div>
		<div class="btn_area">
			<a href="javascript:void(0);" class="btn btn_mdl btn_${searchVO.procType eq 'update'? 'rewrite':'save'}" id="btn_submit">${searchVO.procType eq  'update' ? '수정' : '등록'}</a>
			<c:if test="${searchVO.procType eq  'update'}">
				<a href="javascript:void(0);" class="btn btn_mdl btn_cancel" id="btn_returnView">취소</a>
			</c:if>
			<c:if test="${searchVO.procType ne  'update'}">
				<a href="javascript:void(0);" class="btn btn_mdl btn_cancel" id="btn_list">취소</a>
			</c:if>
		</div>
	</form:form>
		<script type="text/javascript">
		var oEditors = [];
		$(document).ready(function() {
	<%-- 에디터 --%>

	<%-- 예전에는 bind 썻는데 요즘은 on 쓰니까 bind 보이면 on 해주자--%>
		$("#btn_submit").on("click", function() {

				if (!$("#meCnum").val()) {
					alert("제목을 입력해주세요");
					$("#meCnum").focus();
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