package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.FoodtruckService;
import vo.Foodtruck_Location;

public class FoodtruckDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private FoodtruckService service = new FoodtruckService();   

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		int fnum = Integer.parseInt(num);
		request.setAttribute("fnum", fnum);
		try {
			Foodtruck_Location flocation = service.findDetail(fnum);
			request.setAttribute("fl",flocation);
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", e.getMessage());
		} RequestDispatcher rd;
		String forwardURL = "foodtruck/foodtruckdetail.jsp";
		rd = request.getRequestDispatcher(forwardURL);
		rd.forward(request, response);				
	}
}
