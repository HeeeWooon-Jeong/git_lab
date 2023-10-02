package com.open.ma.me.member.service;

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
@Alias("memberVO")
public class MemberVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String meSeq;             // 시퀀스 넘버
	private String meRgstDt;          // 등록일
	private String meRgstSeq;         // 등록자
	private String meRvseSeq;         // 수정자
	private String meRvseDt;          // 수정일
	private String meCnum;            // 사번
	private String meMnam;            // 이름
	private String meCall;            // 연락처
	private String meBusu;       	  // 부서
	private String meLeve;        	  // 직급
	private String meStaDate;         // 입사일
	private String meEndDate;         // 퇴사일
	private String meVac;        	  // 휴가일
	private String meTotaL;           // 총근무일수
	private String meAdre;            // 주소
	private String meGood;            // 인사고과
	private String meYear;         	  // 근무연차
	private String meMail;            // 이메일
	private String meTid;             // 인트라아이디
	private String meCont;			  // 인적사항
	private String meGun;			  // 총기번호
	private String meDon;			  // 연봉

	public String getMeSeq() {
		return meSeq;
	}
	public void setMeSeq(String meSeq) {
		this.meSeq = meSeq;
	}
	public String getMeRgstDt() {
		return meRgstDt;
	}
	public void setMeRgstDt(String meRgstDt) {
		this.meRgstDt = meRgstDt;
	}
	public String getMeRgstSeq() {
		return meRgstSeq;
	}
	public void setMeRgstSeq(String meRgstSeq) {
		this.meRgstSeq = meRgstSeq;
	}
	public String getMeRvseSeq() {
		return meRvseSeq;
	}
	public void setMeRvseSeq(String meRvseSeq) {
		this.meRvseSeq = meRvseSeq;
	}
	public String getMeRvseDt() {
		return meRvseDt;
	}
	public void setMeRvseDt(String meRvseDt) {
		this.meRvseDt = meRvseDt;
	}
	public String getMeCnum() {
		return meCnum;
	}
	public void setMeCnum(String meCnum) {
		this.meCnum = meCnum;
	}
	public String getMeMnam() {
		return meMnam;
	}
	public void setMeMnam(String meMnam) {
		this.meMnam = meMnam;
	}
	public String getMeCall() {
		return meCall;
	}
	public void setMeCall(String meCall) {
		this.meCall = meCall;
	}
	public String getMeBusu() {
		return meBusu;
	}
	public void setMeBusu(String meBusu) {
		this.meBusu = meBusu;
	}
	public String getMeLeve() {
		return meLeve;
	}
	public void setMeLeve(String meLeve) {
		this.meLeve = meLeve;
	}
	public String getMeStaDate() {
		return meStaDate;
	}
	public void setMeStaDate(String meStaDate) {
		this.meStaDate = meStaDate;
	}
	public String getMeEndDate() {
		return meEndDate;
	}
	public void setMeEndDate(String meEndDate) {
		this.meEndDate = meEndDate;
	}
	public String getMeVac() {
		return meVac;
	}
	public void setMeVac(String meVac) {
		this.meVac = meVac;
	}
	public String getMeTotaL() {
		return meTotaL;
	}
	public void setMeTotaL(String meTotaL) {
		this.meTotaL = meTotaL;
	}
	public String getMeAdre() {
		return meAdre;
	}
	public void setMeAdre(String meAdre) {
		this.meAdre = meAdre;
	}
	public String getMeGood() {
		return meGood;
	}
	public void setMeGood(String meGood) {
		this.meGood = meGood;
	}
	public String getMeYear() {
		return meYear;
	}
	public void setMeYear(String meYear) {
		this.meYear = meYear;
	}
	public String getMeMail() {
		return meMail;
	}
	public void setMeMail(String meMail) {
		this.meMail = meMail;
	}
	public String getMeTid() {
		return meTid;
	}
	public void setMeTid(String meTid) {
		this.meTid = meTid;
	}
	public String getMeCont() {
		return meCont;
	}
	public void setMeCont(String meCont) {
		this.meCont = meCont;
	}
	public String getMeGun() {
		return meGun;
	}
	public void setMeGun(String meGun) {
		this.meGun = meGun;
	}
	public String getMeDon() {
		return meDon;
	}
	public void setMeDon(String meDon) {
		this.meDon = meDon;
	}


				
}