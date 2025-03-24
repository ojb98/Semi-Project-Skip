package rentalAdmin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.service.SqlSessionFactoryService;
import rental.dto.RentalShopDTO;


public class RentalShopDao {
	private SqlSessionFactory sqlSessionFactory= SqlSessionFactoryService.getSqlSessionFactory();
	private final String NAMESPACE="rental.mapper.RentalShopAdminMapper";
	
	//싱글톤설정
	private static RentalShopDao instance=new RentalShopDao();
	private RentalShopDao() {}
	public static synchronized RentalShopDao getInstance() {
		return instance;
	}
	
	//렌탈샵 등록
	public int rentalInsert(RentalShopDTO rsdto) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.insert(NAMESPACE+".rsInsert",rsdto);
			sqlSession.commit();
			return n;
		}
	}
	
	//렌탈샵 리스트 조회(여러건)
	public List<RentalShopDTO> rentalList(){
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			return sqlSession.selectList(NAMESPACE+".rsList");
		}
	}
	
	//렌탈샵 고유아이디로 데이터 조회(한건)
	public RentalShopDTO getRentalId(int rentalId) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			return sqlSession.selectOne(NAMESPACE+".getRentalId",rentalId);
		}
	}
	
	//렌탈샵 수정
	public int rentalUpdate(RentalShopDTO rsdto) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.update(NAMESPACE+".rsUpdate",rsdto);
			sqlSession.commit();
			return n;
		}
	}
	
	//렌탈샵 삭제
	public int rentalDelete(int rentalshopId) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.delete(NAMESPACE+".rsDelete",rentalshopId);
			sqlSession.commit();
			return n;
		}
	}
	
	
}
