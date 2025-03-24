package rental.dao;

import rental.dto.CartItemDTO;
import util.SqlSessionFactoryService;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class CartItemDao {
	private SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
	private final String NAMESPACE = "rental.mapper.CartItemMapper";

	public int insertCartItem(CartItemDTO cartItemDTO) {
		try (SqlSession session = sqlSessionFactory.openSession(true)) {
			return session.insert(NAMESPACE + ".insertCartItem", cartItemDTO);
		}
	}

	public List<CartItemDTO> getCartList(int uuid) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList(NAMESPACE + ".selectCartItemByUUID", uuid); 
		}
	}

}
