package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.EventService;
import service.Event_ImgProcess;
import vo.Event;

public class EventWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private EventService service = new EventService();   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		try {
			System.out.println("servlet : "+id);
  			Event_ImgProcess ep = new Event_ImgProcess(request); //파일첨부 처리하기 위해 ImgProcess.java파일 만듦
  	  		Event ev = ep.upload(); //ImgProcess의 upload()메소드 호출
			service.eventwrite(ev);
			request.setAttribute("result", 1);
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("result", -1);
		}
		String forwardURL = "event/event.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(forwardURL);
		rd.forward(request, response);  		
	}
	
}
