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
				<th scope="col">영화코드</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test=" ${fn:length(resultList) gt 0 }">
				<%-- 
<c:when test="${fn:length(resultList) gt 0}">: 
이 부분은 resultList라는 변수의 길이가 0보다 큰 경우에만 아래 내용을 실행합니다. 
즉, resultList에 데이터가 존재하는 경우에만 테이블을 생성합니다. 
--%>
					<c:forEach var="result" items="${resultList}" varStatus="status">
<%-- <c:forEach var="result" items="${resultList}" varStatus="status">: 
resultList에 있는 각 항목을 반복적으로 처리하기 위한 반복문입니다. result 변수는 현재 처리 중인 항목을 나타내며, varStatus는 반복문의 상태 정보를 저장합니					 --%>

<%-- `varStatus`는 JSTL(`<c:forEach>`) 태그 내에서 사용되는 변수입니다. 이 변수는 현재 반복문의 상태 정보를 저장하고 관리하는 데 사용됩니다. `varStatus` 속성을 사용하여 다음과 같은 정보를 얻을 수 있습니다:

1. `varStatus.index`: 현재 반복문에서의 인덱스(0부터 시작)를 나타냅니다.

2. `varStatus.count`: 현재 반복문에서의 반복 횟수(1부터 시작)를 나타냅니다.

3. `varStatus.first`: 현재 항목이 반복문의 첫 번째 항목인 경우 `true`를, 그렇지 않은 경우 `false`를 반환합니다.

4. `varStatus.last`: 현재 항목이 반복문의 마지막 항목인 경우 `true`를, 그렇지 않은 경우 `false`를 반환합니다.

5. `varStatus.begin`: 반복문의 첫 번째 항목의 인덱스(0부터 시작)를 나타냅니다.

6. `varStatus.end`: 반복문의 마지막 항목의 인덱스(0부터 시작)를 나타냅니다.

이러한 정보는 반복문 내에서 현재 항목의 위치와 상태를 파악하고 해당 정보를 사용하여 특정 작업을 수행할 때 유용합니다. 예를 들어, 첫 번째 항목과 마지막 항목에 다른 스타일을 적용하거나 특정 조건을 확인하기 위해 `varStatus`를 사용할 수 있습니다. --%>

						<tr class="cursor">
							<td onclick="fncPageBoard('view','view.do','${result.twSeq}','twSeq')">
							<%-- list의  폼태그 안에 	<input type="hidden" id="twSeq" name="twSeq"/>  id와 관련있음 --%>
<%-- <td onclick="fncPageBoard('view','view.do','${result.ctSeq}','ctSeq')">: 
HTML <td> 요소를 생성하고, 클릭 시 fncPageBoard 함수를 호출합니다. 
이 함수는 클릭한 항목에 대한 상세 정보를 보여주는 기능을 수행합니다. ${result.ctSeq}는 현재 항목의 ctSeq 값을 나타냅니다. --%>							
								${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.count)}
								<%-- 페이징처리 상단에도 있음 --%>
<%-- ${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.count)}: 
현재 행의 번호를 표시하는 부분입니다. 페이징 정보와 반복문의 상태(status.count)를 사용하여 행 번호를 계산합니다. --%>								
							</td>
							<td class="subject" onclick="fncPageBoard('view','view.do','${result.twSeq}','twSeq')">${util:cutText(result.twTitle,30,'...') }</td>
<%-- ${util:cutText(result.ctTitle,30,'...') }: 현재 항목의 ctTitle을 최대 30자까지만 표시하고 초과하는 부분은 '...'로 대체하여 출력합니다. --%>							
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
		<%-- 버튼은 기본값이 submit이라서 까딱 애러가 나올수 있기 때문에 버튼을 만들때 a 태그로 만든다 
			href = "#" 일경우 화면 맨위로 올려주는 효과가 있기때문에  javascript:void(0); 로 대체
			a 태그에  onclick 할때는 가끔 오작동하는 경우가 있다 하기때문에 마지막에 return false 걸어주기
		--%>
	</div>
</div>
<%-- //paging end--%>





