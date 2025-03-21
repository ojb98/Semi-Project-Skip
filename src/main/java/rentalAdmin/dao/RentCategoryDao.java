package rentalAdmin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.service.SqlSessionFactoryService;
import rental.dto.ItemCategoryListDTO;
import rental.dto.RentCategoryDTO;

public class RentCategoryDao {
	SqlSessionFactory sqlSessionFactory= SqlSessionFactoryService.getSqlSessionFactory();
	private final String NAMESPACE="rental.mapper.RentCategoryAdminMapper";
	
	//싱글톤설정
	private static RentCategoryDao instance=new RentCategoryDao();
	private RentCategoryDao() {}
	public static synchronized RentCategoryDao getInstance() {
		return instance;
	}
	
	//카테고리 등록
	public int categoryInsert(RentCategoryDTO rcdto) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.insert(NAMESPACE+".rcInsert",rcdto);
			sqlSession.commit();
			return n;
		}
	}
	
	//카테고리 전체조회(여러건)
	public List<RentCategoryDTO> categoryList(){
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			return sqlSession.selectList(NAMESPACE+".rcList");
		}
	}
	
	//카테고리 + 장비유형 조인 정보가져오기
	public List<ItemCategoryListDTO> itemCategoryList(int rentalshopId){
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			return sqlSession.selectList(NAMESPACE+".itemCategoryList",rentalshopId);
		}
	}
	
	//카테고리 고유아이디로 카테고리 데이터 조회(1건)
	public RentCategoryDTO getCategoryId(int categoryId){
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			return sqlSession.selectOne(NAMESPACE+".getCategoryId",categoryId);
		}
	}	
	
	//카테고리 가격만 수정
	public int categoryMapUpdate(HashMap<String,Integer> map) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.update(NAMESPACE+".rcmUpdate",map);
			sqlSession.commit();
			return n;
		}
	}
	
	//카테고리 삭제
	public int categoryDelete(int categoryId) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.delete(NAMESPACE+".rcDelete",categoryId);
			sqlSession.commit();
			return n;
		}
	}
	
	
}
