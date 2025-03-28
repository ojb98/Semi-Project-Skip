package rental.dao;

import rental.dto.RentalShopReviewDTO;
import util.SqlSessionFactoryService;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RentalShopReviewDao {
    private SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
    private final String NAMESPACE = "rental.mapper.RentalShopReviewMapper";

//    public int getCount(int rentalShopId) {
//        try (SqlSession session = sqlSessionFactory.openSession()) {
//            return session.selectOne(NAMESPACE + ".countReviewsByRentalShopID", rentalShopId);
//        }
//    }

    public float getAverage(int rentalShopId) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectOne(NAMESPACE + ".selectAvgRatingByRentalShopID", rentalShopId);
        }
    }

    public List<RentalShopReviewDTO> getList(int rentalShopId) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectList(NAMESPACE + ".selectReviewByRentalShopID", rentalShopId);
        }
    }

    /* 리뷰 추가 */
	public int insert(RentalShopReviewDTO dto) {
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
	public List<RentalShopReviewDTO> reviewArray(int rentalshop_id, String sortType, int startRow, int endRow) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			
			Map<String, Object> params = new HashMap<>();
			params.put("rentalshop_id", rentalshop_id);
			params.put("sortType", sortType);
			params.put("startRow", startRow);
			params.put("endRow", endRow);
			
			List<RentalShopReviewDTO> rentalshopReviewList = sqlSession.selectList(NAMESPACE + ".reviewArray", params);
			return rentalshopReviewList;
		}finally {
			if (sqlSession!=null) sqlSession.close();
		}
	}
	
	/* 리뷰 리스트 (기본) */
	public List<RentalShopReviewDTO> reviewList(int rentalshop_id) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			List<RentalShopReviewDTO> rentalshopReviewList = sqlSession.selectList(NAMESPACE + ".reviewList", rentalshop_id);
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
	public List<RentalShopReviewDTO> pageList(int startRow, int endRow) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			
			Map<String, Integer> map = new HashMap<>();
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			
			List<RentalShopReviewDTO> rentalshopReviewList = sqlSession.selectList(NAMESPACE + ".pageList", map);
			return rentalshopReviewList;
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
	}
	
	
	/* 수정 클릭 시 리뷰 정보 불러오기 */
	public RentalShopReviewDTO updateSelect(int review_id) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			RentalShopReviewDTO rentalshopReviewList = sqlSession.selectOne(NAMESPACE + ".updateSelect", review_id);
			return rentalshopReviewList;			
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
	}
	
	/* 수정 */
	public int update(RentalShopReviewDTO rentalshopReviewDto) {
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
	
	/* 렌탈샵아이디 값 받아오기 */
	public RentalShopReviewDTO getRentalshopIdByReview(int uuid) {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSession.selectOne(NAMESPACE + ".getRentalshopIdByReview", uuid);
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
	}
	
}
