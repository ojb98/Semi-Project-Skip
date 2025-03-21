package rental.dao;

import rental.dto.ItemCategoryDTO;
import util.SqlSessionFactoryService;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class ItemCategoryDao {
    private final String NAMESPACE = "rental.mapper.ItemCategoryMapper";
    SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();

    public ItemCategoryDTO getItemCategoryByItem_type(String item_type) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectOne(NAMESPACE + ".selectItemCategoryById", item_type);
        }

    }

}
