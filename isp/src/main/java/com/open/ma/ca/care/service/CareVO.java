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
	
	private String caSeq;			//시퀀스 넘버
	private String caRgstDt;		//등록일
	private String caRgstSeq;		//등록자
	private String caRvseSeq;		// 수정자
	private String caRvseDt;		// 수정일
	private String caErum;			// 이름
	private String caPhon;			// 연락처
	private String caVehi;			// 관리차량
	private String caNum;			// 차량번호
	private String caDel;			// 배송지
	private String caLocal;			// 방문지역
	private String caTf;			// 배송여부
	private String caEtc;			// 특이사항
	private String caStart;			// 출근시간
	private String caEnd;			// 퇴근시간
	private String caVac;			// 휴가일
	private String caCode;			// 사원코드
	private String caLev;			// 사원레벨
	private String caSco;			// 인사평점
	private String caName;			// 	
	private String caCont;			// 컨텐츠내용
	private String caAtchFileSeq;			// 파일첨부

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
	public String getCaRvseSeq() {
		return caRvseSeq;
	}
	public void setCaRvseSeq(String caRvseSeq) {
		this.caRvseSeq = caRvseSeq;
	}
	public String getCaRvseDt() {
		return caRvseDt;
	}
	public void setCaRvseDt(String caRvseDt) {
		this.caRvseDt = caRvseDt;
	}
	public String getCaErum() {
		return caErum;
	}
	public void setCaErum(String caErum) {
		this.caErum = caErum;
	}
	public String getCaPhon() {
		return caPhon;
	}
	public void setCaPhon(String caPhon) {
		this.caPhon = caPhon;
	}
	public String getCaVehi() {
		return caVehi;
	}
	public void setCaVehi(String caVehi) {
		this.caVehi = caVehi;
	}
	public String getCaNum() {
		return caNum;
	}
	public void setCaNum(String caNum) {
		this.caNum = caNum;
	}
	public String getCaDel() {
		return caDel;
	}
	public void setCaDel(String caDel) {
		this.caDel = caDel;
	}
	public String getCaLocal() {
		return caLocal;
	}
	public void setCaLocal(String caLocal) {
		this.caLocal = caLocal;
	}
	public String getCaTf() {
		return caTf;
	}
	public void setCaTf(String caTf) {
		this.caTf = caTf;
	}
	public String getCaEtc() {
		return caEtc;
	}
	public void setCaEtc(String caEtc) {
		this.caEtc = caEtc;
	}
	public String getCaStart() {
		return caStart;
	}
	public void setCaStart(String caStart) {
		this.caStart = caStart;
	}
	public String getCaEnd() {
		return caEnd;
	}
	public void setCaEnd(String caEnd) {
		this.caEnd = caEnd;
	}
	public String getCaVac() {
		return caVac;
	}
	public void setCaVac(String caVac) {
		this.caVac = caVac;
	}
	public String getCaCode() {
		return caCode;
	}
	public void setCaCode(String caCode) {
		this.caCode = caCode;
	}
	public String getCaLev() {
		return caLev;
	}
	public void setCaLev(String caLev) {
		this.caLev = caLev;
	}
	public String getCaSco() {
		return caSco;
	}
	public void setCaSco(String caSco) {
		this.caSco = caSco;
	}
	public String getCaName() {
		return caName;
	}
	public void setCaName(String caName) {
		this.caName = caName;
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
	
	
}