package resort.dao;

import resort.dto.ResortDTO;
import util.SqlSessionFactoryService;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class ResortDao {
    SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
    private final String NAMESPACE = "resort.mapper.ResortMapper";

    public ResortDTO getResortById(int resort_id) {
        try(SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectOne(NAMESPACE + ".selectResortById", resort_id);
        }
    }
}
