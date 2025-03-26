package rental.controller;

import mybatis.service.SqlSessionFactoryService;
import rental.mapper.RentalReservationMapper;

import org.apache.ibatis.session.SqlSession;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/rentalAdmin/updateReservation") 
public class RentalReservationUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain; charset=UTF-8");
        PrintWriter out = resp.getWriter();

        try {
            int reserv_id = Integer.parseInt(req.getParameter("reserv_id"));
            System.out.println(reserv_id);
            try (SqlSession sqlSession = SqlSessionFactoryService.getSqlSessionFactory().openSession()) {
                RentalReservationMapper mapper = sqlSession.getMapper(RentalReservationMapper.class);
                int updateCount = mapper.updateReservationStatusToCompleted(reserv_id);
                System.out.println(updateCount);
                if (updateCount > 0) {
                    sqlSession.commit();
                    out.print("success");
                } else {
                    out.print("failed");
                }
            }
        } catch (NumberFormatException e) {
            out.print("invalid_reserv_id");
        } catch (Exception e) {
            e.printStackTrace();
            out.print("error");
        }
    }
}