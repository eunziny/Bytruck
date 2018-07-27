package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.EventService;
import vo.Board;
import vo.Event;

/**
 * Servlet implementation class EventDetailServlet
 */
public class EventDetailServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
    private EventService service = new EventService();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
    */
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // 파라미터로 넘어온 글번호와 타입을 가져온다.
      String num = request.getParameter("num");
      int boardNum = Integer.parseInt(num);
      request.setAttribute("bnum", boardNum);
      System.out.println("서블릿에서 보드넘버?" +boardNum);
      try {
         Event event = service.findDetail(boardNum);
         request.setAttribute("event", event);
      } catch (Exception e) {
         e.printStackTrace();
         request.setAttribute("result", e.getMessage());
      }      
      RequestDispatcher rd;
      String forwardURL = "event/eventdetail.jsp";
      rd = request.getRequestDispatcher(forwardURL);
      rd.forward(request, response);      
   }
}