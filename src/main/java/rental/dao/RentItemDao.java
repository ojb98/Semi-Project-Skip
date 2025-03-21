package rental.dao;

import rental.dto.RentCategoryDTO;
import rental.dto.RentItemDTO;
import util.SqlSessionFactoryService;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;
import java.util.Map;

public class RentItemDao {
    SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
    private final String NAMESPACE = "rental.mapper.RentItemMapper";

    public RentItemDTO getRentItem(Map<String, Object> map) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectOne(NAMESPACE + ".selectRentItem", map );
        }
    }

    public List<RentItemDTO> getRentItemList(Map<String, Object> map) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectList(NAMESPACE + ".getList", map );
        }
    }

    public RentCategoryDTO getRentItemByItemId(int item_id) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectOne(NAMESPACE + ".getRentItemByItemId", item_id);
        }
    }


}
