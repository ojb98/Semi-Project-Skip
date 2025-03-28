package rental.controller;

import rental.dao.CartItemDao;
import rental.dto.CartItemDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;

@WebServlet("/cart")
public class CartController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String itemsList = req.getParameter("items");
        String totalPrice = req.getParameter("totalPrice");
        String rentDate = req.getParameter("rentDate");
        String isRentalOrSki = req.getParameter("isRentalOrSki");
        int uuid = Integer.parseInt(req.getParameter("uuid"));
       
        System.out.println("controller-> cart(장바구니)post방식");
        System.out.println(itemsList);
        System.out.println(totalPrice);
        System.out.println(rentDate);
        System.out.println(isRentalOrSki);
        System.out.println(uuid);
        CartItemDao cartItemDao = new CartItemDao();

        if (itemsList != null) {
            JSONArray json = new JSONArray(itemsList);
            for (int i = 0; i < json.length(); i++) {
                JSONObject item = json.getJSONObject(i);

                int itemId = item.getInt("itemId");
                int quantity = item.getInt("quantity");
                int price = item.getInt("price");

                int n = cartItemDao.insertCartItem(new CartItemDTO(0, uuid, isRentalOrSki, itemId, quantity, price));
                System.out.println(n);
            }
        }
        
        resp.sendRedirect(req.getContextPath()+"/cartSelect?uuid=" + uuid);

    }
}
