package ski.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ski.dao.SkiReservationDao;
import ski.dto.SkiNameLocationDto;

@WebServlet("/ski/location")
public class SkiLocationController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		JSONObject response = new JSONObject();
		try {
			List<SkiNameLocationDto> list = SkiReservationDao.getInstance().listNameAndLocation();
			ArrayList<Double> lats = new ArrayList<>();
			ArrayList<Double> lons = new ArrayList<>();
			response.put("list", list);
			for (SkiNameLocationDto dto: list) {
				URL url = new URL("https://api.vworld.kr/req/address?service=address&request=getCoord&type=road&"
						+ "key=2DB968FF-9028-340B-8733-DA36F0BEF16A&"
						+ "address=" + URLEncoder.encode(dto.getLocation(), StandardCharsets.UTF_8));
				BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(), StandardCharsets.UTF_8));
				StringBuilder sb = new StringBuilder();
				String input = "";
				while ((input = br.readLine()) != null) {
					sb.append(input);
				}
				JSONObject json = new JSONObject(sb.toString());
				JSONObject point = json.getJSONObject("response").getJSONObject("result").getJSONObject("point");
				lats.add(point.getDouble("y"));
				lons.add(point.getDouble("x"));
			}
			response.put("lats", lats);
			response.put("lons", lons);
			pw.print(response.toString());
			pw.close();
		} catch (Exception e) {
			response.put("err", e.getMessage());
			pw.print(response.toString());
			pw.close();
		}
	}
}
