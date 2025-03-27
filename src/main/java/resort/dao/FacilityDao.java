package resort.dao;

import resort.dto.FacilitiesDTO;
import util.SqlSessionFactoryService;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


public class FacilityDao {
    private final SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
    private final String NAMESPACE = "resort.mapper.FacilityMapper";

    public FacilitiesDTO getFacilityByFacility(int resort_id) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectOne(NAMESPACE + ".getFacilityByFacility", resort_id);
        }
    }


}
