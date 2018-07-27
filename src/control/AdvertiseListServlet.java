package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AdvertiseService;
import vo.Advertisement;
import vo.Review;

public class AdvertiseListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private AdvertiseService service = new AdvertiseService();   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String searchItem = request.getParameter("searchItem");
		String searchValue = request.getParameter("searchValue");
		
		if(searchItem == null || searchValue==null||
		   searchItem.equals("") || searchValue.equals("")) {
			try {
				List<Advertisement> list = service.findAll();
				request.setAttribute("list", list);
				System.out.println(list);
			} catch (Exception e) {
				request.setAttribute("result", e.getMessage());
			}
		} else {
			if(searchItem.equals("title")) { //제목으로 검색
				try {
					List<Advertisement>list = service.findByTitle(searchValue);
					request.setAttribute("list", list);
					/*System.out.println(list);*/
				}catch (Exception e) {
					request.setAttribute("result", e.getMessage());
				}
			} else if(searchItem.equals("detail")) { //내용으로 검색
				try {
					List<Advertisement>list = service.findByDetail(searchValue);
					request.setAttribute("list", list);
					System.out.println(list);
				} catch(Exception e) {
					request.setAttribute("result", e.getMessage());
				}
			}
		}
		
		String forwardURL = "adboard/ad_listresult.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(forwardURL);
		rd.forward(request, response);
	}
	

}
