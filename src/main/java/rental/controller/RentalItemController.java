package rental.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import rental.dao.ItemCategoryDao;
import rental.dao.RentItemDao;
import rental.dao.RentalShopDao;
import rental.dto.ItemCategoryDTO;
import rental.dto.RentItemDTO;
import rental.dto.RentalShopDTO;
import ski.dao.SkiDao;
import ski.dao.SkiItemDao;
import ski.dto.SkiDTO;
import ski.dto.SkiItemDTO;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/rental/rentalItem")
public class RentalItemController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        final String ski = "SKI";
        final String rental = "RENTAL";
        try {
            String item_type = req.getParameter("item_type");
            String img_num_str = req.getParameter("img_num");
            String id_str = null;

            id_str = req.getParameter("isRentalOrSki").equalsIgnoreCase(rental) ? req.getParameter("rentalshop_id") : req.getParameter("ski_id");

            if (item_type == null || img_num_str == null || id_str == null) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "필수 파라미터가 누락되었습니다.");
                return;
            }

            int img_num = Integer.parseInt(img_num_str);
            int shop_id = Integer.parseInt(id_str);

            ItemCategoryDao itemCategoryDao = new ItemCategoryDao();
            ItemCategoryDTO itemCategoryDTO = itemCategoryDao.getItemCategoryByItem_type(item_type);

            System.out.println("카테고리 조회 결과: " + (itemCategoryDTO != null ? "success" : "failed"));

            Map<String, Object> params = new HashMap<>();
            if (itemCategoryDTO == null) {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "해당 대여점을 찾을 수 없습니다.");
                return;
            }
            params.put("category_id", itemCategoryDTO.getCategory_id());

            if (req.getParameter("isRentalOrSki").equalsIgnoreCase(rental)) {
                RentalShopDao rentalShopDao = new RentalShopDao();
                RentalShopDTO rentalShopDTO = rentalShopDao.getRentalShop(shop_id);
                if (rentalShopDTO == null) {
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND, "해당 대여점을 찾을 수 없습니다.");
                    return;
                }
                params.put("rental", rentalShopDTO.getRentalshop_id());

                RentItemDao rentItemDao = new RentItemDao();
                List<RentItemDTO> rentItemList = rentItemDao.getRentItemList(params);
                req.setAttribute("list", rentItemList);

            } else if (req.getParameter("isRentalOrSki").equalsIgnoreCase(ski)) {
                SkiDao skiDao = new SkiDao();
                SkiDTO skiDTO = skiDao.getSki(shop_id);
                if (skiDTO == null) {
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND, "해당 대여점을 찾을 수 없습니다.");
                    return;
                }
                params.put("ski", skiDTO.getSki_id());
                SkiItemDao skiItemDao = new SkiItemDao();
                List<SkiItemDTO> skiItemList = skiItemDao.getSkiItemList(params);
                req.setAttribute("list", skiItemList);

                for (SkiItemDTO skiItemDTO : skiItemList) {
                    System.out.println("rent_id:" + skiItemDTO.getItem_id());
                }
            }


            req.setAttribute("isRentalOrSki", req.getParameter("isRentalOrSki").toUpperCase());
            req.setAttribute("img_num", img_num);
            req.setAttribute("price_per_hour", itemCategoryDTO.getPrice_per_hour());
            req.getRequestDispatcher("/rental/itemDetail.jsp").forward(req, resp);
        } catch (NumberFormatException e) {
            System.out.println("숫자 변환 오류: " + e.getMessage());
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "잘못된 파라미터 형식입니다.");
        } catch (Exception e) {
            System.out.println("서버 오류: " + e.getMessage());
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "서버 오류가 발생했습니다.");
        }
    }
}
