package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AdminService;
import vo.Event;
import vo.Users;

/**
 * Servlet implementation class MemRankServlet
 */
public class MemRankServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminService service = new AdminService();     
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemRankServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int[] mChart = service.findUserCount();
			request.setAttribute("mchart", mChart);
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd;
		String forwardURL = "admin/memChartResult.jsp";
		rd = request.getRequestDispatcher(forwardURL);
		rd.forward(request, response);
	}
}
