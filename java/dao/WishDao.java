package dao;

import dto.WishDTO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.system.SqlSessionFactorySystem;

import java.util.List;
import java.util.Map;

public class WishDao {
    private SqlSessionFactory sqlSessionFactory = SqlSessionFactorySystem.getSqlSessionFactory();
    private final String NAMESPACE = "mybatis.mapper.WishMapper";

//    public List<WishDTO> getRefIdList(Map<String, Object> map) {
//        try (SqlSession session = sqlSessionFactory.openSession()) {
//            return session.selectList(NAMESPACE + ".getRefIdList", map);
//        }
//    }

    public int getCheckWish(Map<String, Object> map) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectOne(NAMESPACE + ".checkWish", map);
        }
    }

    public List<WishDTO> getWishList(int uuid) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectList(NAMESPACE + ".getWishList", uuid);
        }
    }

    public List<Integer> getWishRefIdList(int uuid) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectList(NAMESPACE + ".getWishRefIdList", uuid);
        }
    }

    public int insertWish(WishDTO wishDTO) {
        try (SqlSession session = sqlSessionFactory.openSession(true)) {
            return session.insert(NAMESPACE + ".insertWish", wishDTO);
        }
    }

    public int deleteWish(Map<String, Object> map) {
        try (SqlSession session = sqlSessionFactory.openSession(true)) {
            return session.delete(NAMESPACE + ".deleteWish", map);
        }
    }

}
