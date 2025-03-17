package users.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import users.dto.UsersDto;
import util.SqlSessionFactoryService;

public class UsersDao {
	// 싱글턴 객체
	private static UsersDao instance = new UsersDao();
	private SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
	private final String NAMESPACE = "users.mapper.UsersMapper";
	
	private UsersDao() {
		
	}
	
	public static UsersDao getInstance() {
		return instance;
	}
	
	public boolean exists(String user_id) {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			if (sqlSession.selectOne(NAMESPACE + ".exists", user_id) == null) {
				return false;
			}
			return true;
		}
	}
	
	public UsersDto selectUser(String user_id, String password) {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			HashMap<String, String> map = new HashMap<>();
			map.put("user_id", user_id);
			map.put("password", password);
			return sqlSession.selectOne(NAMESPACE + ".selectUser", map);
		}
	}
	
	public List<UsersDto> selectUserByEmail(String email) {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			return sqlSession.selectList(NAMESPACE + ".selectUserByEmail", email);
		}
	}
	
	public UsersDto selectUserByEmailAndUser_id(String email, String user_id) {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			HashMap<String, String> map = new HashMap<>();
			map.put("email", email);
			map.put("user_id", user_id);
			return sqlSession.selectOne(NAMESPACE + ".selectUserByEmailAndUser_id", map);
		}
	}
	
	public int insert(UsersDto user) {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			int n = sqlSession.insert(NAMESPACE + ".insert", user);
			sqlSession.commit();
			return n;
		}
	}
	
	public int updatePassword(UsersDto user) {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			int n = sqlSession.update(NAMESPACE + ".updatePassword", user);
			sqlSession.commit();
			return n;
		}
	}
	
	public int deleteUser(int uuid) {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			int n = sqlSession.update(NAMESPACE + ".deleteUser", uuid);
			sqlSession.commit();
			return n;
		}
	}
}
