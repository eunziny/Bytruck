package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.UserService;
import vo.Users;

public class UserInfoUpdateDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService service = new UserService();
       

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		request.setAttribute("id", id);

		try {
			Users user = service.finduser(id);
			request.setAttribute("users", user);
		} catch (Exception e) {
			request.setAttribute("result", e.getMessage());
		}
		RequestDispatcher rd;
		String forwardURL = "mypage/editInfoCustom.jsp";
		rd = request.getRequestDispatcher(forwardURL);
		rd.forward(request, response);
	}

}
