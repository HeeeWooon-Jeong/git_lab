package com.open.ma.ca.ctwo.service;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;

/**
 * Content VO 클래스
 * @author 공통서비스 개발팀 yd.go
 * @since 2016.09.08
 * @version 1.0
 * @see
 *  
 
 */
@Alias("ctwoVO")
public class CtwoVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String ctSeq;			// 시퀀스 넘버
	private String ctRgstDt;		// 등록일
	private String ctRgstSeq;		// 등록자
	private String ctRvseDt;		// 수정일
	private String ctRvseSeq;		// 수정자
	private String ctName;			// 컨텐츠내용
	private String ctTitle;			// 컨텐츠내용
	private String ctCont;			// 컨텐츠내용
	private String ctAtchFileSeq;	// 파일첨부
	
	
	public String getCtTitle() {
		return ctTitle;
	}
	public void setCtTitle(String ctTitle) {
		this.ctTitle = ctTitle;
	}
	public String getCtSeq() {
		return ctSeq;
	}
	public void setCtSeq(String ctSeq) {
		this.ctSeq = ctSeq;
	}
	public String getCtRgstDt() {
		return ctRgstDt;
	}
	public void setCtRgstDt(String ctRgstDt) {
		this.ctRgstDt = ctRgstDt;
	}
	public String getCtRgstSeq() {
		return ctRgstSeq;
	}
	public void setCtRgstSeq(String ctRgstSeq) {
		this.ctRgstSeq = ctRgstSeq;
	}
	public String getCtRvseSeq() {
		return ctRvseSeq;
	}
	public void setCtRvseSeq(String ctRvseSeq) {
		this.ctRvseSeq = ctRvseSeq;
	}
	public String getCtRvseDt() {
		return ctRvseDt;
	}
	public void setCtRvseDt(String ctRvseDt) {
		this.ctRvseDt = ctRvseDt;
	}
	public String getCtCont() {
		return ctCont;
	}
	public void setCtCont(String ctCont) {
		this.ctCont = ctCont;
	}
	public String getCtAtchFileSeq() {
		return ctAtchFileSeq;
	}
	public void setCtAtchFileSeq(String ctAtchFileSeq) {
		this.ctAtchFileSeq = ctAtchFileSeq;
	}
	public String getCtName() {
		return ctName;
	}
	public void setCtName(String ctName) {
		this.ctName = ctName;
	}


	
}