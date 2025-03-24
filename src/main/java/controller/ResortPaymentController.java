package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet("/resort/payment")
public class ResortPaymentController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String roomId = req.getParameter("roomId");
        int price = Integer.parseInt(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        String startDate = req.getParameter("startDate");
        String endDate = req.getParameter("endDate");
//        int checkTime = Integer.parseInt(req.getParameter("checkTime"));
        String uuid = req.getParameter("uuid");

        System.out.println("roomId: " + roomId);
        System.out.println("price: " + price);
        System.out.println("quantity: " + quantity);
        System.out.println("startDate: " + startDate);
        System.out.println("endDate: " + endDate);
//        System.out.println("checkTime: " + checkTime);
        System.out.println("uuid: " + uuid);



    }

}
