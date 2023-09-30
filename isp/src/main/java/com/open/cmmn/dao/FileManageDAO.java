package com.open.cmmn.dao;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.open.cmmn.model.FileVO;

/**
 * <pre>
 * Class Name : FileManageDAO.java
 * Description: 파일정보 관리를 위한 데이터 처리 클래스.
 * Modification Information
 *
 *    수정일         수정자         수정내용
 *    -------        -------     -------------------
 *    2012.11.01.	 박현우		최초생성
 *
 * </pre>
 *
 * @author User
 * @since 2012.11.01.
 * @version 1.0
 * @see <pre>
 *
 * </pre>
 */
@Repository("FileManageDAO")
public class FileManageDAO {

/*@Repository("FileManageDAO")는 Spring Framework에서 사용되는 어노테이션입니다. 이 어노테이션은 해당 클래스를 Spring의 빈(Bean)으로 등록하는 역할을 합니다.
 *  클래스명 뒤에 어노테이션을 사용하면 Spring 컨테이너가 이 클래스를 인식하고 필요한 빈으로 관리합니다.
 *  Spring Framework에서 @Repository 어노테이션을 사용하면 다음과 같은 이점이 있습니다:

빈 등록: 해당 클래스가 Spring의 컨테이너에 빈으로 등록되므로, 다른 클래스에서 이 빈을 주입(Injection)받아 사용할 수 있습니다.

예외 전환: @Repository 어노테이션을 사용하면 해당 DAO 클래스에서 발생하는 데이터 액세스 관련 예외를 Spring의 일관된 예외 계층 구조로 변환해줍니다. 이렇게 하면 코드에서 데이터 액세스 예외를 처리하기가 더 쉬워집니다.

트랜잭션 관리: Spring은 @Repository 어노테이션이 붙은 클래스에서 트랜잭션을 관리해줍니다. 이를 통해 데이터베이스 작업 중에 예외가 발생하면 자동으로 롤백할 수 있습니다.
*/
	/**
	 * SqlSessionTemplate.
	 */
	@Resource(name = "sqlMapClientCommon")
	private SqlSessionTemplate template;
	/**
	 * Mapper Package.
	 */
	private static final String PACKAGE_NAME = "com.open.";

	/**
	 * <pre>
	 * Description : 여러 개의 파일에 대한 정보(속성 및 상세)를 등록한다.
	 * </pre>
	 *
	 * @param fileList 파일리스트
	 * @return 첨부파일ID
	 * @throws Exception Exception
	 */
	@SuppressWarnings("rawtypes")
	//이 어노테이션은 제네릭 타입 관련 경고를 숨기는 용도로 사용됩니다. 제네릭 타입을 사용하지 않고, 원시(raw) 타입을 사용하는 경우 컴파일러 경고가 발생할 수 있습니다. 이 어노테이션을 사용하여 해당 경고를 무시합니다.
	
	public final String insertFileInfs(final List fileList) throws Exception {
		FileVO vo = (FileVO) fileList.get(0);
		String atchFileId = vo.getAtchFileId();
		template.insert(PACKAGE_NAME + "FileManageDAO.insertFileMaster", vo);

		Iterator iter = fileList.iterator();
		while (iter.hasNext()) {
			vo = (FileVO) iter.next();
			template.insert(PACKAGE_NAME + "FileManageDAO.insertFileDetail", vo);
		}

		return atchFileId;
	}
//	이 코드는 파일 정보를 데이터베이스에 저장하는 데 사용될 수 있습니다.
	

	/**
	 * <pre>
	 * Description : 여러 개의 파일에 대한 정보(속성 및 상세)를 등록한다.
	 * </pre>
	 *
	 * @param fileList 파일리스트
	 * @return 첨부파일ID
	 * @throws Exception Exception
	 */
	@SuppressWarnings("rawtypes")
	public final String insertFileInfsWithSubject(final List fileList) throws Exception {
		FileVO vo = (FileVO) fileList.get(0);
		String atchFileId = vo.getAtchFileId();

		template.insert(PACKAGE_NAME + "FileManageDAO.insertFileMaster", vo);

		Iterator iter = fileList.iterator();
		while (iter.hasNext()) {
			vo = (FileVO) iter.next();

			template.insert(PACKAGE_NAME + "FileManageDAO.insertFileDetailWithSubject", vo);
		}

		return atchFileId;
	}

	/**
	 * <pre>
	 * Description : 하나의 파일에 대한 정보(속성 및 상세)를 등록한다.
	 * </pre>
	 *
	 * @param vo 파일VO
	 * @throws Exception Exception
	 */
	public final void insertFileInf(final FileVO vo) throws Exception {
		template.insert(PACKAGE_NAME + "FileManageDAO.insertFileMaster", vo);
		template.insert(PACKAGE_NAME + "FileManageDAO.insertFileDetail", vo);
	}

	/**
	 * <pre>
	 * Description : 하나의 파일에 대한 정보(속성 및 상세)를 등록한다.
	 * </pre>
	 *
	 * @param vo 파일VO
	 * @throws Exception Exception
	 */
	public final void insertFileInfWithSubject(final FileVO vo) throws Exception {
		template.insert(PACKAGE_NAME + "FileManageDAO.insertFileMaster", vo);
		template.insert(PACKAGE_NAME + "FileManageDAO.insertFileDetailWithSubject", vo);
	}

	/**
	 * <pre>
	 * Description : 여러 개의 파일에 대한 정보(속성 및 상세)를 수정한다.
	 * </pre>
	 *
	 * @param fileList 파일리스트
	 * @throws Exception Exception
	 */
	@SuppressWarnings("rawtypes")
	public final void updateFileInfs(final List fileList) throws Exception {
		FileVO vo;
		Iterator iter = fileList.iterator();
		int i = 0;
		while (iter.hasNext()) {
			vo = (FileVO) iter.next();

			if (i == 0) {
				template.update(PACKAGE_NAME + "FileManageDAO.updateCOMTNFILE", vo);
			}

			template.insert(PACKAGE_NAME + "FileManageDAO.insertFileDetail", vo);
			i++;
		}
	}

	/**
	 * <pre>
	 * Description : 여러 개의 파일에 대한 정보(속성 및 상세)를 수정한다.
	 * </pre>
	 *
	 * @param fileList 파일리스트
	 * @throws Exception Exception
	 */
	@SuppressWarnings("rawtypes")
	public final void updateFileInfsWithSubject(final List fileList) throws Exception {
		FileVO vo;
		Iterator iter = fileList.iterator();
		int i = 0;
		while (iter.hasNext()) {
			vo = (FileVO) iter.next();

			if (i == 0) {
				template.update(PACKAGE_NAME + "FileManageDAO.updateCOMTNFILE", vo);
			}

			template.insert(PACKAGE_NAME + "FileManageDAO.insertFileDetailWithSubject", vo);
			i++;
		}
	}

	/**
	 * <pre>
	 * Description : 여러 개의 파일에 대한 정보(속성 및 상세)를 수정한다.
	 * </pre>
	 *
	 * @param fileList 파일리스트
	 * @throws Exception Exception
	 */
	@SuppressWarnings("rawtypes")
	public final void mergeUpdateFileInfs(final List fileList) throws Exception {
		FileVO vo;
		Iterator iter = fileList.iterator();
		int i = 0;
		while (iter.hasNext()) {
			vo = (FileVO) iter.next();

			if (i == 0) {
				template.update(PACKAGE_NAME + "FileManageDAO.updateCOMTNFILE", vo);
				template.delete(PACKAGE_NAME + "FileManageDAO.deleteFileDetailAll", vo);
			}

			template.insert(PACKAGE_NAME + "FileManageDAO.insertFileDetail", vo);

			i++;
		}
	}

	/**
	 * <pre>
	 * Description : 여러 개의 파일을 삭제한다.
	 * </pre>
	 *
	 * @param fileList 파일리스트
	 * @throws Exception Exception
	 */
	@SuppressWarnings("rawtypes")
	public final void deleteFileInfs(final List fileList) throws Exception {
		Iterator iter = fileList.iterator();
		FileVO vo;
		while (iter.hasNext()) {
			vo = (FileVO) iter.next();

			template.delete(PACKAGE_NAME + "FileManageDAO.deleteFileDetail", vo);
		}
	}

	/**
	 * <pre>
	 * Description : 하나의 파일을 삭제한다.
	 * </pre>
	 *
	 * @param fvo 파일정보
	 * @throws Exception Exception
	 */
	public final void deleteFileInfDetail(final FileVO fvo) throws Exception {
		template.delete(PACKAGE_NAME + "FileManageDAO.deleteFileDetail", fvo);
	}

	/**
	 * <pre>
	 * Description : 하나의 파일을 삭제한다.
	 * </pre>
	 *
	 * @param fvo 파일정보
	 * @throws Exception Exception
	 */
	public final void deleteFileInf(final FileVO fvo) throws Exception {
		template.delete(PACKAGE_NAME + "FileManageDAO.deleteFile", fvo);
	}

	/**
	 * <pre>
	 * Description : 파일에 대한 목록을 조회한다.
	 * </pre>
	 *
	 * @param vo 파일정보
	 * @return 파일리스트
	 * @throws Exception Exception
	 */
	public final List<?> selectFileInfs(final FileVO vo) throws Exception {
		return template.selectList(PACKAGE_NAME + "FileManageDAO.selectFileList", vo);
	}
	
	public final List<?> selectFileInfsNew(final FileVO vo) throws Exception {
		return template.selectList(PACKAGE_NAME + "FileManageDAO.selectFileListNew", vo);
	}

	/**
	 * <pre>
	 * Description : 파일에 대한 목록을 조회한다.
	 * </pre>
	 *
	 * @param vo 파일정보
	 * @return 파일리스트
	 * @throws Exception Exception
	 */
	public final List<?> selectFileInfsWithSubject(final FileVO vo) throws Exception {
		return template.selectList(PACKAGE_NAME + "FileManageDAO.selectFileListWithSubject", vo);
	}

	/**
	 * <pre>
	 * Description : 파일 구분자에 대한 최대값을 구한다.
	 * </pre>
	 *
	 * @param fvo 파일정보
	 * @return 파일 SN 최대값 int
	 * @throws Exception Exception
	 */
	public final int getMaxFileSN(final FileVO fvo) throws Exception {
		return (Integer) template.selectOne(PACKAGE_NAME + "FileManageDAO.getMaxFileSN", fvo);
	}

	/**
	 * <pre>
	 * Description : 파일 구분자에 대한 최대값을 구한다.
	 * </pre>
	 *
	 * @param fvo 파일정보
	 * @return 파일 SN 최대값 String
	 * @throws Exception Exception
	 */
	public final String getFileMaxSn(final FileVO fvo) throws Exception {
		return (String) template.selectOne(PACKAGE_NAME + "FileManageDAO.getFileMaxSn", fvo);
	}

	/**
	 * <pre>
	 * Description : 파일에 대한 상세정보를 조회한다.
	 * </pre>
	 *
	 * @param fvo 파일정보
	 * @return 파일상세정보
	 * @throws Exception Exception
	 */
	public final FileVO selectFileInf(final FileVO fvo) throws Exception {
		return (FileVO) template.selectOne(PACKAGE_NAME + "FileManageDAO.selectFileInf", fvo);
	}
	
	public final FileVO selectFileDetailInf(final FileVO fvo) throws Exception {
		return (FileVO) template.selectOne(PACKAGE_NAME + "FileManageDAO.selectFileDetailInf", fvo);
	}

	/**
	 * <pre>
	 * Description : 전체 파일을 삭제한다.
	 * </pre>
	 *
	 * @param fvo 파일정보
	 * @throws Exception Exception
	 */
	public final void deleteAllFileInf(final FileVO fvo) throws Exception {
		template.update(PACKAGE_NAME + "FileManageDAO.deleteCOMTNFILE", fvo);
	}

	/**
	 * <pre>
	 * Description : 수정되는 파일 사용여부 Y로 업데이트.
	 * </pre>
	 *
	 * @param fvo 파일정보
	 * @throws Exception Exception
	 */
	public final void updateAllFileInf(final FileVO fvo) throws Exception {
		template.update(PACKAGE_NAME + "FileManageDAO.updateCOMTNFILE", fvo);
	}

	/**
	 * <pre>
	 * Description : 파일명 검색에 대한 목록을 조회한다.
	 * </pre>
	 *
	 * @param fvo 파일정보
	 * @return 파일리스트
	 * @throws Exception Exception
	 */
	public final List<?> selectFileListByFileNm(final FileVO fvo) throws Exception {
		return template.selectList(PACKAGE_NAME + "FileManageDAO.selectFileListByFileNm", fvo);
	}

	/**
	 * <pre>
	 * Description :  파일명 검색에 대한 목록 전체 건수를 조회한다.
	 * </pre>
	 *
	 * @param fvo 파일정보
	 * @return 파일건수
	 * @throws Exception Exception
	 */
	public final int selectFileListCntByFileNm(final FileVO fvo) throws Exception {
		return (Integer) template.selectOne(PACKAGE_NAME + "FileManageDAO.selectFileListCntByFileNm", fvo);
	}

	/**
	 * <pre>
	 * Description : 이미지 파일에 대한 목록을 조회한다.
	 * </pre>
	 *
	 * @param vo 이미지 파일정보
	 * @return 이미지 파일 리스트
	 * @throws Exception Exception
	 */
	public final List<?> selectImageFileList(final FileVO vo) throws Exception {
		return template.selectList(PACKAGE_NAME + "FileManageDAO.selectImageFileList", vo);
	}

	/**
	 * <pre>
	 * Description : 이미지 파일에 대한 목록을 조회한다.
	 * </pre>
	 *
	 * @param vo 이미지 파일정보
	 * @return 이미지 파일 리스트
	 * @throws Exception Exception
	 */
	public final List<?> selectImageFileListWithSubject(final FileVO vo) throws Exception {
		return template.selectList(PACKAGE_NAME + "FileManageDAO.selectImageFileListWithSubject", vo);
	}

	/**
	 * <pre>
	 * Description : 이미지 파일에 대한 목록 전체 건수를 조회한다.
	 * </pre>
	 *
	 * @param vo 이미지 파일정보
	 * @return 이미지 파일 갯수
	 * @throws Exception Exception
	 */
	public final int selectFileCnt(final FileVO vo) throws Exception {
		return (Integer) template.selectOne(PACKAGE_NAME + "FileManageDAO.selectFileCnt", vo);
	}
	
	  /**
     * 하나의 파일에 대한 정보(속성 및 상세)를 등록한다.
     * 
     * @param vo
     * @throws Exception
     */
    public void insertFileMaster(FileVO vo) throws Exception {
    	template.insert(PACKAGE_NAME + "FileManageDAO.insertFileMaster", vo);
    }
    
    /**
     * 하나의 임시파일을 삭제한다.
     * 
     * @param fvo
     * @throws Exception
     */
    public void deleteFileInfDetailImsi(FileVO fvo) throws Exception {
    	template.delete(PACKAGE_NAME + "FileManageDAO.deleteFileDetailImsi", fvo);
    }
    
    /**
     * 임시파일 Y로 업데이트
     * 
     * @param fvo
     * @throws Exception
     */
    public void updateFileImsi(FileVO fvo) throws Exception {
    	template.update(PACKAGE_NAME + "FileManageDAO.updateFileImsi", fvo);
    }
    
    /**
     * 임시파일 Y로 업데이트
     * 
     * @param fvo
     * @throws Exception
     */
    public void updateFileImsiDelYn(FileVO fvo) throws Exception {
    	template.update(PACKAGE_NAME + "FileManageDAO.updateFileImsiDelYn", fvo);
    }
    
    /**
     * 하나의 파일을 삭제한다.
     * 
     * @param fvo
     * @throws Exception
     */
    public void deleteFileDetailDel(FileVO fvo) throws Exception {
    	template.delete(PACKAGE_NAME + "FileManageDAO.deleteFileDetailDel", fvo);
    }
    
    public void deleteFileDel(FileVO fvo) throws Exception {
    	template.delete(PACKAGE_NAME + "FileManageDAO.deleteFile", fvo);
    	template.delete(PACKAGE_NAME + "FileManageDAO.deleteFileDetailAll", fvo);
    }
}
