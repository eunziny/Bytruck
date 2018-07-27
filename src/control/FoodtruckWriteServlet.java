package control;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*import com.sun.deploy.uitoolkit.impl.fx.ui.FXAboutDialog;*/

import service.FoodtruckService;
import service.Food_ImgProcess;
import vo.Foodtruck_Location;

public class FoodtruckWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FoodtruckService service = new FoodtruckService();
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		request.setCharacterEncoding("UTF-8");
  		String id = request.getParameter("id");
  		String forwardURL = "";
  		
  		try {
  			Food_ImgProcess ip = new Food_ImgProcess(request); //파일첨부 처리하기 위해 ImgProcess.java파일 만듦
  	  		Foodtruck_Location fc = ip.upload(); //ImgProcess의 upload()메소드 호출
  	  		fc.setUser_id(id);
			service.foodtruckwrite(fc);
			request.setAttribute("result", 1);
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "글쓰기 실패하셨습니다.");
		}
  		if(request.getAttribute("result").equals("1")) {
			forwardURL = "foodtruck/foodtruck.jsp";
		}else {
			forwardURL = "foodtruck/foodtruck.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(forwardURL);
		rd.forward(request, response);
  		
	}

}