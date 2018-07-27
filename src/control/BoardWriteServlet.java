package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardService;
import vo.Board;

public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService service = new BoardService();
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = (String)request.getParameter("id");
		String type_s = (String)request.getParameter("type");
		String title = (String)request.getParameter("title");
		String detail = (String)request.getParameter("detail");
		
		System.out.println(id);
		System.out.println(type_s);
		System.out.println(title);
		System.out.println(detail);
		
		int type = Integer.parseInt(type_s);
		/*System.out.println(type);*/
		Board board = new Board();
		board.setUser_id(id);
		board.setType(type);
		board.setTitle(title);
		board.setDetail(detail);
		try {
			service.write(board);
			request.setAttribute("result", 1);
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("result", -1);
		}
		
		String forwardURL = "brand/noticewriteresult.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(forwardURL);
		rd.forward(request, response);
		
	}
}