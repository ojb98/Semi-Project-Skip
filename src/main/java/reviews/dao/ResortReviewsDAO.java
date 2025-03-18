package reviews.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.service.SqlSessionFactoryService;
import reviews.dto.ResortReviewsDTO;

public class ResortReviewsDAO {
	private SqlSessionFactory sqlSessionFactory = null;
	private final String NAMESPACE = "mybatis.mapper.ResortReviewsMapper";
	
	public ResortReviewsDAO() {
		sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
	}
	
	/* 리뷰 추가 */
	public int insert(ResortReviewsDTO dto) {
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
	public List<ResortReviewsDTO> reviewList(String sortType, int startRow, int endRow) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			
			Map<String, Object> params = new HashMap<>();
			params.put("sortType", sortType);
			params.put("startRow", startRow);
			params.put("endRow", endRow);
			
			List<ResortReviewsDTO> rrList = sqlSession.selectList(NAMESPACE + ".reviewList", params);
			return rrList;
		}finally {
			if (sqlSession!=null) sqlSession.close();
		}
	}
	
	/* 리뷰 리스트 */
//	public List<ResortReviewsDTO> reviewList() {
//		SqlSession sqlSession = null;
//		
//		try {
//			sqlSession = sqlSessionFactory.openSession();
//			List<ResortReviewsDTO> rrList = sqlSession.selectList(NAMESPACE + ".reviewList");
//			return rrList;	
//		}finally {
//			if(sqlSession!=null) sqlSession.close();
//		}
//	}
	
	/* 리뷰 리스트 정렬 통합 */
	public List<ResortReviewsDTO> arrayReviews(String sortType) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			List<ResortReviewsDTO> rrList = sqlSession.selectList(NAMESPACE + ".arrayReviews", sortType);
			return rrList;
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
	}
	
	/* 리뷰 리스트 평점 높은 순 */
//	public List<ResortReviewsDTO> reviewDesc() {
//		SqlSession sqlSession = null;
//		
//		try {
//			sqlSession = sqlSessionFactory.openSession();
//			List<ResortReviewsDTO> rrList = sqlSession.selectList(NAMESPACE + ".reviewDesc");
//			return rrList;
//		}finally {
//			if(sqlSession!=null) sqlSession.close();
//		}
//	}
	
	/* 리뷰 리스트 평점 낮은 순 */
//	public List<ResortReviewsDTO> reviewAsc() {
//		SqlSession sqlSession = null;
//		
//		try {
//			sqlSession = sqlSessionFactory.openSession();
//			List<ResortReviewsDTO> rrList = sqlSession.selectList(NAMESPACE + ".reviewAsc");
//			return rrList;
//		}finally {
//			if(sqlSession!=null) sqlSession.close();
//		}
//	}
	
	/* 전체 리뷰의 갯수 반환 */
	public int getCount() {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			int n = sqlSession.selectOne(NAMESPACE + ".getCount"); 
			return n;
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
	}
	
	/* 리뷰의 시작과 끝 starRow endRow  */
	public List<ResortReviewsDTO> pageList(int startRow, int endRow) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			
			Map<String, Integer> map = new HashMap<>();
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			
			List<ResortReviewsDTO> rrList = sqlSession.selectList(NAMESPACE + ".pageList", map);
			return rrList;
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
	}
	
	
	/* 수정 클릭 시 글 정보 불러오기 */
	public ResortReviewsDTO updateSelect(int reviewId) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			ResortReviewsDTO rrList = sqlSession.selectOne(NAMESPACE + ".updateSelect", reviewId);
			return rrList;			
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
	}
	
	/* 수정 */
	public int update(ResortReviewsDTO rrDto) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			int n = sqlSession.update(NAMESPACE + ".update", rrDto);
			sqlSession.commit();
			return n;
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
	}
	
	/* 삭제 */
	public int delete(int reviewId) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			int n = sqlSession.delete(NAMESPACE + ".delete", reviewId);
			sqlSession.commit();
			return n;			
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
	}
}
