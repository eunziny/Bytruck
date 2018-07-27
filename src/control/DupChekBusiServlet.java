package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.UserService;

public class DupChekBusiServlet extends HttpServlet{
	private UserService service = new UserService();
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String busiNumValue = request.getParameter("bussiness_number");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		try {
			String result = service.dupChkBusi(busiNumValue);
			System.out.println(result);
			out.print(result);
		}catch(Exception e) {
			out.print(e.getMessage());
		}	
	}

}
