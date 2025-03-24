package resortAdmin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.service.SqlSessionFactoryService;
import resort.dto.RoomDTO;

public class RoomDao {
	private SqlSessionFactory sqlSessionFactory=SqlSessionFactoryService.getSqlSessionFactory();
	private final String NAMESPACE="resort.mapper.RoomAdminMapper";
	
	//싱글톤설정
	private static RoomDao instance=new RoomDao();
	private RoomDao() {}
	public static synchronized RoomDao getInstance() {
		return instance;
	}

	//객실 추가
	public int roomInsert(RoomDTO dto) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.insert(NAMESPACE+".roomInsert", dto);
			sqlSession.commit();
			return n;
		}
	}
	
	//리조트에 있는 모든 객실정보 얻어오기(여러개)
	public List<RoomDTO> getInfo(int resortId){
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			return sqlSession.selectList(NAMESPACE+".getRoomInfo", resortId);
		}
	}
	
	//객실고유아이디로 정보얻어오기(한행)
	public RoomDTO getRoomId(int roomId) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			return sqlSession.selectOne(NAMESPACE+".getRoomId",roomId);
		}
	}
	
	//객실 삭제
	public int roomDelete(int roomId) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.delete(NAMESPACE+".rmDelete", roomId);
			sqlSession.commit();
			return n;
		}
	}
	
	//객실 수정
	public int roomUpdate(RoomDTO dto) {
		try(SqlSession sqlSession=sqlSessionFactory.openSession()){
			int n=sqlSession.update(NAMESPACE+".rmUpdate",dto);
			sqlSession.commit();
			return n;
		}
	}
	
	
}