package com.open.ma.tw.movies.service;

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
@Alias("moviesVO")
public class MoviesVO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;
/*	는 Java 직렬화(serialization)를 위한 필드입니다. 직렬화란 객체의 상태를 바이트 스트림으로 변환하여 저장하거나 네트워크를 통해 전송하고, 이후에 원래 객체로 복원하는 과정을 말합니다. 
	직렬화는 객체를 저장하고 다른 프로세스 또는 기기 간에 데이터를 공유할 때 유용합니다.
	
	serialVersionUID는 직렬화된 객체의 버전을 식별하기 위한 고유한 식별자입니다. 이 식별자는 객체 클래스의 버전이 변경되었을 때, 예를 들어 새로운 필드가 추가되거나 삭제되었을 때 중요합니다. 
	직렬화된 객체가 이전 버전과 호환되는지 여부를 결정하는 데 사용됩니다.
	serialVersionUID는 long 데이터 타입으로 선언되며, 클래스 내부에 private static final로 선언됩니다.
	직렬화된 객체가 읽힐 때 해당 객체의 serialVersionUID와 클래스의 현재 serialVersionUID를 비교하게 됩니다. 
	만약 두 값이 다르다면 직렬화된 데이터와 클래스 간의 버전 호환성 문제가 발생할 수 있습니다.
	따라서 serialVersionUID는 객체 직렬화와 버전 관리에 중요한 역할을 합니다. 이를 통해 객체의 직렬화 버전이 일치하는지 확인하고 호환성을 유지할 수 있게 됩니다.*/
	
	
	private String twSeq;			//시퀀스 넘버
	private String twRgstDt;		//등록일
	private String twRgstSeq;		//등록자
	private String twRvseDt;		// 수정일
	private String twRvseSeq;		// 수정자
	private String twAtchFileSeq;	// 파일첨부
	private String twTitle;			// 제목
	private String twETitle;		// 영제목
	private String twCode;			// 영화코드
	private String twMakeYear;		// 제작년도
	private String twNational;		// 국가
	private String twStaDate;		// 개봉
	private String twEndDate;;		// 마감
	private String twType;			// 유형
	private String twGenre;			// 장르
	private String twDirector;		// 감독
	private String twCompany;		// 회사
	private String twActor;			// 주연
	private String twTcom;			// 배급사
	private String twLati;			// 평점
	private String twCont;			// 컨텐츠내용
	private String twName;			// 
	
	public String getTwSeq() {
		return twSeq;
	}
	public void setTwSeq(String twSeq) {
		this.twSeq = twSeq;
	}
	public String getTwRgstDt() {
		return twRgstDt;
	}
	public void setTwRgstDt(String twRgstDt) {
		this.twRgstDt = twRgstDt;
	}
	public String getTwRgstSeq() {
		return twRgstSeq;
	}
	public void setTwRgstSeq(String twRgstSeq) {
		this.twRgstSeq = twRgstSeq;
	}
	public String getTwRvseSeq() {
		return twRvseSeq;
	}
	public void setTwRvseSeq(String twRvseSeq) {
		this.twRvseSeq = twRvseSeq;
	}
	public String getTwRvseDt() {
		return twRvseDt;
	}
	public void setTwRvseDt(String twRvseDt) {
		this.twRvseDt = twRvseDt;
	}
	public String getTwTitle() {
		return twTitle;
	}
	public void setTwTitle(String twTitle) {
		this.twTitle = twTitle;
	}
	public String getTwETitle() {
		return twETitle;
	}
	public void setTwETitle(String twETitle) {
		this.twETitle = twETitle;
	}
	public String getTwCode() {
		return twCode;
	}
	public void setTwCode(String twCode) {
		this.twCode = twCode;
	}
	public String getTwMakeYear() {
		return twMakeYear;
	}
	public void setTwMakeYear(String twMakeYear) {
		this.twMakeYear = twMakeYear;
	}
	public String getTwNational() {
		return twNational;
	}
	public void setTwNational(String twNational) {
		this.twNational = twNational;
	}
	public String getTwStaDate() {
		return twStaDate;
	}
	public void setTwStaDate(String twStaDate) {
		this.twStaDate = twStaDate;
	}
	public String getTwEndDate() {
		return twEndDate;
	}
	public void setTwEndDate(String twEndDate) {
		this.twEndDate = twEndDate;
	}
	public String getTwType() {
		return twType;
	}
	public void setTwType(String twType) {
		this.twType = twType;
	}
	public String getTwGenre() {
		return twGenre;
	}
	public void setTwGenre(String twGenre) {
		this.twGenre = twGenre;
	}
	public String getTwDirector() {
		return twDirector;
	}
	public void setTwDirector(String twDirector) {
		this.twDirector = twDirector;
	}
	public String getTwCompany() {
		return twCompany;
	}
	public void setTwCompany(String twCompany) {
		this.twCompany = twCompany;
	}
	public String getTwActor() {
		return twActor;
	}
	public void setTwActor(String twActor) {
		this.twActor = twActor;
	}
	public String getTwTcom() {
		return twTcom;
	}
	public void setTwTcom(String twTcom) {
		this.twTcom = twTcom;
	}
	public String getTwLati() {
		return twLati;
	}
	public void setTwLati(String twLati) {
		this.twLati = twLati;
	}
	public String getTwCont() {
		return twCont;
	}
	public void setTwCont(String twCont) {
		this.twCont = twCont;
	}
	public String getTwAtchFileSeq() {
		return twAtchFileSeq;
	}
	public void setTwAtchFileSeq(String twAtchFileSeq) {
		this.twAtchFileSeq = twAtchFileSeq;
	}
	public String getTwName() {
		return twName;
	}
	public void setTwName(String twName) {
		this.twName = twName;
	}
	
			
}