<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>


<div class="twContent_box">
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
	 <!-- ID 	- 중복 불가
	 	  Class - 중복 가능
	 	  Name	- 중복 가능
	 	  
	 	  name 의 값이 두개일경우 겹침 1과 2 를 보낸다면
	 	  1, 2 두개의 값을 받아버림
	 	  특정 네임을 [] 배열로 선언한다면
	 	  배열로 받는게 가능함
	 	  
	 	   -->
		<form:hidden path="twSeq" id="twSeq"/>
		<%-- form:hidden path="pageIndex" id="pageIndex"/>  --%>
		<!-- 페이지 인덱싱을 위해  값을 물고있어야 하기위함
			지워도 페이지를 머물수 있게 할 수 있다 
			왜냐 = 
			<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
			검색 관련된 인풋은 미리 선언되어 있다 
			검색 기능은 계속 돌아가야 하기때문에 미리 선언
			
			히든으로 page인덱스를 name값으로 보내면서
			태그라이브러리 로 또 값이 존재하기때문에 지워야 한다
			
			
			 -->
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
				<!--  원래는 아래 나오는 {} EL은 cout 을 써야함 
				
				-->
					<tr>
						<th scope="row"><strong>등록자</strong></th>
						<td>
							${moviesVO.twName }
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
<%--
c:out: 
JSTL의 c:out 태그는 출력할 내용을 화면에 표시하는 데 사용됩니다.

value="{util:unEscape(moviesVO.twCont)}": 
c:out 태그의 value 속성을 사용하여 출력할 값을 지정합니다. 
util:unEscape(moviesVO.twCont)는 어떤 문자열을 출력하기 전에 특수 문자를 이스케이프(escape)하지 않고 출력하도록 지정합니다. 
escapeXml="false"는 XML 이스케이프를 사용하지 않도록 설정합니다. 
따라서 {util:unEscape(moviesVO.twCont)}의 값인 moviesVO.
twCont가 HTML 특수 문자(예: <, >, & 등)를 포함하고 있더라도 이스케이프되지 않고 그대로 출력될 것입니다.
--%>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${moviesVO.twAtchFileSeq}&fileCnt=5&atchFileIdNm=twAtchFileSeq&updateType=view" style="width: 100%;" height="70px" frameborder="0" title="파일 업로드 폼"></iframe>
					   <%-- <iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${sampleVO.atchFileId      }&fileCnt=5&atchFileIdNm=atchFileId&updateType=view" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe> --%>
							<!-- iframe 다른 페이지에 있는 것을 가져와 붙이는 것 한 페이지에 있는 것 같지만 다른 곳에 있음
							사용처 :	다른 웹 페이지의 내용을 현재 페이지에 삽입하여 보여줄 때.
									지도, 동영상 플레이어, 소셜 미디어 위젯 등 외부 서비스를 웹 페이지에 통합할 때.
									웹 애플리케이션의 일부 기능을 다른 웹 페이지로 분리하여 로드 및 실행할 때.
									
							코드해석 : src = /atch/fileUpload.do 를 호출 이걸 실행하면 iframe 태그에 내용이 붙여짐
							
							webapp->web-inf->jsp->cmmn->fms->fncFileList.jsp 로 이동
							ifame 높이설정 부분이 있음 어떤것을 이름을 바꿔야 하는지 알 수 있다
							 -->
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
