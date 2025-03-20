package dao;

import dto.RentalShopDTO;
import dto.SkiDTO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.system.SqlSessionFactorySystem;

public class SkiDao {
    SqlSessionFactory sqlSessionFactory = SqlSessionFactorySystem.getSqlSessionFactory();
    private final String NAMESPACE = "mybatis.mapper.SkiMapper";

    public SkiDTO getSki(int ski_id) {
        try(SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectOne(NAMESPACE + ".getInfo", ski_id);
        }
    }



}
