package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.FoodtruckService;
import vo.Foodtruck_Location;

public class FoodtruckListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FoodtruckService service = new FoodtruckService();
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String type = (String)request.getParameter("foodtype");
		if(type == null || type.equals("")) {
			try {
				List<Foodtruck_Location>list = service.findByType("main");
				request.setAttribute("list", list);
			} catch (Exception e) {
				request.setAttribute("result", e.getMessage());
			}
		}else
			try {
				List<Foodtruck_Location>list = service.findByType(type);
				request.setAttribute("list", list);
			} catch (Exception e) {
				request.setAttribute("result", e.getMessage());
			}
		String forwardURL = "foodtruck/foodlistresult.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(forwardURL);
		rd.forward(request, response);	
	}

}