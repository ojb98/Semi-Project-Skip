package resort.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import util.SqlSessionFactoryService;

import java.util.List;
import java.util.Map;

public class ResortFacilityMapDao {
    private final SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
    private final String NAMESPACE = "resort.mapper.ResortFacilityMapper";

    public List<Integer> getFacilitiesByResortId(int resortId) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectList(NAMESPACE + ".getFacilitiesByResortId", resortId);
        }
    }

    public String getFacilityNameByMap(Map<String, Integer> map) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectOne(NAMESPACE + ".getFacilityNameByResortId", map);
        }
    }

}
