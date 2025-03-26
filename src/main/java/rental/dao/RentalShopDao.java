package rental.dao;

import rental.dto.RentalShopDTO;
import util.SqlSessionFactoryService;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class RentalShopDao {
    SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
    private final String NAMESPACE = "rental.mapper.RentalShopMapper";

    public RentalShopDTO getRentalShop(int id) {
        try(SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectOne(NAMESPACE + ".getInfo", id);
        }
    }


}
