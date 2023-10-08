package com.open.ma.ca.btwo.service;

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
@Alias("btwoVO")
public class BtwoVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String btSeq;			// 시퀀스 넘버
	private String btRgstDt;		// 등록일
	private String btRgstSeq;		// 등록자
	private String btRvseDt;		// 수정일
	private String btRvseSeq;		// 수정자
	private String btName;			// 컨텐츠내용
	private String btTitle;			// 컨텐츠내용
	private String btCont;			// 컨텐츠내용
	private String btAtchFileSeq;	// 파일첨부
	private String btDat;	// 파일첨부
	
	
	
	public String getBtDat() {
		return btDat;
	}
	public void setBtDat(String btDat) {
		this.btDat = btDat;
	}
	public String getBtSeq() {
		return btSeq;
	}
	public void setBtSeq(String btSeq) {
		this.btSeq = btSeq;
	}
	public String getBtRgstDt() {
		return btRgstDt;
	}
	public void setBtRgstDt(String btRgstDt) {
		this.btRgstDt = btRgstDt;
	}
	public String getBtRgstSeq() {
		return btRgstSeq;
	}
	public void setBtRgstSeq(String btRgstSeq) {
		this.btRgstSeq = btRgstSeq;
	}
	public String getBtRvseDt() {
		return btRvseDt;
	}
	public void setBtRvseDt(String btRvseDt) {
		this.btRvseDt = btRvseDt;
	}
	public String getBtRvseSeq() {
		return btRvseSeq;
	}
	public void setBtRvseSeq(String btRvseSeq) {
		this.btRvseSeq = btRvseSeq;
	}
	public String getBtName() {
		return btName;
	}
	public void setBtName(String btName) {
		this.btName = btName;
	}
	public String getBtTitle() {
		return btTitle;
	}
	public void setBtTitle(String btTitle) {
		this.btTitle = btTitle;
	}
	public String getBtCont() {
		return btCont;
	}
	public void setBtCont(String btCont) {
		this.btCont = btCont;
	}
	public String getBtAtchFileSeq() {
		return btAtchFileSeq;
	}
	public void setBtAtchFileSeq(String btAtchFileSeq) {
		this.btAtchFileSeq = btAtchFileSeq;
	}

	
	
	
}