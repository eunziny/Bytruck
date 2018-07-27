package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.FoodtruckService;
import service.ReviewService;
import vo.Foodtruck_Location;
import vo.Review;

/**
 * Servlet implementation class ReviewDetailServlet
 */
public class ReviewDetailServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
    private ReviewService service = new ReviewService();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
    */
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String num = request.getParameter("num");
      int bnum = Integer.parseInt(num);
      request.setAttribute("bnum", bnum);
      System.out.println(num);
      try {
         Review review = service.findDetail(bnum);
         request.setAttribute("review", review);
      }catch (Exception e) {
         e.printStackTrace();
         request.setAttribute("result", e.getMessage());
      } RequestDispatcher rd;
      String forwardURL = "course/reviewdetail.jsp";
      rd = request.getRequestDispatcher(forwardURL);
      rd.forward(request, response);      
   }
}