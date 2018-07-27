package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.FoodtruckService;
import vo.Foodtruck;
import vo.Users;

public class UserBusiInfoUpdateDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private FoodtruckService service = new FoodtruckService(); 

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		request.setAttribute("id", id);

		try {
			Foodtruck ft = service.finduser(id);
			request.setAttribute("foodtruck", ft);
		} catch (Exception e) {
			request.setAttribute("result", e.getMessage());
		}
		RequestDispatcher rd;
		String forwardURL = "mypage/editInfoBussiness.jsp";
		rd = request.getRequestDispatcher(forwardURL);
		rd.forward(request, response);
	}

}
