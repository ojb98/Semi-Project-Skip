package dao;

import dto.RentalShopReviewDTO;

import dto.ResortReviewDTO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.system.SqlSessionFactorySystem;

import java.util.List;

public class RentalShopReviewDao {
    private SqlSessionFactory sqlSessionFactory = SqlSessionFactorySystem.getSqlSessionFactory();
    private final String NAMESPACE = "mybatis.mapper.RentalShopReviewMapper";

    public int getCount(int rentalShopId) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectOne(NAMESPACE + ".countReviewsByRentalShopID", rentalShopId);
        }
    }

    public float getAverage(int rentalShopId) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectOne(NAMESPACE + ".selectAvgRatingByRentalShopID", rentalShopId);
        }
    }

    public List<RentalShopReviewDTO> getList(int rentalShopId) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectList(NAMESPACE + ".selectReviewByRentalShopID", rentalShopId);
        }
    }


}
