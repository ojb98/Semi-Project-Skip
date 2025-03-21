package dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.RentalshopReviewDTO;
import mybatis.system.SqlSessionFactorySystem;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RentalshopReviewDao {
    private SqlSessionFactory sqlSessionFactory = SqlSessionFactorySystem.getSqlSessionFactory();
    private final String NAMESPACE = "mybatis.mapper.RentalshopReviewMapper";

    
    /* 리뷰 추가 */
	public int insert(RentalshopReviewDTO dto) {
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
	public List<RentalshopReviewDTO> reviewArray(int rentalshop_id, String sortType, int startRow, int endRow) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			
			Map<String, Object> params = new HashMap<>();
			params.put("rentalshop_id", rentalshop_id);
			params.put("sortType", sortType);
			params.put("startRow", startRow);
			params.put("endRow", endRow);
			
			List<RentalshopReviewDTO> rentalshopReviewList = sqlSession.selectList(NAMESPACE + ".reviewArray", params);
			return rentalshopReviewList;
		}finally {
			if (sqlSession!=null) sqlSession.close();
		}
	}
	
	/* 리뷰 리스트 (기본) */
	public List<RentalshopReviewDTO> reviewList(int rentalshop_id) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			List<RentalshopReviewDTO> rentalshopReviewList = sqlSession.selectList(NAMESPACE + ".reviewList", rentalshop_id);
			return rentalshopReviewList;	
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
	}
	
	/* 전체 리뷰의 갯수 반환 */
	public int getCount(int rentalshop_id) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			int n = sqlSession.selectOne(NAMESPACE + ".getCount", rentalshop_id); 
			return n;
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
	}
	
	/* 리뷰의 시작과 끝 starRow endRow  */
	public List<RentalshopReviewDTO> pageList(int startRow, int endRow) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			
			Map<String, Integer> map = new HashMap<>();
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			
			List<RentalshopReviewDTO> rentalshopReviewList = sqlSession.selectList(NAMESPACE + ".pageList", map);
			return rentalshopReviewList;
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
	}
	
	
	/* 수정 클릭 시 리뷰 정보 불러오기 */
	public RentalshopReviewDTO updateSelect(int review_id) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			RentalshopReviewDTO rentalshopReviewList = sqlSession.selectOne(NAMESPACE + ".updateSelect", review_id);
			return rentalshopReviewList;			
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
	}
	
	/* 수정 */
	public int update(RentalshopReviewDTO rentalshopReviewDto) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			int n = sqlSession.update(NAMESPACE + ".update", rentalshopReviewDto);
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
