package resort.dao;

import resort.dto.ResortReviewDTO;
import util.SqlSessionFactoryService;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class ResortReviewDao {
    private SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
    private final String NAMESPACE = "resort.mapper.ResortReviewMapper";

    public int getCount(int resortId) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectOne(NAMESPACE + ".countReviewsByResortId", resortId);
        }
    }

    public float getAverage(int resortId) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectOne(NAMESPACE + ".selectAvgRatingByResortId", resortId);
        }
    }

    public List<ResortReviewDTO> getList(int resortId) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectList(NAMESPACE + ".selectReviewByResortId", resortId);
        }
    }


}
