package skiAdminPageController;

import mybatis.service.SqlSessionFactoryService;
import skiAdminPageMapper.SkiAdminMapper;

import org.apache.ibatis.session.SqlSession;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/skiAdmin/deleteReservation") 
public class skiReservationDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain; charset=UTF-8");
        PrintWriter out = resp.getWriter();

        try {
            int reserv_id = Integer.parseInt(req.getParameter("reserv_id")); 
            try (SqlSession sqlSession = SqlSessionFactoryService.getSqlSessionFactory().openSession()) {
                SkiAdminMapper mapper = sqlSession.getMapper(SkiAdminMapper.class);
                int deleteCount = mapper.deleteReservation(reserv_id);

                if (deleteCount > 0) {
                    sqlSession.commit();
                    out.print("success");
                } else {
                    out.print("failed");
                }
            }
        } catch (NumberFormatException e) {
            out.print("invalid_uuid");
        } catch (Exception e) {
            e.printStackTrace();
            out.print("error");
        }
    }
}