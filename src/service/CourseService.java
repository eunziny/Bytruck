package service;

import java.util.List;

import dao.CourseDAO;
import dao.CourseDAOOracle;
import vo.Tripcourse;

public class CourseService {
   private CourseDAO dao = new CourseDAOOracle();
   public void write(Tripcourse course) throws Exception{
      dao.insertcourse(course);
      //System.out.println("service");
   }
   
   public List<Tripcourse> list() throws Exception{
      return dao.listcourse(); 
   }
   
   public List<Tripcourse> detail(int num) throws Exception{
      System.out.println("service");
      return dao.detailcourse(num);
   }
}