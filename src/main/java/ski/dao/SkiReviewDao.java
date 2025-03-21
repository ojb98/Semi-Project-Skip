package ski.dao;

import ski.dto.SkiReviewDTO;
import util.SqlSessionFactoryService;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class SkiReviewDao {
    private SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
    private final String NAMESPACE = "ski.mapper.SkiReviewMapper";

    public int getCount(int skiId) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectOne(NAMESPACE + ".countReviewsBySkiID", skiId);
        }
    }

    public float getAverage(int skiId) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectOne(NAMESPACE + ".selectAvgRatingBySkiId", skiId);
        }
    }

    public List<SkiReviewDTO> getList(int skiId) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectList(NAMESPACE + ".selectReviewBySkiId", skiId);
        }
    }


}
