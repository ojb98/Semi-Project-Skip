package rental.controller;

import rental.dao.RentItemDao;
import rental.dao.RentalShopDao;
import rental.dao.RentalShopReviewDao;
import rental.dao.WishDao;
import rental.dto.RentCategoryDTO;
import resort.dao.ResortDao;
import resort.dao.ResortReviewDao;
import resort.dao.RoomDao;
import resort.dto.RoomDTO;
import ski.dao.SkiItemDao;
import ski.dao.SkiReviewDao;
import ski.dto.SkiCategoryDTO;
import util.ItemTypeMapUtil;
import rental.dto.WishDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/cartSelect")
public class CartSelectController extends HttpServlet {
	private final String ski = "SKI";
	private final String rental = "RENTAL";
	private final String resort = "RESORT";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int uuid = Integer.parseInt(req.getParameter("uuid"));

		SkiItemDao skiItemDao = new SkiItemDao();
		RentItemDao rentItemDao = new RentItemDao();
		RoomDao roomDao = new RoomDao();
		RentalShopDao rentalShopDao = new RentalShopDao();

		ResortDao resortDao = new ResortDao();
		WishDao wishDao = new WishDao();
		List<WishDTO> wishList = wishDao.getWishList(uuid);
		List<Map<String, Object>> list = new ArrayList<>();

		wishList.forEach(wish -> {
			String category = wish.getCategory();
			int ref_id = wish.getRef_id();
			if (category.equalsIgnoreCase(ski))
				list.add(putInfo(req.getContextPath(), ref_id, skiItemDao.getSkiItemByItemId(ref_id)));
			if (category.equalsIgnoreCase(rental))
				list.add(putInfo(req.getContextPath(), ref_id, rentItemDao.getRentItemByItemId(ref_id)));
			if (category.equalsIgnoreCase(resort))
				list.add(putInfo(req.getContextPath(), ref_id, roomDao.getWishRoomByRoomId(ref_id)));
		});
		req.setAttribute("cartList", list);
		req.getRequestDispatcher("/rental/cart.jsp").forward(req, resp);
	}

	public <T> Map<String, Object> putInfo(String contextPath, int ref_Id, T dto) {
		Map<String, Object> map = new HashMap<>();

		if (dto instanceof SkiCategoryDTO varDTO) {
			SkiReviewDao skiReviewDao = new SkiReviewDao();
			map.put("link", "/rental/rentalItem?item_type=" + varDTO.getItem_type() + "&ski_id=" + varDTO.getSki_id()
					+ "&img_num=" + ItemTypeMapUtil.getImgNum(varDTO.getItem_type()) + "&isRentalOrSki=" + ski);
			map.put("mainImg", varDTO.getItem_img());
			map.put("category", "스키장");
			map.put("name", varDTO.getItem_name());
			map.put("quantity", varDTO.getTotal_quantity());
			map.put("rating", skiReviewDao.getAverage(varDTO.getSki_id()));
			map.put("price", varDTO.getPrice_per_hour());
			map.put("description", varDTO.getItem_detail());
			map.put("ref_id", ref_Id);
		}

		if (dto instanceof RentCategoryDTO varDTO) {
			RentalShopReviewDao rentalShopReviewDao = new RentalShopReviewDao();
			map.put("link",
					"/rental/rentalItem?item_type=" + varDTO.getItem_type() + "&rentalshop_id="
							+ varDTO.getRentalshop_id() + "&img_num=" + ItemTypeMapUtil.getImgNum(varDTO.getItem_type())
							+ "&isRentalOrSki=" + rental);
			map.put("mainImg", varDTO.getItem_img());
			map.put("category", "렌탈샵");
			map.put("name", varDTO.getItem_name());
			map.put("quantity", varDTO.getTotal_quantity());
			map.put("rating", rentalShopReviewDao.getAverage(varDTO.getRentalshop_id()));
			map.put("price", varDTO.getPrice_per_hour());
			map.put("description", varDTO.getItem_detail());
			map.put("ref_id", ref_Id);
		}

		if (dto instanceof RoomDTO varDTO) {
			ResortReviewDao resortReviewDao = new ResortReviewDao();
			map.put("link", "/rental/resort?resort_id=" + varDTO.getResort_id());
			map.put("mainImg", varDTO.getRmain_img());
			map.put("category", "리조트");
			map.put("name", varDTO.getRoom_name());
			map.put("quantity", varDTO.getRoom_quantity());
			map.put("rating", resortReviewDao.getAverage(varDTO.getResort_id()));
			map.put("price", varDTO.getPrice_per_night());
			map.put("description", varDTO.getDescription());
			map.put("ref_id", ref_Id);
		}

		return map;
	}

}
