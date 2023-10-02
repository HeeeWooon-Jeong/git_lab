<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>

<div class="Content_box">
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="meSeq" id="meSeq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<%-- <form:hidden path="atchFileSeq" id="atchFileSeq"/> --%>
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
						<th scope="row"><strong>사번</strong></th>
						<td>
							${memberVO.meCnum }
						</td>
	                    <th scope="row"><strong>이름</strong></th>
						<td>${memberVO.meMnam }</td>
					</tr> 
					<tr>
						<th scope="row"><strong>연락처</strong></th>
						<td>
							${memberVO.meCall }
						</td>
	                    <th scope="row"><strong>부서</strong></th>
						<td>${memberVO.meBusu }</td>
					</tr> 
					<tr>
						<th scope="row"><strong>직급</strong></th>
						<td>
							${memberVO.meLeve }
						</td>
	                    <th scope="row"><strong>입사일</strong></th>
						<td>${memberVO.meStaDate }</td>
					</tr> 
					<tr>
						<th scope="row"><strong>퇴사일</strong></th>
						<td>
							${memberVO.meEndDate }
						</td>
	                    <th scope="row"><strong>휴가일</strong></th>
						<td>${memberVO.meVac }</td>
					</tr> 
					<tr>
						<th scope="row"><strong>총근무일수</strong></th>
						<td>
							${memberVO.meTotaL }
						</td>
	                    <th scope="row"><strong>주소</strong></th>
						<td>${memberVO.meAdre }</td>
					</tr> 
					<tr>
						<th scope="row"><strong>인사고과</strong></th>
						<td>
							${memberVO.meGood }
						</td>
	                    <th scope="row"><strong>근무연차</strong></th>
						<td>${memberVO.meYear }</td>
					</tr> 
					<tr>
						<th scope="row"><strong>이메일</strong></th>
						<td>
							${memberVO.meMail }
						</td>
	                    <th scope="row"><strong>인트라아이디</strong></th>
						<td>${memberVO.meTid }</td>
					</tr> 
					<tr>
						<th scope="row"><strong>차량번호</strong></th>
						<td>
							${memberVO.meGun }
						</td>
	                    <th scope="row"><strong>연봉</strong></th>
						<td>${memberVO.meDon }</td>
					</tr> 
		
					<!-- content , file --> 
					<tr>
						<th scope="row"><strong>인적사항</strong></th>
						<td colspan="3">
							<div class="text_area">
								<c:out value="${util:unEscape(memberVO.meCont)}" escapeXml="false"/>
							</div>
						</td>
					</tr>
			<%-- 
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${memberVO.twAtchFileSeq }&fileCnt=5&atchFileIdNm=twAtchFileSeq&updateType=view" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr> --%>
				</tbody>
			</table>
		</div>
		
	<div class="btn_area">
		<a href="javascript:void(0);" id="btn_update" class="btn btn_mdl btn_rewrite" >수정</a> 
		<a href="javascript:void(0);" id="btn_del" class="btn btn_mdl btn_del" >삭제</a>
		<a href="javascript:void(0);" id="btn_list" class="btn btn_mdl btn_list" >목록</a>
	</div>	
	</form:form>
	<script type="text/javascript" src="/publish/ma/js/board.js"></script>
</div>
