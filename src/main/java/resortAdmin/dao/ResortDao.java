

package resortAdmin.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.service.SqlSessionFactoryService;
import resort.dto.FacilityListDTO;
import resort.dto.ResortDTO;
import resort.dto.ResortListDTO;


public class ResortDao {
	private SqlSessionFactory sqlSessionFactory=SqlSessionFactoryService.getSqlSessionFactory();
	private final String NAMESPACE="resort.mapper.ResortAdminMapper";
	
	//싱글톤설정
	private static ResortDao instance=new ResortDao();
	private ResortDao() {}
	public static synchronized ResortDao getInstance() {
		return instance;
	}
	
	//시설유형+시설이름 -> 시설고유아이디,유형이름,시설이름 가져오기
	public List<FacilityListDTO> facilityList(){
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			return sqlSession.selectList(NAMESPACE+".fList");
		}               
	}
	
	//리조트 추가
	public int resortInsert(ResortDTO redto) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n = sqlSession.insert(NAMESPACE + ".reInsert", redto);
	        if (n > 0) {
	            int resortId=sqlSession.selectOne(NAMESPACE + ".getResortId");
	            redto.setResort_id(resortId);
	        }
	        sqlSession.commit();
	        return redto.getResort_id(); 
		}
	}
	
	
	//모든 리조트정보 가져오기 :user_id버전
	public List<ResortListDTO> resortList(int uuid){
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			return sqlSession.selectList(NAMESPACE+".reList",uuid);
		}
	}
	
	//리조트 고유아이디로 리조트 정보가져오기(한행) : user_id버전
	public ResortListDTO getResortByUserId(int resortId) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			return sqlSession.selectOne(NAMESPACE+".getResortByUserId", resortId);
		}
	}
	
	//리조트 고유아이디로 리조트 정보가져오기(한행) 
	public ResortDTO getInfo(int resortId) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			return sqlSession.selectOne(NAMESPACE+".getResortInfo", resortId);
		}
	}
	
	//시설유형 + 시설 + 리조트-시설 조인(리조트 상세정보에서 리조트에 해당되는 시설유형과 시설이름을 조회)
	public List<FacilityListDTO> getfaciltyInfo(int resortId){
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			return sqlSession.selectList(NAMESPACE+".facilityDetail",resortId);
		}               
	}
	
	//리조트 삭제
	public int resortDelete(int resortId) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.delete(NAMESPACE+".reDelete",resortId);
			sqlSession.commit();
			return n;
		}
	}
	
	//리조트 수정
	public int resortUpdate(ResortDTO redto) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.update(NAMESPACE+".reUpdate", redto);
			sqlSession.commit();
			return n;
		}
	}
	
	
}
