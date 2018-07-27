package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AdvertiseService;
import vo.Advertisement;

public class AdvertiseWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AdvertiseService service = new AdvertiseService();
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String title = (String)request.getParameter("title");
		String detail = (String)request.getParameter("detail");
		Advertisement ad = new Advertisement();
		ad.setUser_id(id);
		ad.setTitle(title);
		ad.setDetail(detail);
		try {
			service.adwrite(ad);
			request.setAttribute("result", 1);
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("result", -1);
		}
		String forwardURL = "adboard/adwriteresult.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(forwardURL);
		rd.forward(request, response);
				
	}

}
