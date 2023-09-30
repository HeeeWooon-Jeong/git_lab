package com.open.cmmn.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

/**
 * <pre>
 * Class Name : CmmnDAO.java
 * Description: 공통 DAO.
 * Modification Information
 *
 *    수정일         수정자         수정내용
 *    -------        -------     -------------------
 *    2016. 11. 3.	 User		최초생성
 *
 * </pre>
 *
 * @author User
 * @since 2016. 11. 3.
 * @version 1.0
 * @see <pre>
 *
 * </pre>
 */
@Repository("cmmnDAO")
public class CmmnDAO {

	/**
	 * SqlSessionTemplate.
	 */
	@Resource(name = "sqlMapClientCommon")
	private SqlSessionTemplate template;
	//SqlSessionTemplate 타입의 private 인스턴스 변수입니다. 이 줄은 클래스 내부에 데이터 멤버를 정의하는데 사용됩니다.
	// SqlSessionTemplate: SqlSessionTemplate은 클래스의 데이터 타입 또는 클래스입니다. 이 변수는 SqlSessionTemplate 객체를 저장하고 참조할 수 있습니다.
	

	/**
	 * Mapper Package.
	 */
	private static final String PACKAGE_NAME = "com.open.";

	/**
	 * <pre>
	 * Description :  목록을 조회한다.
	 * </pre>
	 *
	 * @param paramVO 조회용 Object,
	 * @param queryId String QueryId
	 * @return List
	 * @exception Exception Exception
	 */
	public List<?> selectList(final Object paramVO, final String queryId) throws Exception {
		String mQueryId = "";
		if (queryId != null && (queryId.equals("") || queryId.indexOf(".") < 0)) {
			mQueryId = queryId + ".selectList";
		} else {
			mQueryId = queryId;
		}
		return template.selectList(PACKAGE_NAME + mQueryId, paramVO);
	}

	/**
	 * <pre>
	 * Description :  맵을 조회한다.
	 * </pre>
	 *
	 * @param paramVO 조회용 Object,
	 * @param queryId String QueryId
	 * @param mapKey return Map에서 키가 될 컬럼명
	 * @return Map
	 * @exception Exception Exception
	 */
	public Map<?, ?> selectMap(final Object paramVO, final String queryId, final String mapKey) throws Exception {
		String mQueryId = "";
		if (queryId != null && (queryId.equals("") || queryId.indexOf(".") < 0)) {
			mQueryId = queryId + ".selectMap";
		} else {
			mQueryId = queryId;
		}
		return template.selectMap(PACKAGE_NAME + mQueryId, paramVO, mapKey);
	}

	/**
	 * <pre>
	 * Description :  전체 레코드 카운터를 조회한다.
	 * </pre>
	 *
	 * @param paramVO 조회용 Object
	 * @param queryId String QueryId
	 * @return int
	 * @exception Exception Exception
	 */
	public int selectCount(final Object paramVO, final String queryId) throws Exception {
		String mQueryId = "";
		if (queryId != null && (queryId.equals("") || queryId.indexOf(".") < 0)) {
			mQueryId = queryId + ".selectCount";
		} else {
			mQueryId = queryId;
		}
		return (Integer) template.selectOne(PACKAGE_NAME + mQueryId, paramVO);
	}

	/**
	 * <pre>
	 * Description :  상세정보를 조회한다.
	 * </pre>
	 *
	 * @param paramVO 조회용 Object
	 * @param queryId String QueryId
	 * @return Object
	 * @exception Exception Exception
	 */
	public Object selectContents(final Object paramVO, final String queryId) throws Exception {
		String mQueryId = "";
		if (queryId != null && (queryId.equals("") || queryId.indexOf(".") < 0)) {
			mQueryId = queryId + ".selectContents";
		} else {
			mQueryId = queryId;
		}
		return template.selectOne(PACKAGE_NAME + mQueryId, paramVO);
	}

	/**
	 * <pre>
	 * Description :  정보를 입력한다.
	 * </pre>
	 *
	 * @param paramVO 조회용 Object
	 * @param queryId String QueryId
	 * @exception Exception Exception
	 */
	public void insertContents(final Object paramVO, final String queryId) throws Exception {
		String mQueryId = "";
		if (queryId != null && (queryId.equals("") || queryId.indexOf(".") < 0)) {
			mQueryId = queryId + ".insertContents";
		} else {
			mQueryId = queryId;
		}
		template.insert(PACKAGE_NAME + mQueryId, paramVO);
	}

	/**
	 * <pre>
	 * Description :  정보를 수정한다.
	 * </pre>
	 *
	 * @param paramVO 조회용 Object
	 * @param queryId String QueryId
	 * @exception Exception Exception
	 */
	public void updateContents(final Object paramVO, final String queryId) throws Exception {
		String mQueryId = "";
		if (queryId != null && (queryId.equals("") || queryId.indexOf(".") < 0)) {
			mQueryId = queryId + ".updateContents";
		} else {
			mQueryId = queryId;
		}

		template.update(PACKAGE_NAME + mQueryId, paramVO);
	}

	/**
	 * <pre>
	 * Description :  정보를 삭제한다.
	 * </pre>
	 *
	 * @param paramVO 조회용 Object
	 * @param queryId String QueryId
	 * @exception Exception Exception
	 */
	public void deleteContents(final Object paramVO, final String queryId) throws Exception {
		String mQueryId = "";
		if (queryId != null && (queryId.equals("") || queryId.indexOf(".") < 0)) {
			mQueryId = queryId + ".deleteContents";
		} else {
			mQueryId = queryId;
		}
		template.delete(PACKAGE_NAME + mQueryId, paramVO);
	}

	/**
	 * <pre>
	 * Description : 정보를 입력하고 입력한 키를 반환한다.
	 * </pre>
	 *
	 * @param paramVO 조회용 Object
	 * @param queryId String QueryId
	 * @return Object
	 * @throws Exception Exception
	 */
	public Object insertSelectKey(final Object paramVO, final String queryId) throws Exception {
		String mQueryId = "";
		if (queryId != null && (queryId.equals("") || queryId.indexOf(".") < 0)) {
			mQueryId = queryId + ".insertSelectKey";
		} else {
			mQueryId = queryId;
		}
		template.insert(PACKAGE_NAME + mQueryId, paramVO);
		return paramVO;
	}
	
	/**
	 * <pre>
	 * Description :  다중정보를 입력한다.
	 * </pre>
	 *
	 * @param paramVO 조회용 Object
	 * @param queryId String QueryId
	 * @return Object
	 * @throws Exception Exception
	 */
	public void insertAllContents(final List<?> paramList, final String queryId) throws Exception {
		String mQueryId = "";
		if (queryId != null && (queryId.equals("") || queryId.indexOf(".") < 0)) {
			mQueryId = queryId + ".insertAllContents";
		} else {
			mQueryId = queryId;
		}
		template.insert(PACKAGE_NAME + mQueryId, paramList);
	}
	

}
/*	이 코드는 Java로 작성된 데이터 액세스 객체(DAO) 클래스입니다. 이 클래스는 데이터베이스와 상호 작용하고 SQL 쿼리를 실행하는 데 사용됩니다. 아래는 코드의 주요 내용에 대한 한글 설명입니다:

1. `CmmnDAO` 클래스는 데이터베이스 액세스를 위한 DAO 클래스입니다. DAO 클래스는 데이터베이스와 상호 작용하기 위한 메서드를 제공합니다.

2. `@Repository("cmmnDAO")` 어노테이션은 Spring Framework에서 해당 클래스가 리포지토리 역할을 하며, 빈(bean)으로 등록되어 Spring 컨테이너에 의해 관리되는 것을 나타냅니다.

3. `SqlSessionTemplate` 객체(`template`)는 MyBatis와 함께 사용되며, 데이터베이스 액세스 작업을 수행하는 데 필요한 SQL 세션을 관리합니다.

4. `PACKAGE_NAME` 상수는 SQL 쿼리를 실행할 때 사용할 패키지 이름을 저장합니다.

5. 이 클래스에는 다양한 데이터베이스 액세스 작업을 수행하는 메서드가 있습니다. 각 메서드는 주어진 SQL 쿼리를 실행하고 그 결과를 반환합니다. 예를 들어, `selectList` 메서드는 목록을 검색하고 `insertContents` 메서드는 데이터를 삽입합니다.

6. 메서드 파라미터로는 데이터 객체(`paramVO`), 쿼리 아이디(`queryId`), 그리고 필요한 경우 `mapKey`와 같은 다양한 매개변수를 받습니다.

7. 각 메서드는 입력된 쿼리 아이디를 기반으로 SQL 쿼리를 실행하며, 필요한 경우 쿼리 아이디에 `.selectList`, `.insertContents` 등의 접미사를 추가하여 실제 실행할 쿼리를 생성합니다.

8. 예외(Exception) 처리를 통해 데이터베이스 액세스 중 발생할 수 있는 오류를 처리합니다.

이 클래스는 Spring Framework와 MyBatis를 사용하여 데이터베이스와 상호 작용하는 데 사용됩니다. 데이터베이스 조회, 삽입, 업데이트, 삭제 등의 작업을 효율적으로 처리하기 위한 메서드가 제공되며, 이를 통해 데이터 액세스 로직을 추상화하고 간편하게 작성할 수 있습니다.*/
