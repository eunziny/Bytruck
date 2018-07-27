package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.FoodtruckService;
import vo.Foodtruck_Location;


public class FoodtruckUpdateDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FoodtruckService service = new FoodtruckService();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		request.setAttribute("no", no);

		try {
			Foodtruck_Location fl = service.findDetail(no);
			request.setAttribute("fl", fl);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", e.getMessage());
		}
		RequestDispatcher rd;
		String forwardURL = "foodtruck/foodtruck_modify.jsp";
		rd = request.getRequestDispatcher(forwardURL);
		rd.forward(request, response);	
	}

}
