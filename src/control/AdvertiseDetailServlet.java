package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AdvertiseService;
import vo.Advertisement;

/**
 * Servlet implementation class AdvertiseDetailServlet
 */
public class AdvertiseDetailServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
    private AdvertiseService service = new AdvertiseService();  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdvertiseDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
    */
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String ad_num = request.getParameter("num");
      int num = Integer.parseInt(ad_num);
      request.setAttribute("num", num);
      
      try {
         Advertisement ad = service.findDetail(num);
         request.setAttribute("ad", ad);
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      RequestDispatcher rd;
      String forwardURL = "adboard/ad_detail.jsp";
      rd = request.getRequestDispatcher(forwardURL);
      rd.forward(request, response);      
   }
}