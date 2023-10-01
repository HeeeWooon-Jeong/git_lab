<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- 	
		c:out 은 JSTL(JSP Standard Tag Library)의 하나로, JSP 페이지에서 값을 출력하는 데 사용되는 태그입니다.
		이 태그를 사용하면 출력할 데이터를 HTML 엔터티로 이스케이핑하고, 웹 페이지에 안전하게 출력할 수 있습니다. 
		value: 출력할 값 또는 표현식을 지정하는 속성입니다. 이 속성은 필수 속성으로, 출력하려는 데이터를 지정합니다.
		default: 값이 null이거나 비어있을 때 대체할 기본값을 지정하는 속성입니다. 이 속성은 선택적이며, 값이 없을 때 출력될 기본값을 정의할 수 있습니다.
		escapeXml: 기본적으로 true로 설정되어 있으며, 출력된 데이터를 XML 이스케이핑하여 특수 문자를 변환합니다. 
		웹 애플리케이션의 보안을 강화하기 위해 이스케이핑이 자동으로 수행됩니다. false로 설정하면 이스케이핑을 비활성화할 수 있습니다.
 -->
		
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>처리</title>
<script type="text/javascript" src="/publish/ma/js/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
	$(window).load(function () {
		var strMessage = "<c:out value="${message}"/>";
		var strError= "<c:out value="${error}"/>";
		var strScript = "<c:out value="${script}"/>";
		var strCommonScript = "<c:out value="${cmmnScript}" escapeXml="false"/>";
		var returnUrl = "<c:out value="${returnUrl}"/>";
		var strType = "<c:out value="${Type}"/>";
		var strName = "<c:out value="${pName}"/>";
		var strValue = "<c:out value="${pValue}"/>";
		
		
		if (strMessage.length > 0) {
			alert(strMessage);
		}
		if (strError.length > 0) {
			alert(strError);
			history.back();
		}
		if (strScript.length > 0) {
			eval(strScript);
		}
/* 		eval() 함수는 문자열로 주어진 JavaScript 코드를 실행할 수 있는 함수 */
		var fncCommonScript = function (strCommonScript) {
			if (strCommonScript == "login") {
				location.href="/ad/adminLogin/login";		 // "login"일 때: 브라우저의 현재 위치(location.href)를 변경하여 로그인 페이지로 이동합니다.
			}else if(strCommonScript == "close"){//Popup창 닫기
				opener.fncPageBoard('addList','addList.do','1');
				self.close();								 // "close"일 때: 팝업 창을 닫고, 부모 창에서 특정 함수 fncPageBoard를 호출한 뒤 현재 창을 닫습니다.
			}else if(strCommonScript == "close2"){//Popup창 닫기
				 opener.location.reload();					
				self.close();								// "close2"일 때: 팝업 창을 닫고, 부모 창을 새로고침합니다.
			}else if(strCommonScript == "list"){
				parent.board.list();						// "list"일 때: 부모 창의 board.list() 함수를 호출합니다.
			}else if(strCommonScript == "back"){
				history.back();								// "back"일 때: 브라우저의 이전 페이지로 이동합니다(history.back()).
			}else if(strCommonScript == "pop"){
				parent.board.pop();							// "pop"일 때: 부모 창의 board.pop() 함수를 호출합니다.
			}else{
				$("#defaultFrm").attr({"action" : strCommonScript, "method" : "post", "target" : "_self"}).submit();
			}												// 그 외의 경우: $("#defaultFrm")이라는 HTML 폼 요소의 속성을 변경하여 원하는 작업을 수행합니다.
		};
		if (strCommonScript.length > 0) {
			fncCommonScript(strCommonScript);
		}													// if (strCommonScript.length > 0) 조건문: strCommonScript 변수의 길이를 확인하고,  길이가 0보다 크면 fncCommonScript 함수를 호출합니다. 
															// 이렇게 하면 strCommonScript에 어떤 값이 포함되어 있는 경우에만 함수가 실행됩니다.
		
	});
	
</script>
<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
	<form:hidden path="boardDivn" id="boardDivn"/> 
	<form:hidden path="boardCd" id="boardCd"/> 
	<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
	<c:set var="arrName" value="${fn:split(pName,',')}" />
	<c:set var="arrValue" value="${fn:split(pValue,',')}" />
	<c:forEach var="result" items="${arrName }" varStatus="status">
		<input type="hidden" name="${result }" value="${arrValue[status.index] }" />
	</c:forEach>
</form:form>
</body>
</html>