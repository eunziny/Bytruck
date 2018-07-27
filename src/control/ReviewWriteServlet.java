package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ReviewService;
import vo.Review;

public class ReviewWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReviewService service = new ReviewService();
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = (String)request.getParameter("id");
		String title = (String)request.getParameter("title");
		String detail = (String)request.getParameter("detail");
		String trip_date = (String)request.getParameter("trip_date");
		String longtitude = (String)request.getParameter("xlocation");
		String latitude = (String)request.getParameter("ylocation");
				
		System.out.println(id);
		System.out.println(title);
		
		Review rv = new Review();
		rv.setUser_id(id);
		rv.setTitle(title);
		rv.setDetail(detail);
		rv.setTrip_date(trip_date);
		rv.setLatitude(latitude);
		rv.setLongtitude(longtitude);
		try {
			service.reviewwrite(rv);
			request.setAttribute("result", 1);
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("result", -1);
		}
		
		String forwardURL = "course/reviewwriteresult.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(forwardURL);
		rd.forward(request, response);
		
		
	}

}