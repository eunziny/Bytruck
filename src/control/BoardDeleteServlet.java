package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardService;

/**
 * Servlet implementation class BoardDeleteServlet
 */
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService service = new BoardService();
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String noValue = request.getParameter("no");
		int boardNum = Integer.parseInt(noValue);
		
		//System.out.println(boardNum);
		
		try {
			service.Delete(boardNum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher rd;
		String forwardURL = "/brand/notice.jsp";
		rd = request.getRequestDispatcher(forwardURL);
		rd.forward(request, response);
		
	}

}
