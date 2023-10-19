package com.open.ma.ca.care.service;

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
@Alias("careVO")
public class CareVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String caSeq;					// 시퀀스 넘버
	private String caRgstDt;				// 등록일
	private String caRgstSeq;				// 등록자
	private String caRvseDt;				// 수정일
	private String caRvseSeq;				// 수정자 아이디 시퀀스
	private String caName;					// 수정자 아이디
	private String caTitle;					// 컨텐츠 제목
	private String caCont;					// 컨텐츠내용
	private String caAtchFileSeq;			// 파일첨부

	
	/*	댓글 부분 */
	private String caDatSeq;				// 댓글 시퀀스
	private String caDatRgstDt;				// 댓글 등록일
	private String caDatRgstSeq;			// 댓글 등록자
	private String caDatRvseDt;				// 댓글 수정일
	private String caDatRvseSeq;			// 댓글 수정자
	private String caDatCont;				// 댓글 내용
	private String caDatAtchFileSeq;		// 댓글 첨부파일
	private String caDatName;				// 컨텐츠내용

	
	
	
	
	
	public String getCaDatName() {
		return caDatName;
	}
	public void setCaDatName(String caDatName) {
		this.caDatName = caDatName;
	}
	public String getCaSeq() {
		return caSeq;
	}
	public void setCaSeq(String caSeq) {
		this.caSeq = caSeq;
	}
	public String getCaRgstDt() {
		return caRgstDt;
	}
	public void setCaRgstDt(String caRgstDt) {
		this.caRgstDt = caRgstDt;
	}
	public String getCaRgstSeq() {
		return caRgstSeq;
	}
	public void setCaRgstSeq(String caRgstSeq) {
		this.caRgstSeq = caRgstSeq;
	}
	public String getCaRvseDt() {
		return caRvseDt;
	}
	public void setCaRvseDt(String caRvseDt) {
		this.caRvseDt = caRvseDt;
	}
	public String getCaRvseSeq() {
		return caRvseSeq;
	}
	public void setCaRvseSeq(String caRvseSeq) {
		this.caRvseSeq = caRvseSeq;
	}
	public String getCaName() {
		return caName;
	}
	public void setCaName(String caName) {
		this.caName = caName;
	}
	public String getCaTitle() {
		return caTitle;
	}
	public void setCaTitle(String caTitle) {
		this.caTitle = caTitle;
	}
	public String getCaCont() {
		return caCont;
	}
	public void setCaCont(String caCont) {
		this.caCont = caCont;
	}
	public String getCaAtchFileSeq() {
		return caAtchFileSeq;
	}
	public void setCaAtchFileSeq(String caAtchFileSeq) {
		this.caAtchFileSeq = caAtchFileSeq;
	}
	public String getCaDatSeq() {
		return caDatSeq;
	}
	public void setCaDatSeq(String caDatSeq) {
		this.caDatSeq = caDatSeq;
	}
	public String getCaDatRgstDt() {
		return caDatRgstDt;
	}
	public void setCaDatRgstDt(String caDatRgstDt) {
		this.caDatRgstDt = caDatRgstDt;
	}
	public String getCaDatRgstSeq() {
		return caDatRgstSeq;
	}
	public void setCaDatRgstSeq(String caDatRgstSeq) {
		this.caDatRgstSeq = caDatRgstSeq;
	}
	public String getCaDatRvseDt() {
		return caDatRvseDt;
	}
	public void setCaDatRvseDt(String caDatRvseDt) {
		this.caDatRvseDt = caDatRvseDt;
	}
	public String getCaDatRvseSeq() {
		return caDatRvseSeq;
	}
	public void setCaDatRvseSeq(String caDatRvseSeq) {
		this.caDatRvseSeq = caDatRvseSeq;
	}
	public String getCaDatCont() {
		return caDatCont;
	}
	public void setCaDatCont(String caDatCont) {
		this.caDatCont = caDatCont;
	}
	public String getCaDatAtchFileSeq() {
		return caDatAtchFileSeq;
	}
	public void setCaDatAtchFileSeq(String caDatAtchFileSeq) {
		this.caDatAtchFileSeq = caDatAtchFileSeq;
	}
	

	
	
			
}