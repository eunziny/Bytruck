package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Food_ImgProcess;
import service.FoodtruckService;
import vo.Foodtruck_Location;

public class FoodtruckUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FoodtruckService service = new FoodtruckService();  

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		int num = Integer.parseInt(request.getParameter("num"));
		String forwardURL ="";
		
		try {
  			Food_ImgProcess ip = new Food_ImgProcess(request); //파일첨부 처리하기 위해 ImgProcess.java파일 만듦
  	  		Foodtruck_Location fc = ip.upload(); //ImgProcess의 upload()메소드 호출
  	  		fc.setUser_id(id);
  	  		fc.setNo(num);
			service.foodtruckBoardUpdate(fc);
			request.setAttribute("result", 1);
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "수정 실패하셨습니다.");
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
