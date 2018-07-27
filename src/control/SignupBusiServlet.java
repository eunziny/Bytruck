package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.FoodtruckService;
import service.UserService;
import vo.Foodtruck;
import vo.Users;	

public class SignupBusiServlet extends HttpServlet {
	 private UserService service = new UserService();
	 private FoodtruckService ftservice = new FoodtruckService();
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String businum = request.getParameter("businum");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String birthday = request.getParameter("birthday");
		String tel = request.getParameter("tel");
		
		String storename = request.getParameter("storename");
		String typename = request.getParameter("ptype");

		String product = request.getParameter("product");
		int price = Integer.parseInt(request.getParameter("price"));
		String detail = request.getParameter("detail");
		
		Users u = new Users(id, pwd, name, birthday, tel, email, businum, "TR");
		Foodtruck ft = new Foodtruck(id, storename, product, price, typename, detail);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String result = "{";
		try {
			service.signup2(u);
			ftservice.signup(ft);
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
