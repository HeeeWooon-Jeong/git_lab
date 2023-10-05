<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp" />
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

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
						<th scope="row"><strong class="th_tit" style="font-weight:bold; !important;">이름</strong></th>
						<td>
							<input type="text" name="caErum" id="caErum" class="text w100p" value="${careVO.caErum}" />
						</td>
						<th scope="row"><strong class="th_tit" style="font-weight:bold; !important;">연락처</strong></th>
						<td>
							<input type="text" name="caPhon" id="caPhon" class="text w100p"	value="${careVO.caPhon}" /> 
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit" style="font-weight:bold; !important;">관리차량</strong></th>
						<td><input type="text" name="caVehi" id="caVehi" class="text w100p" value="${careVO.caVehi}" />
						<th scope="row">차량번호</th>
						<td><input type="text" name="caNum" id="caNum" class="text w100p" value="${careVO.caNum}" />
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit" style="font-weigt:bold; !important;">배송지</strong></th>
						<td><input type="text" name="caDel" id="caDel" class="text w100p" value="${careVO.caDel}" />
						</td>
						<th scope="row">방문지역</th>
						<td><input type="text" name="caLocal" id="caLocal" class="text w100p" value="${careVO.caLocal}" />
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit" style="font-weight:bold; !important;">배송여부</strong></th>
						<td><input type="text" name="caTf"	id="caTf" class="text w100p" value="${careVO.caTf}" />
						<th scope="row">특이사항</th>
						<td><input type="text" name="caEtc" id="caEtc" class="text w100p" value="${careVO.caEtc}" /> 
					</tr>
					<tr>
						<th scope="row">출근시간</th>
						<td><input type="time" value="12:00" min="00:00" max="23:59" step="1" name="caStart" id="caStart" class="text w100p" value="${careVO.caStart}" />
						<th scope="row">퇴근시간</th>
						<td><input type="time" value="12:00" min="00:00" max="23:59" step="1" name="caEnd" id="caEnd" class="text w100p" value="${careVO.caEnd}" />
					</tr>
					<tr>
						<th scope="row">휴가일</th>
						<td><input type="text" name="caVac" id="caVac" class="text w100p" value="${careVO.caVac}" /> 
						<th scope="row">사원코드</th>
						<td><input type="text" name="caCode" id="caCode" class="text w100p" value="${careVO.caCode}" />
					</tr>
					<tr>
						<th scope="row">사원레벨</th>
						<td><input type="text" name="caLev" id="caLev" class="text w100p" value="${careVO.caLev}" /> 
						<th scope="row">인사평점</th>
						<td><input type="text" name="caSco" id="caSco" class="text w100p" value="${careVO.caSco}" />
					</tr>
					<tr>
						<th scope="row" >배송물품</th>
						<td><input type="text" name="caPrd" id="caPrd" class="text w100p" value="${careVO.caPrd}" />
						<td colspan="2" rowspan="2" style="position: relative; padding:0; width: 100%; height: 200px;">
					    		<img alt="#" src="https://x6i3g8y3.rocketcdn.me/wp-content/uploads/2023/02/20211216_02_01.jpg.webp?v=1685601196" style="position: absolute; width: 100%; height: 200px; transform: translateY(-100px)">
						</td>	
					</tr>
					<tr>
						<th scope="row">물품가격</th>
						<td><input type="text" name="caCost" id="caCost" class="text w100p" value="${careVO.caCost}" />
					</tr>
					<tr>
						<th scope="row">특이사항 내용</th>
						<td colspan="3">
							<textarea name="caCont" id="caCont" class="txt_area w_100p" style="position: absolute; width: 100%;" height="100%" left:0; top:0; frameborder="0">${util:unEscape(careVO.caCont)}</textarea>
						</td> 
					</tr>
					<tr>
						<th scope="row">첨부파일</th>
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?caAtchFileSeq=${careVO.caAtchFileSeq }&fileCnt=5&atchFileIdNm=caAtchFileSeq&updateType=upload" style="width: 100%;" height="100" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr> 
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
		nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "caCont",
				sSkinURI : "/resource/editor/SmartEditor2Skin.html",
				fCreator : "createSEditor2"
			});
	<%-- 예전에는 bind 썻는데 요즘은 on 쓰니까 bind 보이면 on 해주자--%>
		$("#btn_submit").on("click", function() {

			if (!$("#caErum").val()) {
				alert("이름을 입력해주세요");
				$("#caErum").focus();
				return false;
			}else if (!$("#caPhon").val()) {
				alert("연락처를 입력해주세요");
				$("#caPhon").focus();
				return false;
			}else if (!$("#caVehi").val()) {
				alert("관리차량을 입력해주세요");
				$("#caVehi").focus();
				return false;
			}else if (!$("#caDel").val()) {
				alert("배송지를 입력해주세요");
				$("#caDel").focus();
				return false;
			}else if (!$("#caTf").val()) {
				alert("배송여부를 입력해주세요");
				$("#caTf").focus();
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