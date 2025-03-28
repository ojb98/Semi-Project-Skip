package ski.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.service.SqlSessionFactoryService;
import ski.dto.SkiAdminDTO;
import ski.dto.SkiReservDTO;
import skiAdmin.dao.SkiDao;

public class SkiReservDao {
	private SqlSessionFactory sqlSessionFactory= SqlSessionFactoryService.getSqlSessionFactory();
	private final String NAMESPACE="ski.mapper.SkiReservMapper";
	
	//싱글톤설정
	private static SkiReservDao instance=new SkiReservDao();
	private SkiReservDao() {}
	public static synchronized SkiReservDao getInstance() {
		return instance;
	}
	
	//스키장 예약 등록
	public int skiReservInsert(SkiReservDTO srdto) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.insert(NAMESPACE+".skiReservInsert", srdto);
			sqlSession.commit();
			return n;
		}
	}
	

}
