package controller;

import dao.WishDao;
import dto.WishDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/wish")
public class WishController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean isWish = Boolean.parseBoolean(req.getParameter("isWish"));
        String category = req.getParameter("isRentalOrSki");
        int uuid = Integer.parseInt(req.getParameter("uuid"));
        int ref_id = Integer.parseInt(req.getParameter("ref_id"));
        WishDao wishDao = new WishDao();
        System.out.println("isWish: " + isWish);
        System.out.println("uuid: " + uuid);
        System.out.println("isRentalOrSki: " + category);
        System.out.println("ref_id: " + ref_id);

        if (!isWish) {
            Map<String,Object> map = new HashMap<>();
            map.put("uuid",uuid);
            map.put("category",category);
            map.put("ref_id",ref_id);
            if(wishDao.deleteWish(map) != -1) {
                System.out.println("delete wish success");
            } else {
                System.out.println("delete wish fail");
            }
        } else {
            wishDao.insertWish(new WishDTO(0, uuid, category, ref_id));
        }


    }

}



