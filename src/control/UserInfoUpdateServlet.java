package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.UserService;
import vo.Users;


public class UserInfoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService service = new UserService();

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Users user = new Users();
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String birthday = request.getParameter("birthday");
		String tel = request.getParameter("tel");
		
		
		request.setAttribute("nid",id);
		request.setAttribute("nname", name);
		request.setAttribute("npwd", pwd);
		request.setAttribute("nemail", email);
		request.setAttribute("nbirthday", birthday);
		request.setAttribute("ntel", tel);
		
		user.setUser_id(id);
		user.setName(name);
		user.setUser_pwd(pwd);
		user.setEmail(email);
		user.setBirthday(birthday);
		user.setPhone_number(tel);
		try {
			service.update(user);
			request.setAttribute("result", 1);
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("result", -1);
		}
		String forwardURL = "mypage/modifyresult.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(forwardURL);
		rd.forward(request, response);
	}
}
