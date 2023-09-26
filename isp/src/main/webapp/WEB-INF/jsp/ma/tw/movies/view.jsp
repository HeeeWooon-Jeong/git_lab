<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<%
    pageContext.setAttribute("crcn", "\r\n"); 
    pageContext.setAttribute("br", "<br>");
%> 
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
<div class="twContent_box">
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="twSeq" id="twSeq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<form:hidden path="twAtchFileSeq" id="twAtchFileSeq"/>
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
						<th scope="row"><strong>등록자</strong></th>
						<td>
							${moviesVO.twRgstSeq }
						</td>
	                    <th scope="row"><strong>등록일</strong></th>
						<td>${moviesVO.twRgstDt }</td>
					</tr> 
					<tr>
						<th scope="row"><strong>개봉일</strong></th>
						<td>
							${moviesVO.twStaDate }
						</td>
	                    <th scope="row"><strong>마감일</strong></th>
						<td>${moviesVO.twEndDate }</td>
					</tr> 
					<tr>
						<th scope="row"><strong>제목</strong></th>
						<td>
							${moviesVO.twTitle }
						</td>
	                    <th scope="row"><strong>영문제목</strong></th>
						<td>${moviesVO.twETitle }</td>
					</tr> 
					<tr>
						<th scope="row"><strong>국가코드</strong></th>
						<td>
							${moviesVO.twCode }
						</td>
	                    <th scope="row"><strong>제작년도</strong></th>
						<td>${moviesVO.twMakeYear }</td>
					</tr> 
					<tr>
						<th scope="row"><strong>제작국가</strong></th>
						<td>
							${moviesVO.twNational }
						</td>
	                    <th scope="row"><strong>유형</strong></th>
						<td>${moviesVO.twType }</td>
					</tr> 
					<tr>
						<th scope="row"><strong>장르</strong></th>
						<td>
							${moviesVO.twGenre }
						</td>
	                    <th scope="row"><strong>감독</strong></th>
						<td>${moviesVO.twDirector }</td>
					</tr> 
					<tr>
						<th scope="row"><strong>제작사</strong></th>
						<td>
							${moviesVO.twCompany }
						</td>
	                    <th scope="row"><strong>주연배우</strong></th>
						<td>${moviesVO.twActor }</td>
					</tr> 
					<tr>
						<th scope="row"><strong>배급사</strong></th>
						<td>
							${moviesVO.twTcom }
						</td>
	                    <th scope="row"><strong>평점</strong></th>
						<td>${moviesVO.twLati }</td>
					</tr> 
			
					<!-- content , file --> 
					<tr>
						<th scope="row"><strong>줄거리</strong></th>
						<td colspan="3">
							<div class="text_area">
								<c:out value="${util:unEscape(moviesVO.twCont)}" escapeXml="false"/>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${moviesVO.twAtchFileSeq }&fileCnt=5&atchFileIdNm=twAtchFileSeq&updateType=view" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	<div class="btn_area">
		<a href="#" id="btn_update" class="btn btn_mdl btn_rewrite" >수정</a> 
		<a href="#" id="btn_del" class="btn btn_mdl btn_del" >삭제</a>
		<a href="#" id="btn_list" class="btn btn_mdl btn_list" >목록</a>
	</div>	
	</form:form>
</div>
