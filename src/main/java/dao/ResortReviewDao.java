package dao;

import dto.ResortReviewDTO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.system.SqlSessionFactorySystem;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ResortReviewDao {
    private SqlSessionFactory sqlSessionFactory = SqlSessionFactorySystem.getSqlSessionFactory();
    private final String NAMESPACE = "mybatis.mapper.ResortReviewMapper";

//    public int getCount(int resortId) {
//        try (SqlSession session = sqlSessionFactory.openSession()) {
//            return session.selectOne(NAMESPACE + ".countReviewsByResortId", resortId);
//        }
//    }

    public float getAverage(int roomId) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectOne(NAMESPACE + ".selectAvgRatingByResortId", roomId);
        }
    }

    public List<ResortReviewDTO> getList(int roomId) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectList(NAMESPACE + ".selectReviewByResortId", roomId);
        }
    }
    
    /* 리뷰 추가 */
	public int insert(ResortReviewDTO dto) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			int n = sqlSession.insert(NAMESPACE + ".insert", dto);
			sqlSession.commit();
			return n;			
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
	}
	
	/* 리뷰 리스트 (페이징, 정렬) */
	public List<ResortReviewDTO> reviewArray(int room_id, String sortType, int startRow, int endRow) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			
			Map<String, Object> params = new HashMap<>();
			params.put("room_id", room_id);
			params.put("sortType", sortType);
			params.put("startRow", startRow);
			params.put("endRow", endRow);
			
			List<ResortReviewDTO> resortReviewList = sqlSession.selectList(NAMESPACE + ".reviewArray", params);
			return resortReviewList;
		}finally {
			if (sqlSession!=null) sqlSession.close();
		}
	}
	
	/* 리뷰 리스트 (기본) */
	public List<ResortReviewDTO> reviewList(int room_id) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			List<ResortReviewDTO> resortReviewList = sqlSession.selectList(NAMESPACE + ".reviewList", room_id);
			return resortReviewList;	
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
	}
	
	/* 전체 리뷰의 갯수 반환 */
	public int getCount(int room_id) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			int n = sqlSession.selectOne(NAMESPACE + ".getCount", room_id); 
			return n;
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
	}
	
	/* 리뷰의 시작과 끝 starRow endRow  */
	public List<ResortReviewDTO> pageList(int startRow, int endRow) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			
			Map<String, Integer> map = new HashMap<>();
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			
			List<ResortReviewDTO> resortReviewList = sqlSession.selectList(NAMESPACE + ".pageList", map);
			return resortReviewList;
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
	}
	
	
	/* 수정 클릭 시 리뷰 정보 불러오기 */
	public ResortReviewDTO updateSelect(int review_id) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			ResortReviewDTO rrList = sqlSession.selectOne(NAMESPACE + ".updateSelect", review_id);
			return rrList;			
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
	}
	
	/* 수정 */
	public int update(ResortReviewDTO resortReviewDto) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			int n = sqlSession.update(NAMESPACE + ".update", resortReviewDto);
			sqlSession.commit();
			return n;
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
	}
	
	/* 삭제 */
	public int delete(int review_id) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			int n = sqlSession.delete(NAMESPACE + ".delete", review_id);
			sqlSession.commit();
			return n;			
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
	}

}
