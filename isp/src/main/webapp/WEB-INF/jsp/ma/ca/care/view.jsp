<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>

<div class="Content_box">
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="caSeq" id="caSeq"/>
		<%-- <form:hidden path="pageIndex" id="pageIndex"/>  --%>
		<form:hidden path="caAtchFileSeq" id="caAtchFileSeq"/>
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
							${careVO.caName }
						</td>
	                    <th scope="row"><strong>등록일</strong></th>
						<td>${careVO.caRgstDt }</td>
					</tr> 
					<tr>
						<th scope="row"><strong>이름</strong></th>
						<td>
							${careVO.caErum }
						</td>
	                    <th scope="row"><strong>연락처</strong></th>
						<td>${careVO.caPhon }</td>
					</tr> 
					<tr>
						<th scope="row"><strong>관리차량</strong></th>
						<td>
							${careVO.caVehi }
						</td>
	                    <th scope="row"><strong>차량번호</strong></th>
						<td>${careVO.caNum }</td>
					</tr> 
					<tr>
						<th scope="row"><strong>배송지</strong></th>
						<td>
							${careVO.caDel }
						</td>
	                    <th scope="row"><strong>방문지역</strong></th>
						<td>${careVO.caLocal }</td>
					</tr> 
					<tr>
						<th scope="row"><strong>배송여부</strong></th>
						<td>
							${careVO.caTf }
						</td>
	                    <th scope="row"><strong>특이사항</strong></th>
						<td>${careVO.caEtc }</td>
					</tr> 
					<tr>
						<th scope="row"><strong>출근시간</strong></th>
						<td>
							${careVO.caStart }
						</td>
	                    <th scope="row"><strong>퇴근시간</strong></th>
						<td>${careVO.caEnd }</td>
					</tr> 
					<tr>
						<th scope="row"><strong>휴가일</strong></th>
						<td>
							${careVO.caVac }
						</td>
	                    <th scope="row"><strong>사원코드</strong></th>
						<td>${careVO.caCode }</td>
					</tr> 
					<tr>
						<th scope="row"><strong>사원레벨</strong></th>
						<td>
							${careVO.caLev }
						</td>
	                    <th scope="row"><strong>인사평점</strong></th>
						<td>${careVO.caSco }</td>
					</tr> 
			
					<!-- content , file --> 
					<tr>
						<th scope="row"><strong>특이사항</strong></th>
						<td colspan="1">
							<div class="text_area">
								<c:out value="${util:unEscape(careVO.caCont)}" escapeXml="false"/>
							</div>
						</td>
						
						<td colspan="2" style="width: 100%%; height: 30px; padding: 0; margin: 0; text-align: center; vertical-align: middle;">
  <img alt="#" src="https://previews.123rf.com/images/gmast3r/gmast3r1605/gmast3r160500005/55962922-%EC%82%B0-%EB%B2%94%EC%9C%84-%EC%97%AC%EB%A6%84-%EA%B0%80%EB%A1%9C-%EA%B0%80%EB%A1%9C-%EB%B0%B0%EB%84%88-%EB%B2%A1%ED%84%B0-%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8-%EB%A0%88%EC%9D%B4-%EC%85%98.jpg"
       style="width: 100%; height: 100%; object-fit: cover; overflow: hidden;  height: 41px;">
</td>

					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${careVO.caAtchFileSeq}&fileCnt=5&atchFileIdNm=caAtchFileSeq&updateType=view" style="width: 100%;" height="70" frameborder="0" title="파일 업로드 폼"></iframe>
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
	</form:form>
	<script type="text/javascript" src="/publish/ma/js/board.js"></script>
</div>
