package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.UserService;
import vo.Users;


public class UserInfoViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService service = new UserService();
	
    public UserInfoViewServlet() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idValue = request.getParameter("id");
		String type = request.getParameter("type");
		
		String forwardURL = "";
		//개인정보
		try {
			Users result = service.finduser(idValue);
			if (result!=null) { // 회원 정보찾기 성공:1
				request.setAttribute("users", result);	
			}
		} catch (Exception e) {
			request.setAttribute("result", e.getMessage());
		}
		forwardURL = "mypage/mypage.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(forwardURL);
		rd.forward(request, response);	
	}

}
