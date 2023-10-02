/*$(function(){
	$(".gnb").hover(function(){
		if($(".subWrap").is(":hidden")){
			$(".subWrap").slideDown();
			$(".gnb_bg").slideDown();
		}else{
			$(".subWrap").show();
			$(".gnb_bg").show();
		}
		$(".gnb > li").on("mouseenter focusin",function(){
			$(".gnb > li > a").removeClass("current");
			$(this).children().addClass("current");
		});
	});
	$(".gnb").on("mouseenter focusin",function(){
		if($(".subWrap").is(":hidden")){
			$(".subWrap").slideDown();
			$(".gnb_bg").slideDown();
		}else{
			$(".subWrap").show();
			$(".gnb_bg").show();
		}
		$(".gnb > li").on("mouseenter focusin",function(){
			$(".gnb > li > a").removeClass("current");
			$(this).children().addClass("current");
		});
	});
	$(".gnb").on("mouseleave blur",function(){
		$(".subWrap").slideUp();
		$(".gnb_bg").slideUp();
	});
	$(".gnb > li").on("mouseleave blur",function(){
		$(this).children().removeClass("current");
	});
	$('*:not(".gnb *")').focus(function(){
		$(".subWrap").slideUp();
		$(".gnb > li > a").removeClass("current");
		$(".gnb_bg").slideUp();
	});
});*/

//left menu
(function($){
    $(document).ready(function(){
    $('#lnb li.active').addClass('open').children('ul').show();
        $('#lnb li.has_sub>a').on('click', function(){
            $(this).removeAttr('href');
            var element = $(this).parent('li');
            if (element.hasClass('open')) {
                element.removeClass('open');
                element.find('li').removeClass('open');
                element.find('ul').slideUp(200);
            }
            else {
                element.addClass('open');
                element.children('ul').slideDown(200);
                element.siblings('li').children('ul').slideUp(200);
                element.siblings('li').removeClass('open');
                element.siblings('li').find('li').removeClass('open');
                element.siblings('li').find('ul').slideUp(200);
            }
        });
        
        $('.numOnly').keydown(function(event) {
		 	this.value=this.value.replace(/[^0-9]/g,'');
		 });
		 $('.numOnly').keyup(function(event) {
		 	this.value=this.value.replace(/[^0-9]/g,'');
		 });
	     $('body').mousedown(function(event) {
			 $('.numOnly').each(function(){
		 		this.value=this.value.replace(/[^0-9]/g,'');
			 })
		 });
    });
})(jQuery);
/*제공한 코드는 JavaScript 스니펫으로, jQuery 라이브러리를 사용하는 것으로 보입니다. 이 코드는 웹 페이지나 웹 애플리케이션의 일부로 작성되었으며 해당 페이지의 요소에 기능을 추가하는 목적을 가지고 있습니다. 이 코드가 하는 일을 살펴보겠습니다.

1. 모든 내용을 자체 호출 함수로 래핑합니다. 이는 전역 변수 충돌을 방지하기 위해 개인 범위를 생성하는 데 사용되는 것입니다.

2. jQuery를 사용하여 문서가 준비되기를 기다립니다 (`$(document).ready(...)`). 이렇게 함으로써 코드가 DOM (문서 객체 모델)이 완전히 로드되고 조작할 준비가 될 때 실행됩니다.

3. ID가 `lnb`인 요소를 선택하고 클래스가 `active`인 요소에 `open` 클래스를 추가하고 자식 `ul` 요소를 표시합니다. 이것은 내비게이션 항목을 열고 닫는 관련된 것으로 보입니다.

4. 클래스가 `has_sub`인 요소 내부의 앵커 (`<a>`) 요소에 클릭 이벤트 핸들러를 추가합니다. 이 앵커 요소 중 하나가 클릭되면 다음 작업을 수행합니다.
   - 클릭된 앵커에서 `href` 속성을 제거하여 기본 네비게이션 동작을 방지합니다.
   - 클릭된 앵커의 부모인 `li` 요소를 결정합니다.
   - 부모 `li`에 `open` 클래스가 있는 경우 이를 닫습니다 (`open` 클래스를 제거하고 자식 `ul`을 위로 슬라이드합니다).
   - 그렇지 않은 경우 엽니다 (`open` 클래스를 추가하고 자식 `ul`을 아래로 슬라이드하며 형제 `li` 요소와 그들의 자식 `ul` 요소를 닫습니다).

5. 클래스가 `numOnly`인 입력 요소에 이벤트 핸들러를 추가하여 숫자 입력만 허용합니다. 이를 위해 `keydown` 및 `keyup` 이벤트를 사용하여 숫자가 아닌 문자를 빈 문자열로 대체합니다.

6. 전체 `body` 요소에 대한 `mousedown` 이벤트 핸들러를 전역 이벤트 핸들러로 추가합니다. 이 이벤트 핸들러 내에서 `numOnly` 클래스를 가진 모든 요소를 반복하고 숫자가 아닌 문자를 빈 문자열로 대체합니다. 이렇게 함으로써 사용자가 입력 필드에 숫자가 아닌 문자를 붙여 넣더라도 제거됩니다.

총괄적으로 이 코드는 확장 가능한/축소 가능한 하위 메뉴가 있는 내비게이션 메뉴의 동작을 제어하고 특정 입력 필드에 대해 숫자 입력을 강제하는 것으로 보입니다. 이 코드는 jQuery와 함께 작동하도록 설계되었으므로 웹 페이지에서 이 코드가 올바르게 작동하려면 jQuery 라이브러리를 포함해야 합니다.*/


$(document).ready(function(){
	//leftarea on off
/*	$('.btn_sideClose').click(function(){
    if ($('.btn_sideClose').hasClass('open')) {
      $(this).removeClass('open');
      $('#left_content').stop().animate({"left":"0"},500);
	  $('#content').stop().animate({"padding-left":"210px"},500);
    }else {
      $(this).addClass('open');
      $('#left_content').stop().animate({"left":"-210px"},500);
	  $('#content').stop().animate({"padding-left":"0"},500);
    }
  });
  $('.btn_sideOpen').click(function(){
    $('#left_content').stop().animate({"left":"0"},500);
	 $('#content').stop().animate({"padding-left":"210px"},500);
    $(this).hide();
    $('.btn_sideClose').show();
});*/

	//search
	$(".search_detail").hide();
    $(".search_block").show();
    $(".btn_detail").click(function(){
        if($('.search_detail').is(":hidden")){
             $(".search_detail").slideDown("4000");
             $(".btn_search i").removeClass("fa-caret-down").addClass("fa-caret-up");
        }else{
            $(".search_detail").slideUp("4000");
            $(".btn_search i").removeClass("fa-caret-up").addClass("fa-caret-down");
        }
    });

	var selectTarget = $('.search_select select');
    selectTarget.on('blur', function(){
        $(this).parent().removeClass('focus');
    });
    selectTarget.change(function(){
        var select_name = $(this).children('option:selected').text();
        $(this).siblings('label').text(select_name);
    });

	//tab
	$(".tab_content").hide();
    $(".tab_content:first").show();
	$(".tab_menu a").click(function(event) {
		event.preventDefault();
		$(this).parent().addClass("current");
		$(this).parent().siblings().removeClass("current");
		var tab = $(this).attr("href");
		$(".tab_content").not(tab).css("display", "none");
		$(tab).fadeIn();
	});
/*	제공한 코드는 JavaScript와 jQuery를 사용하여 웹 페이지에서 다음과 같은 기능을 구현하는 것으로 보입니다:

		1. 검색 기능:
		   - 초기에 `.search_detail` 요소를 숨기고 `.search_block` 요소를 표시합니다.
		   - `.btn_detail` 버튼을 클릭할 때, `.search_detail` 요소가 숨겨져 있으면 아래로 슬라이드되고 아이콘 클래스를 변경하며, 이미 열려 있으면 숨겨집니다.

		2. 셀렉트 박스 (드롭다운) 관련 기능:
		   - 셀렉트 박스(`select`)가 포커스를 잃으면 부모 요소에서 `focus` 클래스를 제거합니다.
		   - 셀렉트 박스의 값이 변경되면 선택된 옵션의 텍스트를 해당 셀렉트 박스와 연결된 레이블(`label`)에 표시합니다.

		3. 탭 (Tab) 메뉴 관련 기능:
		   - 초기에 모든 `.tab_content` 요소를 숨기고 첫 번째 `.tab_content` 요소를 표시합니다.
		   - `.tab_menu`의 하위 앵커(`a`) 요소를 클릭하면 해당 요소의 부모에 `current` 클래스를 추가하고 다른 형제 요소의 `current` 클래스를 제거합니다.
		   - 클릭한 탭에 해당하는 `.tab_content`만 표시하고 나머지는 숨깁니다.

		이 코드는 웹 페이지에서 검색, 셀렉트 박스, 그리고 탭 메뉴와 같은 상호작용 기능을 구현하는 데 사용될 수 있습니다. 페이지에서 해당 클래스와 이벤트 핸들러들을 가진 HTML 요소들을 찾아서 이 코드를 적용하면 됩니다.*/
	
	/* tab */
	
	 // main tab
    $(".main_tabCcontent").hide();
    $(".main_tabCcontent:first").show();
    $("#mainTab a").click(function(event) {
        event.preventDefault(); //주소에 #숨김
        $(this).parent().addClass("current");
        $(this).parent().siblings().removeClass("current");
        var tab = $(this).attr("href");
        $(".main_tabCcontent").not(tab).css("display", "none");
        $(tab).fadeIn();
    });
    // main tab
   $(".main_tabCcontent2").hide();
   $(".main_tabCcontent2:first").show();
   $("#mainTab2 a").click(function(event) {
       event.preventDefault(); //주소에 #숨김
       $(this).parent().addClass("current");
       $(this).parent().siblings().removeClass("current");
       var tab = $(this).attr("href");
       $(".main_tabCcontent2").not(tab).css("display", "none");
       $(tab).fadeIn();
   });
    //sub tab1
    $(".tab_content1").hide();
    $(".tab_content1:first").show();
    $("#tab1 a").click(function(event) {
        event.preventDefault(); //주소에 #숨김
        $(this).parent().addClass("current");
        $(this).parent().siblings().removeClass("current");
        var tab = $(this).attr("href");
        $(".tab_content1").not(tab).css("display", "none");
        $(tab).fadeIn();
    });
    //sub tab2
    $(".tab_content2").hide();
    $(".tab_content2:first").show();
    $("#tab2 a").click(function(event) {
        event.preventDefault(); //주소에 #숨김
        $(this).parent().addClass("active");
        $(this).parent().siblings().removeClass("active");
        var tab = $(this).attr("href");
        $(".tab_content2").not(tab).css("display", "none");
        $(tab).fadeIn();
    });
	
	
});
/*제공한 코드는 다중 탭 구성을 가지고 있는 웹 페이지에서 탭 간의 전환을 처리하는 JavaScript 및 jQuery 코드입니다. 각 탭 그룹에 대한 기능이 중복되는 것을 알 수 있으며, 각각의 주석과 함께 설명하겠습니다:

	1. **메인 탭 (Main Tab) 구현 (첫 번째 세트):**
	   - `.main_tabCcontent` 클래스를 가진 요소들을 숨깁니다.
	   - 첫 번째 `.main_tabCcontent` 요소를 표시합니다.
	   - `#mainTab a` 선택자를 클릭했을 때의 동작을 정의합니다.
	   - 클릭 이벤트의 기본 동작을 막습니다 (주소에 #가 추가되는 것을 방지).
	   - 클릭한 앵커(`a`)의 부모에 `current` 클래스를 추가하고 다른 형제 요소에서 `current` 클래스를 제거합니다.
	   - 클릭한 탭에 해당하는 `.main_tabCcontent`만 표시하고 나머지는 숨깁니다.

	2. **메인 탭 (Main Tab) 구현 (두 번째 세트):**
	   - `.main_tabCcontent2` 클래스를 가진 요소들을 숨깁니다.
	   - 첫 번째 `.main_tabCcontent2` 요소를 표시합니다.
	   - `#mainTab2 a` 선택자를 클릭했을 때의 동작을 정의합니다. (내용과 동작은 첫 번째 세트와 동일)

	3. **서브 탭1 구현:**
	   - `.tab_content1` 클래스를 가진 요소들을 숨깁니다.
	   - 첫 번째 `.tab_content1` 요소를 표시합니다.
	   - `#tab1 a` 선택자를 클릭했을 때의 동작을 정의합니다. (내용과 동작은 메인 탭과 유사)

	4. **서브 탭2 구현:**
	   - `.tab_content2` 클래스를 가진 요소들을 숨깁니다.
	   - 첫 번째 `.tab_content2` 요소를 표시합니다.
	   - `#tab2 a` 선택자를 클릭했을 때의 동작을 정의합니다. (내용과 동작은 메인 탭과 유사)

	이 코드는 웹 페이지에서 여러 개의 탭 그룹을 관리하며, 각 탭 그룹 내에서 탭 간의 전환을 처리합니다. 사용자가 각 탭을 클릭하면 해당 탭에 대한 내용이 표시되고 다른 탭 내용은 숨겨집니다.*/




//팝업
function view_show(num) {
  var left = ( $(window).scrollLeft() + ( $(window).width() - $('.popup').width()) / 2 );
  var top = ( $(window).scrollTop() + ( $(window).height() - $('.popup').height()) / 2 );
  $('.popup').css({'left':left,'top':top, 'position':'absolute'});
  document.getElementById("dispay_view"+num).style.display = "block";
  document.getElementById("layer_bg").style.display = "block";
}

function view_hide(num) {
  document.getElementById("dispay_view"+num).style.display = "none";
  document.getElementById("layer_bg").style.display = "none";
}

var fncDate = function(){
	var setDate = arguments;
	var getId;
	var fmt = "yy.mm.dd";
	switch (setDate.length) {
		case 1: getId ="#"+setDate[0];break;
		case 2: if(setDate[1] != ''){getId ="#"+setDate[0]+", #"+setDate[1];break;}else{getId ="#"+setDate[0];break;}
		case 3: if(setDate[1] != ''){getId ="#"+setDate[0]+", #"+setDate[1];fmt=setDate[2];break;}else{getId ="#"+setDate[0];fmt=setDate[2];break;}
	}
	
	 var dates = $( getId ).datepicker({
      changeMonth: true,
      changeYear: true,
      showOn: "button",
      buttonImage: "/publish/ma/images/icon_calendar.png",
      buttonImageOnly: true,
      dateFormat : fmt,
      onSelect: function( selectedDate ) {
          var option = this.id == setDate[0] ? "minDate" : "maxDate",
          instance = $( this ).data( "datepicker" ),
          date = (fmt == 'yy.mm' ? new Date(instance.selectedYear, instance.selectedMonth, 1) : $.datepicker.parseDate( $.datepicker._defaults.dateFormat, selectedDate, instance.settings ))
    	  dates.not( this ).datepicker( "option", option, date );
      }
  });
}

var getMenuCd = function(str){alert(str);
	 var rStr="";
	 var arrStr = str.split("/");
	 if(arrStr.length == 4){
		 rStr = arrStr[1]+"/"+arrStr[2];
	 }else if(arrStr.length == 5){
		 rStr = arrStr[1]+"/"+arrStr[2]+"/"+arrStr[3];
	 }
	 return rStr;
}

var replaceAll = function(str, oldChar, newChar){
	   var tmp = str.split(oldChar).join(newChar);
	   return tmp;
	};
/*	
	제공한 코드는 JavaScript 함수들의 집합으로 구성되어 있으며 다양한 작업을 수행하는 함수들을 포함합니다. 아래에서 각 함수를 설명하겠습니다:

		1. **`view_show(num)` 함수:** 
		   - 이 함수는 팝업을 표시하는 역할을 합니다.
		   - 먼저 팝업의 위치를 계산하고, 팝업을 화면 가운데에 배치합니다.
		   - `dispay_view`와 `layer_bg`라는 ID를 가진 요소를 찾아서 화면에 표시합니다.

		2. **`view_hide(num)` 함수:**
		   - 이 함수는 팝업을 숨기는 역할을 합니다.
		   - `dispay_view`와 `layer_bg`라는 ID를 가진 요소를 찾아서 화면에서 숨깁니다.

		3. **`fncDate()` 함수:**
		   - 이 함수는 날짜 선택기 (datepicker)를 설정하는 역할을 합니다.
		   - 함수는 매개변수로 선택기를 적용할 요소의 ID 및 날짜 형식을 받습니다.
		   - jQuery UI의 datepicker를 사용하여 입력된 요소에 날짜 선택 인터페이스를 추가하고 날짜 형식을 지정합니다. 또한, 날짜 선택 시 최소 및 최대 날짜를 설정합니다.

		4. **`getMenuCd(str)` 함수:**
		   - 이 함수는 주어진 문자열 `str`에서 일부 정보를 추출하는 역할을 합니다.
		   - 슬래시("/")로 구분된 문자열을 받아서, 특정 위치의 문자열을 추출하여 반환합니다. 문자열이 "/a/b/c"와 같이 구성되어 있으면, "a/b" 또는 "a/b/c"를 반환합니다.

		5. **`replaceAll(str, oldChar, newChar)` 함수:**
		   - 이 함수는 문자열 `str`에서 모든 `oldChar`를 `newChar`로 대체하는 역할을 합니다.
		   - 문자열 내에서 `oldChar`를 찾아서 `newChar`로 모두 대체한 새로운 문자열을 반환합니다.

		각 함수는 주어진 작업을 수행하기 위해 사용됩니다. 예를 들어, `view_show`와 `view_hide` 함수는 팝업을 관리하고, `fncDate` 함수는 날짜 선택 인터페이스를 설정합니다. 나머지 함수들은 문자열 조작에 사용됩니다. 함수들은 코드 내에서 필요한 기능을 수행하기 위해 호출될 것입니다.*/