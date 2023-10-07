package com.open.ma.ca.bthr.service;

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
@Alias("bthrVO")
public class BthrVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String bhSeq;			// 시퀀스 넘버
	private String bhRgstDt;		// 등록일
	private String bhRgstSeq;		// 등록자
	private String bhRvseDt;		// 수정일
	private String bhRvseSeq;		// 수정자
	private String bhName;			// 컨텐츠내용
	private String bhTitle;			// 컨텐츠내용
	private String bhCont;			// 컨텐츠내용
	private String bhAtchFileSeq;	// 파일첨부
	public String getBhSeq() {
		return bhSeq;
	}
	public void setBhSeq(String bhSeq) {
		this.bhSeq = bhSeq;
	}
	public String getBhRgstDt() {
		return bhRgstDt;
	}
	public void setBhRgstDt(String bhRgstDt) {
		this.bhRgstDt = bhRgstDt;
	}
	public String getBhRgstSeq() {
		return bhRgstSeq;
	}
	public void setBhRgstSeq(String bhRgstSeq) {
		this.bhRgstSeq = bhRgstSeq;
	}
	public String getBhRvseDt() {
		return bhRvseDt;
	}
	public void setBhRvseDt(String bhRvseDt) {
		this.bhRvseDt = bhRvseDt;
	}
	public String getBhRvseSeq() {
		return bhRvseSeq;
	}
	public void setBhRvseSeq(String bhRvseSeq) {
		this.bhRvseSeq = bhRvseSeq;
	}
	public String getBhName() {
		return bhName;
	}
	public void setBhName(String bhName) {
		this.bhName = bhName;
	}
	public String getBhTitle() {
		return bhTitle;
	}
	public void setBhTitle(String bhTitle) {
		this.bhTitle = bhTitle;
	}
	public String getBhCont() {
		return bhCont;
	}
	public void setBhCont(String bhCont) {
		this.bhCont = bhCont;
	}
	public String getBhAtchFileSeq() {
		return bhAtchFileSeq;
	}
	public void setBhAtchFileSeq(String bhAtchFileSeq) {
		this.bhAtchFileSeq = bhAtchFileSeq;
	}

	
	
	
}