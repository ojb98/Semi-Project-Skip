package rental.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import rental.dto.RentalReservationListDto;
import util.SqlSessionFactoryService;

public class RentalReservationDao {
	private static RentalReservationDao instance = new RentalReservationDao();
	private SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
	private final String NAMESPACE = "rental.mapper.RentalReservationMapper";
	
	private RentalReservationDao() {
		
	}
	
	public static RentalReservationDao getInstance() {
		return instance;
	}
	
	public int getCount(HashMap<String, Object> map) {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			return sqlSession.selectOne(NAMESPACE + ".getCount", map);
		}
	}
	
	public List<RentalReservationListDto> selectByUuid(HashMap<String, Object> map) {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			return sqlSession.selectList(NAMESPACE + ".selectByUuid", map);
		}
	}
}
