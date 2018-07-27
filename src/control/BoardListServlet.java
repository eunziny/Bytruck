package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardService;
import vo.Board;


//은진 공지사항 리스트
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService service = new BoardService();
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String type_s = request.getParameter("type");
		String searchItem = request.getParameter("searchItem");
		String searchValue = request.getParameter("searchValue");
		int type = Integer.parseInt(type_s);
		
		if(searchItem == null || searchValue==null||
				   searchItem.equals("") || searchValue.equals("")) {
					try {
						List<Board> list = service.findAll(type);
						request.setAttribute("list", list);
						/*System.out.println(list);*/
					} catch (Exception e) {
						request.setAttribute("result", e.getMessage());
					}
				} else {
					if(searchItem.equals("title")) { //제목으로 검색
						try {
							List<Board>list = service.findByTitle(searchValue, type);
							request.setAttribute("list", list);
							/*System.out.println(list);*/
						}catch (Exception e) {
							request.setAttribute("result", e.getMessage());
						}
					} else if(searchItem.equals("detail")) { //내용으로 검색
						try {
							List<Board>list = service.findByDetail(searchValue, type);
							request.setAttribute("list", list);
							System.out.println(list);
						} catch(Exception e) {
							request.setAttribute("result", e.getMessage());
						}
					}
				}
		
		RequestDispatcher rd;
	      String forwardURL = null;
	      if(type == 0) {
	         forwardURL = "brand/noticelistresult.jsp";
	      }else if(type== 1) {
	         forwardURL = "board/qnalistresult.jsp";
	      }
	      rd = request.getRequestDispatcher(forwardURL);
	      rd.forward(request, response);
	}

}
