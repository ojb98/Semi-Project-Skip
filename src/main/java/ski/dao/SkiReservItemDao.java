package ski.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.service.SqlSessionFactoryService;
import ski.dto.SkiReservItemDTO;

public class SkiReservItemDao {
	private SqlSessionFactory sqlSessionFactory= SqlSessionFactoryService.getSqlSessionFactory();
	private final String NAMESPACE="ski.mapper.SkiReservItemMapper";
	
	//싱글톤설정
	private static SkiReservItemDao instance=new SkiReservItemDao();
	private SkiReservItemDao() {}
	public static synchronized SkiReservItemDao getInstance() {
		return instance;
	}
	
	//스키장 항목 예약 등록
	public int skiReservItemInsert(SkiReservItemDTO sridto) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.insert(NAMESPACE+".skiReservInsert", sridto);
			sqlSession.commit();
			return n;
		}
	}
	
}
