package com.open.ma.ca.ctwo;

import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.open.ma.ca.ctwo.service.CtwoVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class CtwoController {

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
    private final static String PROGRAM_ID = "Ctwo";

    /** folderPath **/
    private final static String folderPath = "/ma/ca/ctwo/";
    
	//@Resource(name = "beanValidator")
	//protected DefaultBeanValidator beanValidator;
	
    @Autowired
	private EhCacheCacheManager cacheManager;
    
	Logger log = Logger.getLogger(this.getClass());

	/**
	 * 메뉴권한 목록화면
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(folderPath + "list.do")
	public String list(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model) throws Exception {

		return ".mLayout:"+ folderPath + "list";
	}
	
	/**
	 * 메뉴권한 목록화면
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping(folderPath + "addList.do")
	public String addList(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model) throws Exception {

		/** EgovPropertyService.Care */
		searchVO.setPageUnit(5);
		searchVO.setPageSize(6);

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		int totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		@SuppressWarnings("unchecked")
		List<CtwoVO> resultList = (List<CtwoVO>) cmmnService.selectList(searchVO, PROGRAM_ID);
		model.addAttribute("resultList", resultList);
		
		return folderPath + "addList";
	}



	/**
	 * 메뉴권한 상세화면
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath +"view.do")
	public String view(@ModelAttribute("searchVO") CtwoVO searchVO, ModelMap model) throws Exception {
		
		/* 게시판 상세정보 */
		CtwoVO ctwoVO = new CtwoVO();
		ctwoVO = (CtwoVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		model.addAttribute("ctwoVO", ctwoVO);
		
		return ".mLayout:" + folderPath + "view";
	}

	/**
	 * 메뉴권한 등록화면
	 * @param searchVO
	 * @param model
	 * @param procType
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(folderPath + "{procType}Form.do")
	public String form(@ModelAttribute("searchVO") CtwoVO searchVO, ModelMap model,@PathVariable String procType) throws Exception {
		
		CtwoVO ctwoVO = new CtwoVO();
		if (procType.equals("update")) {
			ctwoVO = (CtwoVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		}
		ctwoVO.setSearchVO(searchVO);
		model.addAttribute("ctwoVO", ctwoVO);

		return ".mLayout:"+ folderPath + "form";
	}

	/**
	 * 메뉴권한 처리
	 * @param searchVO
	 * @param model
	 * @param status
	 * @param procType
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = folderPath + "{procType}Proc.do", method = RequestMethod.POST)
	public String proc(@ModelAttribute("searchVO") CtwoVO searchVO, ModelMap model, SessionStatus status,@PathVariable String procType) throws Exception {
		
		
		if(procType != null){
			
			if (procType.equals("insert")) {
				cmmnService.insertContents(searchVO, PROGRAM_ID);
			} else if (procType.equals("update") ) {				
				cmmnService.updateContents(searchVO, PROGRAM_ID);				
			} else if(procType.equals("updateDat")){
				cmmnService.updateDatContents(searchVO, PROGRAM_ID);				
			} else if (procType.equals("delete")) {				
				cmmnService.deleteContents(searchVO, PROGRAM_ID);
			} 
			if(procType.equals("update")&&procType.equals("updateDat")){
				model.addAttribute("message", "수정되었습니다.");
				model.addAttribute("pName", "ctSeq");	
				model.addAttribute("pValue", searchVO.getCtSeq());
				model.addAttribute("cmmnScript", "view.do");
				return "cmmn/execute";
	    	}else if(procType.equals("insert")){
				model.addAttribute("message", "등록되었습니다.");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
	    	}else if(procType.equals("delete")){
				model.addAttribute("message", "삭제되었습니다.");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
	    	}else{
	    		return "redirect:list.do";
	    	}
		}

		return "redirect:list.do";

	}

	

	
		

}
