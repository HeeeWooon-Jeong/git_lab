<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<!-- JSP 페이지의 설정
	charset=utf-8 - 읽을떄 문자가 깨지지 않게
	만약 이 부분을 제거하면 페이지의 문자 인코딩이 기본값으로 설정될 것
	
	pageEncoding="utf-8 - 쓸때
	JSP 페이지에서 사용될 문자 인코딩을 지정 -->
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
	<!-- 
	다른 JSP 파일의 내용을 현재 JSP 페이지에 삽입하거나 포함
	file 속성은 포함할 JSP 파일의 경로를 지정
	주로 공통 헤더나 푸터, 사이드바 등과 같이 여러 페이지에서 공유되는 부분을 분리하여 재사용할 때 사용
	다른 JSP 파일인 "incTagLib.jsp" 파일을 포함시킵니다.  
	포함되는 JSP 파일의 내용은 포함하는 JSP 페이지의 위치에 삽입-->

<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>

	<!-- JSTL(Core Tag Library)을 사용하여 "url"이라는 변수를 생성하고, 현재 요청의 URI(Uniform Resource Identifier)를 저장
	"javax.servlet.forward.request_uri"는 현재 요청의 URI(Uniform Resource Identifier)를 나타내는 특별한 요청 속성입니다.
	
	javax (Java Extension)패키지는 Java 표준 라이브러리의 일부로 포함되어 있으며, Java 플랫폼의 다양한 기능과 확장을 지원하는 중요한 역할 -->
<script type="text/javascript" src="/publish/ma/js/board.js"></script>
	<!-- JavaScript 파일 "board.js"를 페이지에 추가 -->
<script type="text/javaScript">
$(document).ready(function(){
	/* fncDate('searchStartDate','searchEndDate'); */	
	fncPageBoard('addList','addList.do',1);
});
</script>
	<!-- fncPageBoard" 함수를 호출하여 페이지를 초기화하는데 사용
	ma/js/board.js
	 -->


<%-- content --%>
<div class="content_box">
	<%-- search  --%>
	<div class="search_box">
		<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post"  onsubmit="return false;">
<!-- 			- `commandName` 속성은 폼 데이터를 바인딩할 객체의 이름을 지정
			onsubmit="return false;" = 폼 제출 시 기본 동작을 막는 JavaScript 코드 -->
			<input type="hidden" id="seq" name="seq"/>
			<input type="hidden" id="pageIndex" name="pageIndex"/>
			<fieldset>
				<legend>검색</legend>
					<!-- 이 라인은 `<legend>` 요소를 생성하여 검색 필드 그룹의 제목을 표시 -->
					<!-- <fieldset>은 폼 요소를 논리적 그룹으로 묶는 데 사용되며, 이 그룹에 관련된 <legend> 제목을 추가함으로써 그룹의 목적을 설명할 수 있습니다. 이는 웹 양식을 작성할 때 사용자에게 폼 그룹의 내용을 이해하기 쉽게 만들어주는 데 도움이 됩니다. -->
				<div class="search_basic">
					<strong class="tit">검색구분</strong>
					<form:select path="searchCondition" id="searchCondition" title="구분 선택" cssClass="w100"  >  
<%-- 					Spring Framework의 `<form:select>` 태그를 사용하여 검색 구분을 선택하는 드롭다운 목록을 생성
						`path` 속성은 해당 목록이 바인딩될 객체의 속성 경로
						`id` 속성은 목록의 ID를 지정
						`title` 속성은 목록의 제목(툴팁)을 지정
						`cssClass` 속성은 목록에 적용할 CSS 클래스 class 와 같음 --%>
						
						<form:option value="0" label="전체"/>
						<form:option value="1" label="제목"/>
						<form:option value="2" label="내용"/>
					</form:select>
					<form:input path="searchKeyword" id="searchKeyword" class="text w50p" />
					<span class="search_btns">
						<button type="button" class="btn btn_search" id="btn_search">검색</button>
					</span>
				</div>
			</fieldset>
				<!-- 이 라인은 `<fieldset>` 요소를 생성하며, 검색 필드를 그룹화하는 역할 -->
		</form:form>
<%-- 			Spring Framework의 `<form:form>` 태그를 사용하여 HTML `<form>`을 생성 --%>
		
		
	</div>
	<%--// search  --%>
	<div class="tbl">
	</div>
</div>

<%-- 
Spring Framework의 `<form:form>`은 Spring Web MVC 프로젝트에서 사용되는 커스텀 JSP 태그 라이브러리입니다. 이 태그를 사용하면 HTML `<form>` 요소를 생성하고 제출할 때 Spring MVC 컨트롤러와 연동할 수 있습니다.

`<form:form>` 태그를 사용하려면 다음과 같이 Spring Form 태그 라이브러리를 JSP 페이지에 추가해야 합니다:

```jsp
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
```

그런 다음 `<form:form>` 태그를 사용하여 폼을 생성할 수 있습니다. `<form:form>` 태그의 주요 속성과 사용법은 다음과 같습니다:

1. `modelAttribute` 속성:
   - `modelAttribute` 속성은 폼과 연관된 모델 객체를 지정합니다. 이 모델 객체는 Spring 컨트롤러로부터 전달받은 데이터를 표현합니다.
   - 예를 들어, `<form:form modelAttribute="user">`는 "user"라는 모델 객체와 연결된 폼을 생성합니다. Spring 컨트롤러는 "user" 모델을 폼에 바인딩하고 사용자가 입력한 데이터를 이 모델에 저장합니다.

2. `action` 속성:
   - `action` 속성은 폼을 제출할 URL을 지정합니다. Spring 컨트롤러에 요청을 보낼 때 이 URL로 이동합니다.
   - 예를 들어, `<form:form modelAttribute="user" action="/submitForm">`는 "/submitForm" URL로 폼 데이터를 제출합니다.

3. `method` 속성:
   - `method` 속성은 HTTP 요청 메서드를 지정합니다. 기본적으로 "POST"로 설정됩니다.
   - 예를 들어, `<form:form modelAttribute="user" action="/submitForm" method="post">`는 POST 요청으로 폼 데이터를 제출합니다.

4. 기타 속성:
   - `<form:form>` 태그는 다른 HTML `<form>` 요소와 마찬가지로 다양한 속성을 포함할 수 있습니다. 예를 들어 `id`, `class`, `enctype` 등의 속성을 설정할 수 있습니다.
 
 enctype (Encoding Type)은 HTML <form> 요소에서 사용되는 속성 중 하나로, 서버로 데이터를 제출할 때 데이터가 어떻게 인코딩되는지를 지정합니다. enctype은 주로 파일 업로드 및 데이터 전송 시에 사용됩니다.
 
`<form:form>` 태그를 사용하면 Spring MVC와 함께 데이터 바인딩 및 유효성 검사를 쉽게 수행할 수 있습니다. 또한 폼 필드를 자동으로 생성하고 폼 데이터를 모델 객체에 매핑하는 데 도움이 됩니다. --%>