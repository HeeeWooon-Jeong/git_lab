package com.open.ma.ca.bone.service;

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
@Alias("boneVO")
public class BoneVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String boSeq;			// 시퀀스 넘버
	private String boRgstDt;		// 등록일
	private String boRgstSeq;		// 등록자
	private String boRvseDt;		// 수정일
	private String boRvseSeq;		// 수정자
	private String boName;			// 컨텐츠내용
	private String boTitle;			// 컨텐츠내용
	private String boCont;			// 컨텐츠내용
	private String boAtchFileSeq;	// 파일첨부
	public String getBoSeq() {
		return boSeq;
	}
	public void setBoSeq(String boSeq) {
		this.boSeq = boSeq;
	}
	public String getBoRgstDt() {
		return boRgstDt;
	}
	public void setBoRgstDt(String boRgstDt) {
		this.boRgstDt = boRgstDt;
	}
	public String getBoRgstSeq() {
		return boRgstSeq;
	}
	public void setBoRgstSeq(String boRgstSeq) {
		this.boRgstSeq = boRgstSeq;
	}
	public String getBoRvseDt() {
		return boRvseDt;
	}
	public void setBoRvseDt(String boRvseDt) {
		this.boRvseDt = boRvseDt;
	}
	public String getBoRvseSeq() {
		return boRvseSeq;
	}
	public void setBoRvseSeq(String boRvseSeq) {
		this.boRvseSeq = boRvseSeq;
	}
	public String getBoName() {
		return boName;
	}
	public void setBoName(String boName) {
		this.boName = boName;
	}
	public String getBoTitle() {
		return boTitle;
	}
	public void setBoTitle(String boTitle) {
		this.boTitle = boTitle;
	}
	public String getBoCont() {
		return boCont;
	}
	public void setBoCont(String boCont) {
		this.boCont = boCont;
	}
	public String getBoAtchFileSeq() {
		return boAtchFileSeq;
	}
	public void setBoAtchFileSeq(String boAtchFileSeq) {
		this.boAtchFileSeq = boAtchFileSeq;
	}
	
				
}