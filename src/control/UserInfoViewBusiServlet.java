package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.FoodtruckService;
import vo.Foodtruck;

public class UserInfoViewBusiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FoodtruckService service = new FoodtruckService();
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String forwardURL = "";
		
		try {
			Foodtruck result = service.finduser(id);
			if (result!=null) { // 회원 정보찾기 성공:1
				request.setAttribute("foodtruck", result);	
			}
		} catch (Exception e) {
			request.setAttribute("result", e.getMessage());
		}
		forwardURL = "mypage/mypageBussiness.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(forwardURL);
		rd.forward(request, response);	
	}

}
