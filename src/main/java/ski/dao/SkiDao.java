package ski.dao;

import ski.dto.SkiDTO;
import ski.dto.SkiUnionDto;
import util.SqlSessionFactoryService;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class SkiDao {
    SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
    private final String NAMESPACE = "ski.mapper.SkiMapper";

    public SkiDTO getSki(int ski_id) {
        try(SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectOne(NAMESPACE + ".getInfo", ski_id);
        }
    }
    
    public List<SkiUnionDto> getUnionListByName(String name) {
    	try(SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectList(NAMESPACE + ".getUnionListByName", name);
        }
    }
}
