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
	// 자바 클래스 내에서 선언된 상수형태의 문자열 변수를 정의한 코드입니다
	// 정적(static) 키워드로, 해당 변수가 클래스 수준에 속한다는 것을 의미합니다. 즉, 클래스 내부에서 공유되며 모든 인스턴스에서 동일한 값을 가지게 됩니다. 정적 변수는 클래스가 로드될 때 초기화되며, 프로그램이 실행 중일 때 유지
	// 상수(constant) 키워드로, 해당 변수가 한 번 초기화되면 값을 변경할 수 없음을 나타냅니다. 즉, PACKAGE_NAME 변수는 초기화된 문자열 값인 "com.open."을 변경할 수 없습니다.
	
	
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
		// 데이터베이스에서 데이터를 조회하고 그 결과를 리스트로 반환하는 메서드입니다.
		String mQueryId = "";
		// mQueryId라는 빈 문자열을 생성합니다. 이 변수는 SQL 쿼리 ID를 재구성하기 위해 사용됩니다.
		if (queryId != null && (queryId.equals("") || queryId.indexOf(".") < 0)) {
			//queryId가 null이 아니고, 빈 문자열이거나 점(.)을 포함하지 않는 경우를 체크합니다.
			mQueryId = queryId + ".selectList";
//			SQL 쿼리 ID가 유효한 형태가 아니면, queryId에 ".selectList"를 추가하여 적절한 형태로 만듭니다.
		} else {
			mQueryId = queryId;
		}
		return template.selectList(PACKAGE_NAME + mQueryId, paramVO);
//		SQL 쿼리 ID가 유효한 형태가 아니면, queryId에 ".selectList"를 추가하여 적절한 형태로 만듭니다.
//		PACKAGE_NAME은 클래스에서 정의된 상수 문자열이고, mQueryId는 위에서 재구성한 SQL 쿼리 ID입니다.
//		조회된 데이터는 List<?> 형태로 반환됩니다.
	}
	// 이 코드는 MyBatis를 사용하여 데이터베이스에서 데이터를 조회하는 메서드의 예시

	

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
	// 
	//Map<?, ?>은 Java에서 제네릭을 사용한 데이터 구조로서, 키(key)와 값(value)의 쌍을 저장하는 컬렉션입니다. Map은 특정 키에 대응하는 값을 검색하거나 저장하기 위해 사용
	

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
