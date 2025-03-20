package rentalAdmin.dao;

import java.util.List;

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
	
	//하나의 렌탈샵에 있는 장비유형들 조회
	public List<RentItemDTO> getItemList(int rentalshopId){
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			return sqlSession.selectList(NAMESPACE+".getItemList",rentalshopId);
		}
	}
	
	//하나의 렌탈샵에 있는 장비유형들 모두 삭제
	public int itemDelete(int rentalshopId) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.delete(NAMESPACE+".riDelete",rentalshopId);
			sqlSession.commit();
			return n;
		}
	}
	
	
}
