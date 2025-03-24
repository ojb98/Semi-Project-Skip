package review.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import review.dto.ReviewsDto;
import util.SqlSessionFactoryService;

public class ReviewsDao {
	private static ReviewsDao instance = new ReviewsDao();
	private final String NAMESPACE = "review.mapper.ReviewsMapper";
	private SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
	
	private ReviewsDao() {
		
	}

	public static ReviewsDao getInstance() {
		return instance;
	}
	
	public int getCount(HashMap<String, Object> map) {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			return sqlSession.selectOne(NAMESPACE + ".getCount", map);
		}
	}
	
	public List<ReviewsDto> list(HashMap<String, Object> map) {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			return sqlSession.selectList(NAMESPACE + ".list", map);
		}
	}
}
