package dao;

import dto.ItemCategoryDTO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.system.SqlSessionFactorySystem;

public class ItemCategoryDao {
    private final String NAMESPACE = "mybatis.mapper.ItemCategoryMapper";
    SqlSessionFactory sqlSessionFactory = SqlSessionFactorySystem.getSqlSessionFactory();

    public ItemCategoryDTO getItemCategoryByItem_type(String item_type) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectOne(NAMESPACE + ".selectItemCategoryById", item_type);
        }

    }

}
