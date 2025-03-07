package users.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.service.SqlSessionFactoryService;
import users.dto.UsersDto;

public class UsersDao {
	// 싱글턴 객체
	private static UsersDao instance = new UsersDao();
	private SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
	private final String NAMESPACE = "mybatis.mapper.UsersMapper";
	
	private UsersDao() {
		
	}
	
	public static UsersDao getInstance() {
		return instance;
	}
	
	public UsersDto selectUser(String user_id, String password) {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			HashMap<String, String> map = new HashMap<>();
			map.put("user_id", user_id);
			map.put("password", password);
			return sqlSession.selectOne(NAMESPACE + ".selectUser", map);
		}
	}
	
	public int insert(UsersDto user) {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			int n = sqlSession.insert(NAMESPACE + ".insert", user);
			sqlSession.commit();
			return n;
		}
	}
}
