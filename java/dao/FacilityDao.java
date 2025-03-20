package dao;

import dto.FacilityDTO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.system.SqlSessionFactorySystem;


public class FacilityDao {
    private final SqlSessionFactory sqlSessionFactory = SqlSessionFactorySystem.getSqlSessionFactory();
    private final String NAMESPACE = "mybatis.mapper.FacilityMapper";

    public FacilityDTO getFacilityByFacility(int facility_id) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectOne(NAMESPACE + ".getFacilityByFacility", facility_id);
        }
    }


}
