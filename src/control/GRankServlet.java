package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AdminService;
import vo.Review;

/**
 * Servlet implementation class GRankServlet
 */
public class GRankServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminService service = new AdminService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GRankServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			List<Review> good = service.findGoodRank();
			request.setAttribute("good", good);
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd;
		String forwardURL = "admin/likeChartResult.jsp";
		rd = request.getRequestDispatcher(forwardURL);
		rd.forward(request, response);
	}
}
