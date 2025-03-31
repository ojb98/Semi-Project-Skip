package rental.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.service.SqlSessionFactoryService;
import rental.dto.RentReservDTO;
import resort.dto.ResortDTO;
import ski.dto.SkiAdminDTO;
import ski.dto.SkiReservDTO;
import skiAdmin.dao.SkiDao;

public class RentReservDao {
	private SqlSessionFactory sqlSessionFactory= SqlSessionFactoryService.getSqlSessionFactory();
	private final String NAMESPACE="rental.mapper.RentReservMapper";
	
	//싱글톤설정
	private static RentReservDao instance=new RentReservDao();
	private RentReservDao() {}
	public static synchronized RentReservDao getInstance() {
		return instance;
	}
	
	//스키장 예약 등록
	public int rentReservInsert(RentReservDTO rrdto) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.insert(NAMESPACE+".rentReservInsert", rrdto);
			if (n > 0) {
				int reservId=sqlSession.selectOne(NAMESPACE + ".getRentReservId");
				rrdto.setRent_reserv_id(reservId);
			}
			sqlSession.commit();
			return rrdto.getRent_reserv_id();
		}
	}
	

}
