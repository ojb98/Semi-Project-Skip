package qna.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import qna.dto.QnaDto;
import util.SqlSessionFactoryService;

public class QnaDao {
	private static QnaDao instance = new QnaDao();
	private SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
	private final String NAMESPACE = "qna.mapper.QnaMapper";
	
	private QnaDao() {
		
	}
	
	public static QnaDao getInstance() {
		return instance;
	}
	
	public int getCount(HashMap<String, Object> map) {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			return sqlSession.selectOne(NAMESPACE + ".getCount", map);
		}
	}
	
	public List<QnaDto> list(HashMap<String, Object> map) {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			return sqlSession.selectList(NAMESPACE + ".list", map);
		}
	}
}
