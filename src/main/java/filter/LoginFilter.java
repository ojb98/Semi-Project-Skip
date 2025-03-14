package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import users.dto.UsersDto;

@WebFilter(urlPatterns = {
		"/users/mypage/*", "/users/logout"
})
public class LoginFilter implements Filter {
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpReq = (HttpServletRequest)req;
		if (httpReq.getSession().getAttribute("user") == null) {
			HttpServletResponse httpResp = (HttpServletResponse)resp;
			httpResp.sendRedirect(httpReq.getContextPath() + "/users/login");
		} else {
			chain.doFilter(req, resp);
		}
	}
}
