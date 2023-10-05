package com.open.ma.tw.movies;

import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.ma.tw.movies.service.MoviesVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class MoviesController {

	@Resource(name = "cmmnService")
	protected CmmnService cmmnService;

	@Resource(name = "FileMngService")
	private FileMngService fileMngService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** fileUploadProperties */
	@Resource(name = "fileUploadProperties")
	Properties fileUploadProperties;

	/**
	 * MappingJackson2JsonView.
	 */
	@Resource
	private MappingJackson2JsonView ajaxView;

	/** Program ID **/
	private final static String PROGRAM_ID = "Movies";

	/** folderPath **/
	private final static String folderPath = "/ma/tw/movies/";
	// 패키지나 jsp url 경로 @RequestMapping(folderPath + "list.do") 에서 사용할려고 만듬

	// @Resource(name = "beanValidator")
	// protected DefaultBeanValidator beanValidator;

	@Autowired
	private EhCacheCacheManager cacheManager;

	Logger log = Logger.getLogger(this.getClass());

	/**
	 * 메뉴권한 목록화면
	 * 
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(folderPath + "list.do")
	// HTTP 요청 경로를 지정합니다. folderPath + "list.do"는 요청 경로를 결정하는데 사용되며, 컨트롤러의 list
	// 메서드가 이 경로의 요청을 처리
	public String list(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request)throws Exception {
		// HTTP GET 또는 POST 요청을 처리
		// ModelMap model: 이것은 데이터를 뷰로 전달하는 데 사용되는 모델입니다. 컨트롤러는 이 모델을 사용하여 뷰에
		// 데이터를 전달
		// HttpServletRequest request: 현재의 HTTP 요청에 대한 정보를 받아옵니다.
		return ".mLayout:" + folderPath + "list";
		// return ".mLayout:"+ folderPath + "list";: 이 부분은 메서드의 반환값을 나타냅니다. 문자열
		// ".mLayout:"+ folderPath + "list"를 반환하고 있습니다.
		// 이것은 일반적으로 뷰의 이름 또는 경로를 나타냅니다
		// ".mLayout:"라는 문자열은 뷰 리졸버(View Resolver)에 의해 처리될 수 있는 논리적인 뷰 이름의 일부로
		// 사용
	}
	/*
	 * 컨트롤러 메서드는 요청을 처리하고 모델을 설정한 후, 뷰의 이름을 반환하여 웹 애플리케이션의 화면을 렌더링하는 데 사용됩니다. 이
	 * 코드 조각은 Spring MVC 패턴을 따르고 있으며, 컨트롤러와 뷰 간의 데이터 흐름을 관리하기 위해 Spring
	 * Framework에서 제공하는 기능을 활용하고 있습니다.
	 */

	/*
	 * throws Exception은 Java 메서드 선언에서 사용되는 예외 처리 관련 구문입니다. 이 부분은 메서드가 실행 중에 예외가
	 * 발생할 수 있다는 것을 나타내며, 이 메서드에서 발생할 수 있는 예외를 명시적으로 나열하는 것이 일반적입니다. 구체적으로
	 * throws Exception은 해당 메서드 내에서 발생할 수 있는 모든 예외를 Exception 클래스를 상속받는 예외로
	 * 처리하겠다는 의미입니다. 즉, 이 메서드에서 어떤 예외가 발생하면 그 예외는 모두 Exception 클래스로 처리되며, 이를 호출한
	 * 코드에서 예외를 적절하게 처리하도록 요구합니다.
	 */

	/**
	 * 메뉴권한 목록화면
	 * 
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping(folderPath + "addList.do")
	public String addList(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model) throws Exception {

		/** EgovPropertyService.Movies */
		searchVO.setPageUnit(5);
		searchVO.setPageSize(6);
		/*
		 * spring -> properties-local 사이트 공통으로 사용하는 것들 정리
		 * 
		 */
		// 페이징 처리하는거
		// 전자정부 페이지네이션쪽 설명 나와있음
		// paginationInfo 에 값이 들어감
		// jsp 파일마다 있음
		// addList 56줄 부분으로 이동해보자
		//
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		int totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID);
		paginationInfo.setTotalRecordCount(totCnt); // totCnt = 전체 갯수
		model.addAttribute("paginationInfo", paginationInfo);

		@SuppressWarnings("unchecked")
		List<MoviesVO> resultList = (List<MoviesVO>) cmmnService.selectList(searchVO, PROGRAM_ID);
		model.addAttribute("resultList", resultList);

		return folderPath + "addList";
	}

	/**
	 * 메뉴권한 상세화면
	 * 
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "view.do")
	public String view(@ModelAttribute("searchVO") MoviesVO searchVO, ModelMap model, HttpServletRequest request)throws Exception {

		/* 게시판 상세정보 */
		MoviesVO moviesVO = new MoviesVO();
		moviesVO = (MoviesVO) cmmnService.selectContents(searchVO, PROGRAM_ID); // 정보조회해서
																				// 뿌려주는거
		model.addAttribute("moviesVO", moviesVO);

		return ".mLayout:" + folderPath + "view";
	}

	/*
	 * 이 메서드는 게시판의 상세 정보를 조회하고 해당 정보를 모델에 추가하여 사용자에게 보여주는 역할을 합니다.
	 * 
	 * @SuppressWarnings("unchecked") 이 어노테이션은 컴파일러 경고를 무시하도록 지시합니다
	 * 
	 * @RequestMapping(folderPath +"view.do"): 이 어노테이션은 HTTP 요청 경로(/view.do)에 대한
	 * 요청을 이 메서드가 처리한다고 지정
	 * 
	 * public String view(@ModelAttribute("searchVO") MoviesVO searchVO,
	 * ModelMap model, HttpServletRequest request) throws Exception: 이 메서드는
	 * view라는 이름의 컨트롤러 메서드로, HTTP GET 요청을 처리합니다.
	 * 
	 * @ModelAttribute("searchVO") MoviesVO searchVO: 요청 파라미터와 모델 객체 간의 데이터 바인딩을
	 * 위한 searchVO라는 이름의 모델 속성을 나타냅니다. 이 모델 속성은 HTTP 요청 파라미터를 MoviesVO 클래스의 객체에
	 * 바인딩 ModelMap model: 컨트롤러에서 뷰로 데이터를 전달하기 위한 모델 객체입니다. HttpServletRequest
	 * request: HTTP 요청 객체입니다.
	 * 
	 * moviesVO = (MoviesVO) cmmnService.selectContents(searchVO, PROGRAM_ID );:
	 * cmmnService라는 서비스(또는 서비스 계층)를 호출하여 데이터베이스에서 영화 정보를 조회하는 메서드인
	 * selectContents를 호출하고, 그 결과를 moviesVO에 저장합니다. * searchVO 객체는 영화 정보 조회의 조건을
	 * 나타내며, PROGRAM_ID는 어떤 영화 정보를 조회할 것인지를 식별하는 데 사용됩니다.
	 * 
	 * model.addAttribute("moviesVO", moviesVO);: 조회한 영화 정보를 모델에 추가하여 뷰로 전달합니다.
	 * moviesVO 객체는 뷰에서 사용할 수 있도록 모델에 "moviesVO"라는 이름으로 저장됩니다.
	 * 
	 * return ".mLayout:"+ folderPath + "view";: 이 메서드의 실행이 완료되면 .mLayout: 뒤에
	 * folderPath와 "view" 문자열을 결합하여 뷰 이름을 반환합니다. 이 뷰 이름은 클라이언트에게 표시될 뷰 템플릿의 경로를
	 * 나타냅니다.
	 * 
	 * 
	 * 이 컨트롤러 메서드는 HTTP GET 요청을 처리하며, searchVO에 지정된 조건으로 데이터베이스에서 영화 정보를 조회하고,
	 * 조회한 결과를 모델에 추가하여 뷰로 전달합니다. 이를 통해 클라이언트에게 웹 페이지에 영화 정보를 표시할 수 있게 됩니다.
	 */
	/**
	 * 메뉴권한 등록화면
	 * 
	 * @param searchVO
	 * @param model
	 * @param procType
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(folderPath + "{procType}Form.do")
	// {procType}은 URL 경로의 일부로 사용되는 경로 변수입니다. 이 경로 변수의 값은 요청 URL에서 추출되고,
	// procType 매개변수에 전달됩니다
	public String form(@ModelAttribute("searchVO") MoviesVO searchVO, ModelMap model, @PathVariable String procType, HttpServletRequest request) throws Exception {
		// "searchVO"라는 모델 속성의 값을 받아옵니다. 이 모델 속성은 HTTP 요청의 파라미터를 객체로 변환하고 이 객체를
		// 컨트롤러에 전달합니다. 이 객체는 MoviesVO 클래스의 인스턴스입니다.

		MoviesVO moviesVO = new MoviesVO(); // MoviesVO 클래스의 인스턴스를 생성합니다.
		if (procType.equals("update")) {
			moviesVO = (MoviesVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
			// cmmnService.selectContents(searchVO, PROGRAM_ID)를 호출하여 searchVO를
			// 기반으로 데이터를 조회하고 moviesVO에 할당합니다.
			// 이것은 업데이트 페이지를 준비할 때 사용되는 데이터를 검색하는 부분
		}
		searchVO.setProcType(procType); // searchVO 객체의 procType 속성을 procType
										// 변수의 값으로 설정합니다. 어디서 사용할려고 하는지 모르겠음
										// sql과의 트랜잭션을 위해 작업의 목적을 명시하기위해 사용?
		moviesVO.setSearchVO(searchVO); // moviesVO 객체의 searchVO 속성을 searchVO
										// 객체로 설정합니다. 업데이트한다면 정보의 수정을 위해 바뀌어야할
										// 데이터를 선택할때 사용 하는것 ?
		model.addAttribute("moviesVO", moviesVO);
		// 모델에 "moviesVO"라는 이름으로 moviesVO 객체를 추가합니다. 이를 통해 컨트롤러에서 뷰로 데이터를 전달할 수
		// 있습니다.
		return ".mLayout:" + folderPath + "form";
		/*
		 * 이 부분은 메서드의 반환값을 나타냅니다. 문자열 ".mLayout:"+ folderPath + "form"를 반환하고
		 * 있습니다. 이것은 일반적으로 뷰의 이름 또는 경로를 나타냅니다. 예를 들어, 컨트롤러는 이 반환값을 통해 어떤 뷰를
		 * 렌더링할지 결정합니다. 이 경우 ".mLayout:"라는 문자열은 뷰 리졸버(View Resolver)에 의해 처리될 수
		 * 있는 논리적인 뷰 이름의 일부로 사용
		 */ 
	}

	/*
	 * @pathVariable URL 경로에 포함된 변수 값을 추출하는 데 사용됩니다.
	 * 
	 * @PathVariable은 주로 RESTful 웹 애플리케이션에서 경로 변수를 사용할 때 유용합니다. procType이라는
	 * 변수를 @PathVariable로 사용하는 경우, URL 경로에서 추출된 값은 해당 메서드의 매개변수로 전달됩니다.
	 * 
	 * 
	 * ModelMap 클래스는 Spring 프레임워크에서 모델 데이터를 관리하고 뷰에 전달하기 위한 클래스입니다. ModelMap 과
	 * Model 차이
	 * 
	 * `ModelMap`과 `Model`은 둘 다 Spring 프레임워크에서 모델 데이터를 관리하고 컨트롤러에서 뷰로 데이터를 전달하기
	 * 위한 방법을 제공하는 클래스 또는 인터페이스입니다. 그러나 두 가지 중요한 차이점이 있습니다:
	 * 
	 * 1. **타입**: - `ModelMap`: `ModelMap`은 `LinkedHashMap<String, Object>`을
	 * 확장(상속)한 클래스로, 이름과 값의 쌍으로 모델 데이터를 관리합니다. 이 클래스는 맵의 형태로 데이터를 저장하고 전달합니다. -
	 * `Model`: `Model`은 Spring 프레임워크의 인터페이스로, 모델 데이터를 맵이 아닌 간단한 객체로 관리합니다.
	 * `Model` 인터페이스를 구현하는 구현체는 실제로 모델 데이터를 어떻게 저장하고 전달할지에 대한 방법을 결정합니다. 주로
	 * `ModelMap`이나 `ExtendedModelMap` 클래스를 사용하여 `Model` 인터페이스를 구현합니다.
	 * 
	 * 2. **확장성**: - `ModelMap`: `ModelMap`은 이름과 값의 쌍을 관리하기 위한 일반적인 맵 형태의
	 * 클래스입니다. 컨트롤러에서 데이터를 저장하고 뷰로 전달하기 위한 다양한 메서드를 제공합니다. 여기에 데이터를 저장할 때 키는
	 * 문자열이어야 합니다. - `Model`: `Model`은 인터페이스이므로 실제 구현은 다양할 수 있습니다. Spring은
	 * `Model` 인터페이스의 구현체로 `ModelMap`을 사용하지만, 사용자 정의 모델 데이터 관리 클래스를 만들어 사용할 수도
	 * 있습니다. 이는 컨트롤러와 뷰 사이의 데이터 전달 방식을 커스터마이징하려는 경우에 유용합니다.
	 * 
	 * Spring 웹 애플리케이션에서는 모델 데이터를 관리하고 컨트롤러에서 뷰로 전달하는 데 Model 인터페이스가 일반적으로
	 * 사용됩니다. 이 인터페이스를 구현한 구현체 중에서 ModelMap이 주로 사용되며, ModelMap은 데이터를 저장하고 전달하는 데
	 * 유용한 메서드를 제공합니다.
	 */

	/**
	 * 메뉴권한 처리
	 * 
	 * @param searchVO
	 * @param model
	 * @param status
	 * @param procType
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = folderPath + "{procType}Proc.do", method = RequestMethod.POST)
	// : 이 메서드는 folderPath와 procType 경로 변수를 사용하여 POST 요청을 처리합니다. procType은 URL
	// 경로의 일부로 사용되는 경로 변수입니다. 이 변수의 값은 요청 URL에서 추출되어 procType 매개변수에 전달
	public String proc(@ModelAttribute("searchVO") MoviesVO searchVO, ModelMap model, SessionStatus status, @PathVariable String procType, HttpServletRequest request) throws Exception {
// @ModelAttribute("searchVO") MoviesVO searchVO: searchVO라는 이름의 모델 속성을 받아옵니다. 이 모델 속성은 HTTP 요청의 파라미터를 MoviesVO 클래스의 객체로 변환한 것입니다.
// ModelMap model: 모델 객체로, 데이터를 뷰로 전달하는데 사용됩니다.
// SessionStatus status: 세션 상태를 관리하는 객체로, 중복 Submit 방지를 위해 세션에 저장된 모델을 삭제합니다.
			
//		@PathVariable String procType: URL 경로에서 추출된 procType 값을 받아옵니다. 이 값에 따라 다양한 작업을 수행합니다.		
		
		if (procType != null) {

			if (procType.equals("insert")) {
				cmmnService.insertContents(searchVO, PROGRAM_ID);
			} else if (procType.equals("update")) {
				cmmnService.updateContents(searchVO, PROGRAM_ID);
			} else if (procType.equals("delete")) {
				cmmnService.deleteContents(searchVO, PROGRAM_ID);

			}
			// 프록타입 지정 어떤작업을 태워 보낼지
//			procType의 값에 따라 다양한 작업을 수행합니다. 각 작업은 cmmnService를 사용하여 데이터를 처리하고, 모델에 메시지와 스크립트를 추가합니다.
			status.setComplete(); // 중복 Submit 방지 : 세션에 저장된 model 을 삭제한다.

			if (procType.equals("update")) {
				model.addAttribute("message", "수정되었습니다.");
				model.addAttribute("pName", "twSeq");
				model.addAttribute("pValue", searchVO.getTwSeq()); //
				model.addAttribute("cmmnScript", "view.do"); // 뷰의 이름을 태워보내 해당
																// 뷰로 이동 하기위함
				
//				작업 결과를 모델에 추가합니다. 예를 들어, 데이터 처리 메시지와 다음에 실행할 스크립트 등이 모델에 추가됩니다.
				return "cmmn/execute";
//				뷰 이름을 반환합니다. 이 경우, "cmmn/execute"라는 뷰가 렌더링되어 결과를 표시합니다.
			} else if (procType.equals("insert")) {
				model.addAttribute("message", "등록되었습니다.");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
			} else if (procType.equals("delete")) {
				model.addAttribute("message", "삭제되었습니다..");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
			} else {
				return "redirect:list.do"; // procType이 위에서 언급한 작업 중 어느 것에도 해당하지
											// 않는 경우 "list.do"로 리다이렉션합니다.
			}
		}
		/*
		 * addAttribute 함수는 주로 모델 객체에 속성(attribute)을 추가하는 메서드입니다. 이 함수는 주로 웹
		 * 애플리케이션 개발에서 모델-뷰-컨트롤러(MVC) 아키텍처에서 사용됩니다. 주로 Spring 프레임워크의 Model 객체나 ModelMap 객체에서 발견됩니다. 
		 * 
		 * 데이터 추가: addAttribute 함수는 주로 키-값 쌍을 사용하여 데이터를 모델에 추가합니다. 
		 * 예를 들어, 특정 속성의 이름(키)과 값을 전달하여 모델에 추가합니다. 
		 * 
		 * 모델 업데이트: 이미 존재하는 모델에 새데이터를 추가하거나 기존 데이터를 업데이트할 때 사용됩니다. 따라서 여러 개의 addAttribute 호출을 사용하여 모델을 구성할 수 있습니다. 
		 * 
		 * 데이터 전달: 모델에 추가된 데이터는 보통 웹 페이지의 뷰 템플릿(HTML, JSP 등)에서 사용됩니다. 뷰는 모델에 추가된 데이터를 렌더링하여 최종 사용자에게 표시합니다. 
		 * 
		 * 메서드 체이닝: 대부분의 경우 addAttribute 함수는 메서드 체이닝(Method Chaining)을 지원합니다. 
		 * 			    이것은 여러 개의 addAttribute 호출을 연이어 사용할 수 있게 하며, 코드의 가독성을 향상시킬 수 있습니다.
		 * 
		 */
		return "redirect:list.do";

	}

}
