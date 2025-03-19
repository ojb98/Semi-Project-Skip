package rentalAdmin.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.service.SqlSessionFactoryService;
import rental.dto.RentItemDTO;


public class RentItemDao {
	SqlSessionFactory sqlSessionFactory= SqlSessionFactoryService.getSqlSessionFactory();
	private final String NAMESPACE="rental.mapper.RentItemAdminMapper";
	
	//싱글톤설정
	private static RentItemDao instance=new RentItemDao();
	private RentItemDao() {}
	public static synchronized RentItemDao getInstance() {
		return instance;
	}
	
	//장비유형 등록
	public int itemInsert(RentItemDTO ridto) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.insert(NAMESPACE+".riInsert",ridto);
			sqlSession.commit();
			return n;
		}
	}
}
