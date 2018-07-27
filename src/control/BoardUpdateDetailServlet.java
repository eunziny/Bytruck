package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardService;
import vo.Board;


public class BoardUpdateDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService service = new BoardService();   

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터로 넘어온 글번호를 가져온다.
				String num = request.getParameter("num");
				String bname = request.getParameter("type");
				System.out.println("num값: "+num+", type값: "+bname);
				int boardNum = Integer.parseInt(num);
				int type = Integer.parseInt(bname);
				request.setAttribute("bnum", boardNum);
				request.setAttribute("btype",bname);
				
				try {
					Board board = service.findDetail(boardNum, type);
					request.setAttribute("board", board);
					
				} catch (Exception e) {
					e.printStackTrace();
					request.setAttribute("result", e.getMessage());
				}		
				RequestDispatcher rd;
				String forwardURL = "brand/notice_modify.jsp";
				System.out.println("forward");
				rd = request.getRequestDispatcher(forwardURL);
				rd.forward(request, response);		
	}

}
