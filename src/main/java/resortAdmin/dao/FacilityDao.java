package resortAdmin.dao;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.service.SqlSessionFactoryService;
import resort.dto.FacilitiesDTO;
import resort.dto.FacilityListDTO;
import resort.dto.ResortFacilityMapDTO;

public class FacilityDao {
	SqlSessionFactory sqlSessionFactory= SqlSessionFactoryService.getSqlSessionFactory();
	private final String NAMESPACE="resort.mapper.FacilitiesAdminMapper";
	
	//싱글톤설정
	private static FacilityDao instance=new FacilityDao();
	private FacilityDao() {}
	public static synchronized FacilityDao getInstance() {
		return instance;
	}
	
	//시설유형명 가져오기
	public List<String> getTypes() {
        try(SqlSession sqlSession=sqlSessionFactory.openSession()) {
            return sqlSession.selectList(NAMESPACE+".getTypes");
           
        }
    }
	
	//시설이름 중복체크
    public boolean isFacilityNameExists(String facilityName) {
        try(SqlSession sqlSession=sqlSessionFactory.openSession()) {
            int count = sqlSession.selectOne(NAMESPACE+".isFacilityNameExists", facilityName);
            return count > 0;
        }
    }
	
	//시설추가
	public int insert(FacilitiesDTO dto) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.insert(NAMESPACE+".insert",dto);
			sqlSession.commit();
			return n;
		}
	}
	
	//시설유형(1):시설이름(N) 
	public List<FacilityListDTO> listAll(){
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			return sqlSession.selectList(NAMESPACE+".facilityList");
		}               
	}
	
	//시설삭제
	public int delete(int facilityId) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.delete(NAMESPACE+".delete",facilityId);
			sqlSession.commit();
			return n;
		}
	}
	
	//리조트-시설 추가
	public void mapInsert(List<ResortFacilityMapDTO> rfmdto) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			for(ResortFacilityMapDTO facility :rfmdto) {
				sqlSession.insert(NAMESPACE+".mapInsert",facility);				
			}			
			sqlSession.commit();
		}
	}
	
	//리조트-시설 : 해당 리조트에 해당되는 facility_id 조회
	public List<Integer> getFacilityId(int resortId) {
	    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
	        return sqlSession.selectList(NAMESPACE + ".getFacilityId", resortId);
	    }
	}
	
	
	//리조트-시설 삭제
	public int mapDelete(HashMap<String,Object> map) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.delete(NAMESPACE+".mapDelete", map);
			sqlSession.commit();
			return n;
		}
	}
	

	//리조트-시설(update작업)
	//type_id로 해당 시설유형이름 가져오기
	public String getFacilityType(int typeId) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			return sqlSession.selectOne(NAMESPACE+".getFacilityType", typeId);
		}
	}
	
	//해당 시설유형의 전체 시설이름들 조회
    public List<FacilitiesDTO> getFacilities(int typeId) {
        try(SqlSession sqlSession=sqlSessionFactory.openSession()){
        	return sqlSession.selectList(NAMESPACE+".getFacilities", typeId);
        }
    }
    
    //해당 리조트에 이미 매핑된 facility_id 조회(해당 시설유형 한정)
    public List<Integer> getFacilityIdsByType(HashMap<String, Object> map) {
        try(SqlSession sqlSession=sqlSessionFactory.openSession()){
            return sqlSession.selectList(NAMESPACE+".getFacilityIdsByType", map);
        }
    }
    
    //해당 리조트에서 해당 시설유형에 해당하는 기존 시설이름(매핑) 삭제 후, 새로운 시설이름(매핑) 삽입
    public void mapUpdate(int resortId, int typeId, List<Integer> newFacilityIds) {
        try(SqlSession sqlSession=sqlSessionFactory.openSession()){
        	//기존 매핑 삭제
            HashMap<String, Object> map = new HashMap<>();
            map.put("resortId", resortId);
            map.put("typeId", typeId);
            sqlSession.delete(NAMESPACE+".mapDelete", map);
            
            //새 매핑 삽입
            if (newFacilityIds != null) {
                for (Integer facilityId : newFacilityIds) {
                    ResortFacilityMapDTO dto=new ResortFacilityMapDTO(resortId, facilityId);
                    sqlSession.insert(NAMESPACE+".mapInsert", dto);
                }
            }
            sqlSession.commit();
        }
    }
	
	
}