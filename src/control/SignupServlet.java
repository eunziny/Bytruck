package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.UserService;
import vo.Users;

public class SignupServlet extends HttpServlet {
	 private UserService service = new UserService();   
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String birthday = request.getParameter("birthday");
		String tel = request.getParameter("tel");

		Users u = new Users(id, pwd, name, birthday, tel, email, "BK");
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String result = "{";
		try {
			service.signup(u);
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
