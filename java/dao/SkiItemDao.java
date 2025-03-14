package dao;

import dto.RentItemDTO;

import dto.SkiItemDTO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.system.SqlSessionFactorySystem;

import java.util.List;
import java.util.Map;

public class SkiItemDao {
    SqlSessionFactory sqlSessionFactory = SqlSessionFactorySystem.getSqlSessionFactory();
    private final String NAMESPACE = "mybatis.mapper.SkiItemMapper";

    public SkiItemDTO getSkiItem(Map<String, Object> map) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectOne(NAMESPACE + ".selectSkiItem", map );
        }
    }

    public List<SkiItemDTO> getSkiItemList(Map<String, Object> map) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectList(NAMESPACE + ".getList", map);
        }
    }


}
