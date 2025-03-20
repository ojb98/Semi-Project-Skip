package dao;

import dto.ResortReviewDTO;
import dto.SkiReviewDTO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.system.SqlSessionFactorySystem;

import java.util.List;

public class SkiReviewDao {
    private SqlSessionFactory sqlSessionFactory = SqlSessionFactorySystem.getSqlSessionFactory();
    private final String NAMESPACE = "mybatis.mapper.SkiReviewMapper";

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
