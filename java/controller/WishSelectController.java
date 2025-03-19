package controller;

import dao.*;
import dto.RentCategoryDTO;
import dto.SkiItemDTO;
import dto.WishDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/wishSelect")
public class WishSelectController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        final String ski = "SKI";
        final String rental = "RENTAL";
        final String resort = "RESORT";
        int uuid = Integer.parseInt(req.getParameter("uuid"));
        final Map<String, Integer> itemTypeMap = new HashMap<>();
        mapSetting(itemTypeMap);

        SkiItemDao skiItemDao = new SkiItemDao();
        RentItemDao rentItemDao = new RentItemDao();
        RentalShopDao rentalShopDao = new RentalShopDao();

        ResortDao resortDao = new ResortDao();
        WishDao wishDao = new WishDao();
        List<WishDTO> wishList = wishDao.getWishList(uuid);
        Map<String, Object> wishMap = new HashMap<>();


        wishList.forEach(wish -> {
            //링크, 메인이미지, 카테고리, 이름, 평점, 가격 보내야댐
            //todo: rentalsshop,ski review테이블 만들고 rating 가져와서 넘겨야됨
            String category = wish.getCategory();
            if (category.equalsIgnoreCase(ski)) {
                int ref_id = wish.getRef_id();
                RentCategoryDTO rentCategoryDTO = rentItemDao.getRentItemByItemId(ref_id);
                wishMap.put("link", req.getContextPath() +
                        "/rental/rentalItem?item_type=" + rentCategoryDTO.getItem_type() + "&rentalshop_id=" + rentCategoryDTO.getRentalshop_id() +
                        "&img_num=" + getImgNum(itemTypeMap, rentCategoryDTO.getItem_type())+ "&isRentalOrSki=" + ski);
                wishMap.put("mainImg", rentCategoryDTO.getItem_img());
                wishMap.put("category", ski);
                wishMap.put("name", rentCategoryDTO.getItem_name());
                wishMap.put("rating", )
                wishMap.put("price", rentCategoryDTO.getPrice_per_hour());
            }
        });


        req.getRequestDispatcher("/rental/wish.jsp").forward(req, resp);

    }

    public void mapSetting(Map<String, Integer> map) {
        map.put("리프트권", 0);
        map.put("패키지", 1);
        map.put("스키", 2);
        map.put("보드", 3);
        map.put("보호구", 4);
        map.put("상의", 5);
        map.put("하의", 6);
        map.put("신발", 7);
    }

    public int getImgNum(Map<String, Integer> map, String itemType) {
        return map.getOrDefault(itemType, -1); // 없는 값이면 -1 리턴
    }

}
