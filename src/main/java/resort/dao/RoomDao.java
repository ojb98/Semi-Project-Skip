package resort.dao;

import resort.dto.RoomDTO;
import util.SqlSessionFactoryService;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class RoomDao {
    SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
    private final String NAMESPACE = "resort.mapper.RoomMapper";

    public int getMinPrice(int resort_id) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectOne(NAMESPACE + ".selectMinPrice", resort_id);
        }
    }

    public RoomDTO getWishRoomByRoomId(int room_id) {
        try(SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectOne(NAMESPACE + ".getWishRoomByRoomId", room_id);
        }
    }

    public List<RoomDTO> getList(int resort_id) {
        try(SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectList(NAMESPACE + ".getList", resort_id);
        }
    }




}
