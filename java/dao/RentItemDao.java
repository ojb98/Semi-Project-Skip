package dao;

import dto.RentItemDTO;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.system.SqlSessionFactorySystem;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class RentItemDao {
    SqlSessionFactory sqlSessionFactory = SqlSessionFactorySystem.getSqlSessionFactory();
    private final String NAMESPACE = "mybatis.mapper.RentItemMapper";

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


}
