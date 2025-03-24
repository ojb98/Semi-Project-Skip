package skiAdmin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.service.SqlSessionFactoryService;
import rentalAdmin.dao.RentItemDao;
import ski.dto.SkiDTO;

public class SkiDao {
	private SqlSessionFactory sqlSessionFactory= SqlSessionFactoryService.getSqlSessionFactory();
	private final String NAMESPACE="ski.mapper.SkiAdminMapper";
	
	//싱글톤설정
	private static SkiDao instance=new SkiDao();
	private SkiDao() {}
	public static synchronized SkiDao getInstance() {
		return instance;
	}
	
	//스키장 등록
	public int skiInsert(SkiDTO skdto) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.insert(NAMESPACE+".skInsert", skdto);
			sqlSession.commit();
			return n;
		}
	}
	
	//스키장 리스트 조회(여러건)
	public List<SkiDTO> skiList(){
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			return sqlSession.selectList(NAMESPACE+".skList");
		}
	}
	
	//스키장 고유아이디로 조회(1건): 스키장 상세정보 
	public SkiDTO getSkiId(int skiId) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			return sqlSession.selectOne(NAMESPACE+".getSkiId", skiId);
		}
	}
	
	//스키장 삭제
	public int skiDelete(int skiId) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.delete(NAMESPACE+".skDelete", skiId);
			sqlSession.commit();
			return n;
		}
	}
	
	//스키장 수정
	public int skiUpdate(SkiDTO skdto) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.insert(NAMESPACE+".skUpdate", skdto);
			sqlSession.commit();
			return n;
		}
	}
	
	
}
