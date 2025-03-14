package ski.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import ski.dto.SkiReservationDto;
import ski.dto.SkiReservationListDto;
import util.SqlSessionFactoryService;

public class SkiReservationDao {
	// 싱글턴
	private static SkiReservationDao instance = new SkiReservationDao();
	private SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
	private final String NAMESPACE = "ski.mapper.SkiReservationMapper";
	
	private SkiReservationDao() {
		
	}
	
	public static SkiReservationDao getInstance() {
		return instance;
	}
	
	public List<SkiReservationListDto> selectByUuid(int uuid) {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			return sqlSession.selectList(NAMESPACE + ".selectByUuid", uuid);
		}
	}
}
