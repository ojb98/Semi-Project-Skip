package controller;

import dao.RentalShopDao;
import dao.SkiDao;
import dto.RentalShopDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/rental/rentalShop")
public class RentalSelectController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RentalShopDao rentalShopDao = new RentalShopDao();
        SkiDao skiDao = new SkiDao();
        System.out.println(req.getParameter("isRentalOrSki"));
        String isRentalOrSki = req.getParameter("isRentalOrSki");
        if (isRentalOrSki != null && isRentalOrSki.equalsIgnoreCase("RENTAL")) {
            req.setAttribute("dto", rentalShopDao.getRentalShop(Integer.parseInt(req.getParameter("rentalshop_id"))));
        } else if (isRentalOrSki != null && isRentalOrSki.equalsIgnoreCase("SKI")) {
            req.setAttribute("dto", skiDao.getSki(Integer.parseInt(req.getParameter("ski_id"))));
        }
        req.setAttribute("isRentalOrSki", isRentalOrSki);
        req.getRequestDispatcher("/rental/rentalShop.jsp").forward(req, resp);
    }

}
