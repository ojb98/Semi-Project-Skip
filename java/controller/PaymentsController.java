package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/payments")
public class PaymentsController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String items = req.getParameter("items");
        String totalPrice = req.getParameter("totalPrice");
        String rentDate = req.getParameter("rentDate");
        String isRentalOrSki = req.getParameter("isRentalOrSki");

        req.setAttribute("items", items);
        req.setAttribute("totalPrice", totalPrice);
        req.setAttribute("rentDate", rentDate);
        req.setAttribute("isRentalOrSki", isRentalOrSki);
    }
}
