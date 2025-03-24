package rentalAdmin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.service.SqlSessionFactoryService;
import rental.dto.RentCategoryDTO;
import rental.dto.RentItemDTO;


public class RentItemDao {
	private SqlSessionFactory sqlSessionFactory= SqlSessionFactoryService.getSqlSessionFactory();
	private final String NAMESPACE="rental.mapper.RentItemAdminMapper";
	
	//싱글톤설정
	private static RentItemDao instance=new RentItemDao();
	private RentItemDao() {}
	public static synchronized RentItemDao getInstance() {
		return instance;
	}
	
	//렌탈샵 장비유형 등록
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
	public int itemListDelete(int rentalshopId) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.delete(NAMESPACE+".riListDelete",rentalshopId);
			sqlSession.commit();
			return n;
		}
	}
	
	//장비고유아이디로 장비유형 삭제(1건)
	public int itemDelete(int itemId) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.delete(NAMESPACE+".riDelete",itemId);
			sqlSession.commit();
			return n;
		}
	}
	
	//장비고유아이디로 장비유형 데이터 조회(1건)
	public RentItemDTO getItemId(int itemId){
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			return sqlSession.selectOne(NAMESPACE+".getItemId",itemId);
		}
	}
	
	//렌탈샵 장비유형 수정
	public int itemUpdate(RentItemDTO ridto) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.update(NAMESPACE+".riUpdate",ridto);
			sqlSession.commit();
			return n;
		}
	}
	
	//카테고리 고유아이디로 장비유형 전체조회(여러건) : 렌탈샵에서 사용중인 카테고리 조회
	public List<RentItemDTO> itemCategoryids(int categoryId){
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			return sqlSession.selectList(NAMESPACE+".riCategoryId",categoryId);
		}
	}
	

	
}
