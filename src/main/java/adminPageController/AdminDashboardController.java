package adminPageController;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.CompletableFuture;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;

import adminDto.UsersDTO;
import adminPageMapper.RootAdminMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import listener.UserCounter;
import mybatis.service.SqlSessionFactoryService;
import transactions.dao.SalesDao;
import transactions.dto.PieDto;
import users.dao.UserLogDao;
import users.dao.UsersDao;
import users.dto.UserLogCountDto;

@WebServlet("/admin/dashboard")
public class AdminDashboardController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (SqlSession session = SqlSessionFactoryService.getSqlSessionFactory().openSession()) {
            RootAdminMapper mapper = session.getMapper(RootAdminMapper.class);

            long beforeTime = System.currentTimeMillis();
            // 비동기 처리 시작
            CompletableFuture<Integer> totalUsersFuture = CompletableFuture.supplyAsync(mapper::getTotalUsers);
            CompletableFuture<Integer> userCountFuture = CompletableFuture.supplyAsync(mapper::getUserCount);
            CompletableFuture<Integer> skiOwnersFuture = CompletableFuture.supplyAsync(mapper::getSkiOwners);
            CompletableFuture<Integer> rentalOwnersFuture = CompletableFuture.supplyAsync(mapper::getRentalOwners);
            CompletableFuture<Integer> resortOwnersFuture = CompletableFuture.supplyAsync(mapper::getResortOwners);
            CompletableFuture<Integer> pendingCountsFuture = CompletableFuture.supplyAsync(mapper::getPendingCounts);
            CompletableFuture<List<UsersDTO>> newUserListFuture = CompletableFuture.supplyAsync(mapper::getNewUsers);
            
            SalesDao salesDao = SalesDao.getInstance();
            CompletableFuture<HashMap<String, Object>> dailySalesFuture = CompletableFuture.supplyAsync(salesDao::getDailySales);
            CompletableFuture<HashMap<String, Integer>> weeklySalesFuture = CompletableFuture.supplyAsync(salesDao::getWeeklySales);
            CompletableFuture<HashMap<String, Integer>> monthlySalesFuture = CompletableFuture.supplyAsync(salesDao::getMonthlySales);
            CompletableFuture<HashMap<String, Integer>> yearlySalesFuture = CompletableFuture.supplyAsync(salesDao::getYearlySales);
            CompletableFuture<List<PieDto>> pieFuture = CompletableFuture.supplyAsync(salesDao::getRecentPie);

            UserLogDao userLogDao = UserLogDao.getInstance();
            CompletableFuture<List<UserLogCountDto>> visitorLogFuture = CompletableFuture.supplyAsync(userLogDao::selectLogCountsForMonth);
            CompletableFuture<Integer> todayVisitorFuture = CompletableFuture.supplyAsync(userLogDao::selectLogCount);
            CompletableFuture<Integer> todayPureVisitorFuture = CompletableFuture.supplyAsync(userLogDao::selectUniqueLogCount);

            // 모든 비동기 작업 완료 대기 후 결과 설정
            req.setAttribute("totalUsers", totalUsersFuture.get());
            req.setAttribute("userCount", userCountFuture.get());
            req.setAttribute("skiOwners", skiOwnersFuture.get());
            req.setAttribute("rentalOwners", rentalOwnersFuture.get());
            req.setAttribute("resortOwners", resortOwnersFuture.get());
            req.setAttribute("pendingCounts", pendingCountsFuture.get());
            req.setAttribute("newUserList", newUserListFuture.get());

            req.setAttribute("daily", dailySalesFuture.get());
            req.setAttribute("weekly", weeklySalesFuture.get());
            req.setAttribute("monthly", monthlySalesFuture.get());
            req.setAttribute("yearly", yearlySalesFuture.get());
            
            List<PieDto> pieList = pieFuture.get();
            req.setAttribute("pie", pieList);
            for (PieDto pie : pieList) {
                req.setAttribute(pie.getCategory() + "_PIE", pie.getPie());
            }

            JSONObject json = new JSONObject();
            json.put("list", visitorLogFuture.get());
            req.setAttribute("visitor_json", json);
            req.setAttribute("todayVisitorCount", todayVisitorFuture.get());
            req.setAttribute("todayPureVisitorCount", todayPureVisitorFuture.get());
            req.setAttribute("currentUsers", UserCounter.getCount());
            long afterTime = System.currentTimeMillis(); // 코드 실행 후에 시간 받아오기
            long diffTime = afterTime - beforeTime; // 두 개의 실행 시간
            System.out.println(diffTime);
            
            req.getRequestDispatcher("/admin/adminmain.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("DB 조회 중 오류 발생", e);
        }
    }
}