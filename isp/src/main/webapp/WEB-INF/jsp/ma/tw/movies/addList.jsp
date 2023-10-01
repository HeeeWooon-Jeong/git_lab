<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/> 
<!-- 태그라이브러리 불러올것들을 한번에 불러오는 코드임  -->
<div class="tbl_top">
	<div class="tbl_left"><i class="i_all"></i><span>전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.pageIndex}/${paginationInfo.totalPageCount} Page) </span></div>
	<div class="tbl_right"></div>
</div>
<div class="tbl_wrap">
	<table class="tbl_col_type01">
		<caption>목록</caption>
		<colgroup> 
			<col style="width:5%">
			<col>
			<col style="width:10%">
			<col style="width:10%">
			<col style="width:10%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col" class="subject">제목</th>
<!--			<th scope="col">등록자</th>
				<th scope="col">등록일</th> -->
				<th scope="col">감독</th>
				<th scope="col">장르</th>
				<th scope="col">배급사</th>
				<th scope="col">영확코드</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(resultList) gt 0}">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="cursor">
							<td onclick="fncPageBoard('view','view.do','${result.twSeq}','twSeq')">
								${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.count)}
								<!-- 페이징처리 상단에도 있음 -->
							</td>
							<td class="subject" onclick="fncPageBoard('view','view.do','${result.twSeq}','twSeq')">${util:cutText(result.twTitle,30,'...') }</td>
							<%-- <td onclick="fncPageBoard('view','view.do','${result.twSeq}','twSeq')">${result.twName }</td> --%>
							<td onclick="fncPageBoard('view','view.do','${result.twSeq}','twSeq')">${result.twDirector }</td>
							<td onclick="fncPageBoard('view','view.do','${result.twSeq}','twSeq')">${result.twGenre }</td>
							<td onclick="fncPageBoard('view','view.do','${result.twSeq}','twSeq')">${result.twCompany }</td>
							<td onclick="fncPageBoard('view','view.do','${result.twSeq}','twSeq')">${result.twCode }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr><td colspan="6" class="no_data">데이터가 없습니다.</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
<%-- //tbl end --%>
<%-- paging start --%>
<div class="paging_wrap">
	<div class="paging">
		<ui:pagination paginationInfo="${paginationInfo}" type="manage" jsFunction="fncPageBoard" />
	</div>
	<div class="btn_right">
		<a href="javascript:void(0);" class="btn btn_mdl btn_save" onclick="fncPageBoard('write','insertForm.do'); return false; ">등록</a>
		<!-- 버튼은 기본값이 submit이라서 까딱 애러가 나올수 있기 때문에 버튼을 만들때 a 태그로 만든다 
			href = "#" 일경우 화면 맨위로 올려주는 효과가 있기때문에  javascript:void(0); 로 대체
			a 태그에  onclick 할때는 가끔 오작동하는 경우가 있다 하기때문에 마지막에 return false 걸어주기
		-->
	</div>
</div>
<%-- //paging end--%>