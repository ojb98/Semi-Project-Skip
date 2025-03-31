package ski.dao;

import ski.dto.SkiReviewDTO;
import util.SqlSessionFactoryService;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SkiReviewDao {
    private SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
    private final String NAMESPACE = "ski.mapper.SkiReviewMapper";

//    public int getCount(int skiId) {
//        try (SqlSession session = sqlSessionFactory.openSession()) {
//            return session.selectOne(NAMESPACE + ".countReviewsBySkiID", skiId);
//        }
//    }

    public float getAverage(int skiId) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectOne(NAMESPACE + ".selectAvgRatingBySkiId", skiId);
        }
    }

    public List<SkiReviewDTO> getList(int skiId) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectList(NAMESPACE + ".selectReviewBySkiId", skiId);
        }
    }

    /* 리뷰 추가 */
   	public int insert(SkiReviewDTO dto) {
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
   	public List<SkiReviewDTO> reviewArray(int ski_id, String sortType, int startRow, int endRow) {
   		SqlSession sqlSession = null;
   		
   		try {
   			sqlSession = sqlSessionFactory.openSession();
   			
   			Map<String, Object> params = new HashMap<>();
   			params.put("ski_id", ski_id);
   			params.put("sortType", sortType);
   			params.put("startRow", startRow);
   			params.put("endRow", endRow);
   			
   			List<SkiReviewDTO> skiReviewList = sqlSession.selectList(NAMESPACE + ".reviewArray", params);
   			return skiReviewList;
   		}finally {
   			if (sqlSession!=null) sqlSession.close();
   		}
   	}
   	
   	/* 리뷰 리스트 (기본) */
   	public List<SkiReviewDTO> reviewList(int ski_id) {
   		SqlSession sqlSession = null;
   		
   		try {
   			sqlSession = sqlSessionFactory.openSession();
   			List<SkiReviewDTO> skiReviewList = sqlSession.selectList(NAMESPACE + ".reviewList", ski_id);
   			return skiReviewList;	
   		}finally {
   			if(sqlSession!=null) sqlSession.close();
   		}
   	}
   	
   	/* 전체 리뷰의 갯수 반환 */
   	public int getCount(int ski_id) {
   		SqlSession sqlSession = null;
   		
   		try {
   			sqlSession = sqlSessionFactory.openSession();
   			int n = sqlSession.selectOne(NAMESPACE + ".getCount", ski_id); 
   			return n;
   		}finally {
   			if(sqlSession!=null) sqlSession.close();
   		}
   	}
   	
   	/* 리뷰의 시작과 끝 starRow endRow  */
   	public List<SkiReviewDTO> pageList(int startRow, int endRow) {
   		SqlSession sqlSession = null;
   		
   		try {
   			sqlSession = sqlSessionFactory.openSession();
   			
   			Map<String, Integer> map = new HashMap<>();
   			map.put("startRow", startRow);
   			map.put("endRow", endRow);
   			
   			List<SkiReviewDTO> skiReviewList = sqlSession.selectList(NAMESPACE + ".pageList", map);
   			return skiReviewList;
   		}finally {
   			if(sqlSession!=null) sqlSession.close();
   		}
   	}
   	
   	
   	/* 수정 클릭 시 리뷰 정보 불러오기 */
   	public SkiReviewDTO updateSelect(int review_id) {
   		SqlSession sqlSession = null;
   		
   		try {
   			sqlSession = sqlSessionFactory.openSession();
   			SkiReviewDTO skiReviewList = sqlSession.selectOne(NAMESPACE + ".updateSelect", review_id);
   			return skiReviewList;			
   		}finally {
   			if(sqlSession!=null) sqlSession.close();
   		}
   	}
   	
   	/* 수정 */
   	public int update(SkiReviewDTO skiReviewDto) {
   		SqlSession sqlSession = null;
   		
   		try {
   			sqlSession = sqlSessionFactory.openSession();
   			int n = sqlSession.update(NAMESPACE + ".update", skiReviewDto);
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
   	
   	/* 스키아이디 값 받아오기 */
   	public SkiReviewDTO getSkiIdByReview(int uuid) {
   		SqlSession sqlSession = null;
   		
   		try {
   			sqlSession = sqlSessionFactory.openSession();
   			return sqlSession.selectOne(NAMESPACE + ".getSkiIdByReview", uuid);
   		}finally {
   			if(sqlSession!=null) sqlSession.close();
   		}
   	}
}
