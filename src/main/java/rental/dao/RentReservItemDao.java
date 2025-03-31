package rental.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.service.SqlSessionFactoryService;
import rental.dto.RentReservItemDTO;
import ski.dto.SkiReservItemDTO;

public class RentReservItemDao {
	private SqlSessionFactory sqlSessionFactory= SqlSessionFactoryService.getSqlSessionFactory();
	private final String NAMESPACE="rental.mapper.RentReservItemMapper";
	
	//싱글톤설정
	private static RentReservItemDao instance=new RentReservItemDao();
	private RentReservItemDao() {}
	public static synchronized RentReservItemDao getInstance() {
		return instance;
	}
	
	//스키장 항목 예약 등록
	public int rentReservItemInsert(RentReservItemDTO rridto) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.insert(NAMESPACE+".rentReservItemInsert", rridto);
			sqlSession.commit();
			return n;
		}
	}
	
}
