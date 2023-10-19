<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="Content_box" style="padding: 0px 30px">
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="caSeq" id="caSeq"/>
		<form:hidden path="caDatSeq" id="caDatSeq"/>
		<form:hidden path="caDatName" id="caDatName"/>
		<%-- <form:hidden path="pageIndex" id="pageIndex"/>  --%>
		<form:hidden path="caAtchFileSeq" id="caAtchFileSeq"/>
		<form:hidden path="caDatAtchFileSeq" id="caDatAtchFileSeq"/>
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
							${careVO.caTitle }
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>등록자</strong></th>
						<td colspan="3">
							${careVO.caName }
						</td>
					</tr>
					<!-- content , file --> 
					<tr>
						<th scope="row"><strong>내용</strong></th>
						<td colspan="3">
							<div class="text_area">
								<c:out value="${util:unEscape(careVO.caCont)}" escapeXml="false"/>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="caAtchFileIdFrame" id="caAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${careVO.caAtchFileSeq}&fileCnt=5&atchFileIdNm=caAtchFileSeq&updateType=view" style="width: 100%;" height="70" frameborder="0" title="파일 업로드 폼"></iframe>

						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	<div class="btn_area">
		<a href="javascript:void(0);" id="btn_update" class="btn btn_mdl btn_rewrite" style="margin-bottom: 18px;">수정</a> 
		<a href="javascript:void(0);" id="btn_del" class="btn btn_mdl btn_del" style="margin-bottom: 18px;">삭제</a>
		<a href="javascript:void(0);" id="btn_list" class="btn btn_mdl btn_list" style="margin-bottom: 18px;">목록</a>
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
				<th scope="col" class="subject">내용</th>
				<th scope="col">등록자</th>
				<th scope="col">등록일</th> 
			</tr>

		</thead>
		<tbody>
			
			<c:choose>
				<c:when test="${empty careVO.caDatSeq}">
					<tr style="heigh:200;"><td colspan="6" class="no_data">데이터가 없습니다.</td></tr>
				</c:when>
				<c:otherwise>
							<tr class="cursor">
							<td>${careVO.caDatSeq}</td>
							<td>${careVO.caDatCont}</td>
							<td>${careVO.caDatName}</td>
							<td>${careVO.caDatRgstDt}</td>
						</tr>
						<tr>
							<th scope="row">첨부파일</th>
							<td colspan="3">
								<iframe name="caAtchFileIdFrame" id="caAtchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${careVO.caDatAtchFileSeq }&fileCnt=5&atchFileIdNm=caDatAtchFileSeq&updateType=view" style="width: 100%;" height="100" frameborder="0" title="파일 업로드 폼"></iframe>
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
								<th scope="row">내용</th>
								<td colspan="3">
									<input type="text" name="caDatCont" id="caDatCont" class="text w100p" value="${careVO.caDatCont}" />
								</td>
							</tr>
							<tr>
								<th scope="row">첨부파일</th>
								<td colspan="3">
									<iframe name="caDatAtchFileSeq" id="caDatAtchFileSeq" src="/atch/fileUpload.do?atchFileId=${careVO.caDatAtchFileSeq}&fileCnt=5&atchFileIdNm=caDatAtchFileSeq&updateType=upload" style="width: 100%;" height="100" frameborder="0" title="파일 업로드 폼"></iframe>
								</td>
							</tr>    
						</tbody>
					</table>
				</div>
			<c:choose>
				<c:when test="${empty careVO.caDatSeq}">
					<div class="btn_area">
						<a href="javascript:void(0);" class="btn btn_mdl btn_save" id="btn_submit" >등록</a>
						<c:if test="${searchVO.procType ne 'update'}">
							<a href="javascript:void(0);" class="btn btn_mdl btn_cancel" id="btn_returnView">취소</a>
						</c:if>
					</div>
				</c:when>		
				<c:otherwise>
					<div class="btn_area">
						<a href="javascript:void(0);" id="btn_submit" class="btn btn_mdl btn_rewrite" >수정</a> 
						<a href="javascript:void(0);" id="btn_dat_del" class="btn btn_mdl btn_del" >삭제</a>
						<a href="javascript:void(0);" id="btn_dat_list" class="btn btn_mdl btn_list" >취소</a>
					</div>	
				</c:otherwise>
			</c:choose>
			
			
	</form:form>
	
<script type="text/javascript">
		var oEditors = [];
		$(document).ready(function() {

	<%-- 예전에는 bind 썻는데 요즘은 on 쓰니까 bind 보이면 on 해주자--%>
		$("#btn_submit").on("click", function() {
			if (!$("#caDatCont").val()) {
				alert("내용을 입력해주세요");
				$("#caDatCont").focus();
				return false;
			}
			fncPageBoard('submit', 'updateDatProc.do');
		 	return false;
			});
			$("#btn_returnView").click(function() {
				$("#boardSeq").val($("#boardGrpSeq").val());
				fncPageBoard('view', 'view.do');
			});
			$("#btn_dat_del").on("click", function() {
				fncPageBoard('del', 'deleteDatProc.do');
				return false;
			});
			$("#btn_dat_list").on("click", function() {
				fncPageBoard('addList','addList.do','${searchVO.pageIndex}');		
				return false;
			});
		});
	</script>
	<script type="text/javascript" src="/publish/ma/js/board.js"></script>
	
</div>

	