package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardService;
import vo.Board;

public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService service = new BoardService();   

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Board board = new Board();
		String num = request.getParameter("num");
		String bname = request.getParameter("type");
		String title = request.getParameter("title");
		String detail = request.getParameter("detail"); 

		int boardNum = Integer.parseInt(num);
		int type = Integer.parseInt(bname);
		request.setAttribute("bnum", boardNum);
		request.setAttribute("btype",bname);
		request.setAttribute("btitle", title);
		request.setAttribute("bdetail", detail);

		//수정
			System.out.println("boardServlet update");
			board.setNo(boardNum);
			board.setType(type);
			board.setTitle(title);
			board.setDetail(detail);
			try {
				service.modify(board);
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
