package dao;

import org.apache.ibatis.session.SqlSession;

import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.system.SqlSessionFactorySystem;

import java.util.List;
import java.util.Map;

public class ResortFacilityMapDao {
    private final SqlSessionFactory sqlSessionFactory = SqlSessionFactorySystem.getSqlSessionFactory();
    private final String NAMESPACE = "mybatis.mapper.ResortFacilityMapper";

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
