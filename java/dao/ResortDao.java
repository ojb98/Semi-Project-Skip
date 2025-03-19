package dao;

import dto.ResortDTO;
import dto.SkiDTO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.system.SqlSessionFactorySystem;

public class ResortDao {
    SqlSessionFactory sqlSessionFactory = SqlSessionFactorySystem.getSqlSessionFactory();
    private final String NAMESPACE = "mybatis.mapper.ResortMapper";

    public ResortDTO getResortById(int resort_id) {
        try(SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectOne(NAMESPACE + ".selectResortById", resort_id);
        }
    }


}
