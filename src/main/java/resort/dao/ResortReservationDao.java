package resort.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import resort.dto.ResortReservationListDto;
import util.SqlSessionFactoryService;

public class ResortReservationDao {
	private static ResortReservationDao instance = new ResortReservationDao();
	private SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
	private final static String NAMESPACE = "resort.mapper.ResortReservationMapper";
	
	private ResortReservationDao() {
		
	}
	
	public static ResortReservationDao getInstance() {
		return instance;
	}
	
	public int getCount(HashMap<String, Object> map) {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			return sqlSession.selectOne(NAMESPACE + ".getCount", map);
		}
	}
	
	public List<ResortReservationListDto> selectByUuid(HashMap<String, Object> map) {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			return sqlSession.selectList(NAMESPACE + ".selectByUuid", map);
		}
	}
}
