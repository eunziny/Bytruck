package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.UserService;

public class FindIdServlet extends HttpServlet {
	private UserService service = new UserService();
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		
		PrintWriter out = response.getWriter();
		String result="";
		try {
			if(tel!=null) 
				result = service.findIdbyTel(name, tel);
			if(email!=null)
				result = service.findIdbyEmail(name, email);
			out.print(result);
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

}
