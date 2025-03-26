package transactions.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import transactions.dto.PieDto;
import util.SqlSessionFactoryService;

public class SalesDao {
	static private SalesDao instance = new SalesDao();
	private SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
	final private String NAMESPACE = "adminPageMapper.RootAdminMapper";
	
	private SalesDao() {
		
	}
	
	public static SalesDao getInstance() {
		return instance;
	}
	
	public HashMap<String, Object> getDailySales() {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			return sqlSession.selectOne(NAMESPACE + ".getDailySales");
		}
	}
	
	public HashMap<String, Integer> getWeeklySales() {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			return sqlSession.selectOne(NAMESPACE + ".getWeeklySales");
		}
	}
	
	public HashMap<String, Integer> getMonthlySales() {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			return sqlSession.selectOne(NAMESPACE + ".getMonthlySales");
		}
	}
	
	public HashMap<String, Integer> getYearlySales() {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			return sqlSession.selectOne(NAMESPACE + ".getYearlySales");
		}
	}
	
	public List<PieDto> getRecentPie() {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			return sqlSession.selectList(NAMESPACE + ".getRecentPie");
		}
	}
}
