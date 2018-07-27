package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.TimelineService;
import vo.Chatting;


public class TimelineWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private TimelineService service = new TimelineService();  

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String id = session.getAttribute("loginInfo").toString();
		String content = request.getParameter("content");	
		Chatting chatting = new Chatting(id, content);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String result = "{";
		try {
			service.insertChat(chatting);
			result+="\"status\":\"1\"";
		}catch(Exception e) {
			e.printStackTrace();
			result+="\"status\":\"-1\", ";
			result+="\"msg\": \"" + e.getMessage() + "\"";
		}		
		result += "}";
		out.print(result);
	}

}
