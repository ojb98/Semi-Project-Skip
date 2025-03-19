package controller;

import dao.CartItemDao;
import dto.CartItemDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/resort/cart")
public class ResortCartController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int roomId = Integer.parseInt(req.getParameter("roomId"));
        int price = Integer.parseInt(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        String startDate = req.getParameter("startDate");
        String endDate = req.getParameter("endDate");
        int startTime = Integer.parseInt(req.getParameter("startTime"));
        int uuid = Integer.parseInt(req.getParameter("uuid"));

        System.out.println("roomId: " + roomId);
        System.out.println("price: " + price);
        System.out.println("quantity: " + quantity);
        System.out.println("startDate: " + startDate);
        System.out.println("endDate: " + endDate);
        System.out.println("startTime: " + startTime);
        System.out.println("uuid: " + uuid);

        CartItemDao cartItemDao = new CartItemDao();
        int n = cartItemDao.insertCartItem(new CartItemDTO(0, uuid, "RESORT" ,  roomId, quantity, price));

        if (n != -1) {
            System.out.println(n + "success khahahahaha");
        }

    }
}
