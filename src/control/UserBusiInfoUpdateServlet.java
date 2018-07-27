package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.FoodtruckService;
import vo.Foodtruck;

public class UserBusiInfoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private FoodtruckService service = new FoodtruckService(); 
  
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Foodtruck ft =new Foodtruck();
		HttpSession session = request.getSession();
		String id = session.getAttribute("loginInfo").toString();
		String storename = request.getParameter("storename");
		String menutype = request.getParameter("ptype");
		String menuname = request.getParameter("product");
		int price = Integer.parseInt(request.getParameter("price"));
		String detail = request.getParameter("detail");
		
		request.setAttribute("nid", id);
		request.setAttribute("nstorename", storename);
		request.setAttribute("nmenutype", menutype);
		request.setAttribute("nmenuname", menuname);
		request.setAttribute("nprice", price);
		request.setAttribute("ndetail", detail);
		
		ft.setUser_id(id);
		ft.setBussiness_name(storename);
		ft.setMenu_type(menutype);
		ft.setMenu_name(menuname);
		ft.setPrice(price);
		ft.setDetail(detail);
		
		try {
			service.update(ft);
			request.setAttribute("result", 1);
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("result", -1);
		}
		String forwardURL = "mypage/modifyresult.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(forwardURL);
		rd.forward(request, response);
	}

}
