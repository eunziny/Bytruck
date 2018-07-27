package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.UserService;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService service = new UserService();

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("servlet");
		String idValue = request.getParameter("id");
		String pwdValue = request.getParameter("pwd");

		String forwardURL = "";
		HttpSession session = request.getSession();

		try {
			String result = service.login(idValue, pwdValue);
			if (result.equals("1")) { // 로그인 성공:1, 실패:-1
				session = request.getSession();
				session.setAttribute("loginInfo", idValue);
				String usertype = service.searchtype(idValue);
				session.setAttribute("loginInfo_type", usertype);
				request.setAttribute("result", result);	
			} else {
				request.setAttribute("result", result);
			}
		} catch (Exception e) {
			request.setAttribute("result", e.getMessage());
		}
		forwardURL = "base/loginResult.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(forwardURL);
		rd.forward(request, response);
	}
}
