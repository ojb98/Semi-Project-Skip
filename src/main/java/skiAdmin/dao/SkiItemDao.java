package skiAdmin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.service.SqlSessionFactoryService;
import rental.dto.RentItemDTO;
import ski.dto.SkiItemDTO;

public class SkiItemDao {
	private SqlSessionFactory sqlSessionFactory=SqlSessionFactoryService.getSqlSessionFactory();
	private final String NAMESPACE="ski.mapper.SkiItemAdminMapper";
	
	//싱글톤설정
	private static SkiItemDao instance=new SkiItemDao();
	private SkiItemDao() {}
	public static synchronized SkiItemDao getInstance() {
		return instance;
	}
	
	//스키장 장비유형 등록
	public int skiItemInsert(SkiItemDTO sidto) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.insert(NAMESPACE+".siInsert", sidto);
			sqlSession.commit();
			return n;
		}
	}
	
	//하나의 스키장에 있는 장비유형들 조회
	public List<SkiItemDTO> getSkiItemList(int skiId){
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			return sqlSession.selectList(NAMESPACE+".getSkiItemList",skiId);
		}
	}
	
	//하나의 스키장에 있는 모든 장비유형들 삭제
	public int itemListDelete(int skiId) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.delete(NAMESPACE+".siListDelete",skiId);
			sqlSession.commit();
			return n;
		}
	}
	
	//장비고유아이디로 장비유형 데이터 조회(1건)
	public SkiItemDTO getItemId(int itemId){
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			return sqlSession.selectOne(NAMESPACE+".getSkiItemId",itemId);
		}
	}

	//장비고유아이디로 장비유형 삭제(1건)
	public int skiItemDelete(int itemId) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.delete(NAMESPACE+".siDelete",itemId);
			sqlSession.commit();
			return n;
		}
	}
	
	//스키장 장비유형 수정
	public int skiItemUpdate(SkiItemDTO sidto) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.update(NAMESPACE+".siUpdate",sidto);
			sqlSession.commit();
			return n;
		}
	}
	
}
