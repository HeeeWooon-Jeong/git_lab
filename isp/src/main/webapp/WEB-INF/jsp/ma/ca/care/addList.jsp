<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

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
				<th scope="col">등록자</th>
				<th scope="col">등록일</th> 
				<th scope="col">수정자</th> 
				<th scope="col">수정일</th> 
			</tr>
		</thead>
		<tbody>
		
			<c:choose>
				<c:when test="${fn:length(resultList) gt 0}">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="cursor">
							<td onclick="fncPageBoard('view','view.do','${result.caSeq}','caSeq')">
								${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.count)}
							</td>
							<td class="subject" onclick="fncPageBoard('view','view.do','${result.caSeq}','caSeq')">${util:cutText(result.caTitle,30,'...') }</td>
							<%-- <td onclick="fncPageBoard('view','view.do','${result.caSeq}','caSeq')">${result.twName }</td> --%>
							<td onclick="fncPageBoard('view','view.do','${result.caSeq}','caSeq')">${result.caName}</td>
							<td onclick="fncPageBoard('view','view.do','${result.caSeq}','caSeq')">${result.caRgstDt}</td>
							<td onclick="fncPageBoard('view','view.do','${result.caSeq}','caSeq')">${result.caName}</td>
							<td onclick="fncPageBoard('view','view.do','${result.caSeq}','caSeq')">${result.caRvseDt}</td>
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
	</div>
</div>
<%-- //paging end--%>













