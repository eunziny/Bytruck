package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.UserService;

public class UserDropServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService service = new UserService();
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String idValue = session.getAttribute("loginInfo").toString();
		String forwardURL = "";
		try {
			String result = service.userdrop(idValue);
			request.setAttribute("result", result);	
			session.setAttribute("loginInfo", null);
			session.setAttribute("loginInfo_type", null);
		} catch (Exception e) {
			request.setAttribute("result", e.getMessage());
		}
		forwardURL = "mypage/dropResult.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(forwardURL);
		rd.forward(request, response);
	}

}
