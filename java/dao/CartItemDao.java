package dao;

import dto.CartItemDTO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.system.SqlSessionFactorySystem;

public class CartItemDao {
    private SqlSessionFactory sqlSessionFactory = SqlSessionFactorySystem.getSqlSessionFactory();
    private final String NAMESPACE = "mybatis.mapper.CartItemMapper";

    public int insertCartItem(CartItemDTO cartItemDTO) {
        try (SqlSession session = sqlSessionFactory.openSession(true)) {
            return session.insert(NAMESPACE + ".insertCartItem", cartItemDTO);
        }
    }

}
