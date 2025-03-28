package users.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import users.dto.UserLogCountDto;
import util.SqlSessionFactoryService;

public class UserLogDao {
	private static UserLogDao instance = new UserLogDao();
	private SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
	private final String NAMESPACE = "users.mapper.UsersMapper";
	
	private UserLogDao() {
		
	}
	
	public static UserLogDao getInstance() {
		return instance;
	}
	
	public int insertLog(String ip) {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			int n = sqlSession.insert(NAMESPACE + ".insertLog", ip);
			sqlSession.commit();
			return n;
		}
	}
	
	public int selectLogCount() {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			return sqlSession.selectOne(NAMESPACE + ".selectLogCount");
		}
	}
	
	public int selectUniqueLogCount() {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			return sqlSession.selectOne(NAMESPACE + ".selectUniqueLogCount");
		}
	}
	
	public List<UserLogCountDto> selectMonthlyLogCounts() {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			return sqlSession.selectList(NAMESPACE + ".selectMonthlyLogCounts");
		} 
	}
}
