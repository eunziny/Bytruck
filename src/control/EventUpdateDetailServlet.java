package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.EventService;
import vo.Event;

public class EventUpdateDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EventService service = new EventService();

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String num = request.getParameter("num");
		int boardNum = Integer.parseInt(num);
		request.setAttribute("bnum", boardNum);
		try {
			Event event = service.findDetail(boardNum);
			request.setAttribute("event", event);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", e.getMessage());
		}
		RequestDispatcher rd;
		String forwardURL = "event/eventmodify.jsp";
		rd = request.getRequestDispatcher(forwardURL);
		rd.forward(request, response);
	}
}
