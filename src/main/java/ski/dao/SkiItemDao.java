package ski.dao;

import ski.dto.SkiCategoryDTO;
import ski.dto.SkiItemDTO;
import util.SqlSessionFactoryService;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;
import java.util.Map;

public class SkiItemDao {
    SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
    private final String NAMESPACE = "ski.mapper.SkiItemMapper";

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

    public SkiCategoryDTO getSkiItemByItemId(int item_id) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectOne(NAMESPACE + ".getSkiItemByItemId", item_id);
        }
    }


}
