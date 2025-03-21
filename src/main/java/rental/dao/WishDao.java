package rental.dao;

import rental.dto.WishDTO;
import util.SqlSessionFactoryService;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;
import java.util.Map;

public class WishDao {
    private SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
    private final String NAMESPACE = "rental.mapper.WishMapper";

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
