package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sql.MyConnection;
import vo.Tripcourse;

public class CourseDAOOracle implements CourseDAO
{

	@Override
	public void insertcourse(Tripcourse course) {
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		PreparedStatement pstmt4 = null;
		
		String insertSQl = "insert into course(no, user_id, trip_date, withyn, title, detail)\r\n" + 
				"values (course_no_seq.nextval, ?, to_char(to_date(?, 'yyyy.mm.dd'),'yyyy-mm-dd'), ?, ?, ?)";
		String insertSQL2 =	"insert into detail_course(no, step, latitude, longtitude)\r\n" + 
				"values(course_no_seq.currval, detailcourse_no_seq.nextval, ?, ?)";
		String insertSQL3 = "drop sequence detailcourse_no_seq";
		String insertSQL4 = "create sequence detailcourse_no_seq minvalue 1\r\n" + 
				"start with 1 increment by 1 maxvalue 999 cycle nocache";
		
		System.out.println("oracle");
		String[] xlocation = course.getXlocation();
		String[] ylocation = course.getYlocation();
		try {
			con = sql.MyConnection.getConnection();	
			pstmt = con.prepareStatement(insertSQl);
			pstmt.setString(1, course.getUser());
			pstmt.setString(2, course.getDate());
			pstmt.setString(3, course.getWith());
			pstmt.setString(4, course.getTitle());
			pstmt.setString(5, course.getDetail());
			pstmt.executeUpdate();
			
			System.out.println("oracle1");
			pstmt2 = con.prepareStatement(insertSQL2);
			for(int i=0; xlocation.length > i ; i++) {
				pstmt2.setString(1, ylocation[i]);
				pstmt2.setString(2, xlocation[i]);				
				pstmt2.executeUpdate();
			}
			System.out.println("oracle2");
			pstmt3 = con.prepareStatement(insertSQL3);
			pstmt3.executeQuery();
			pstmt4 = con.prepareStatement(insertSQL4);
			pstmt4.executeQuery();
			System.out.println("oracle3");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyConnection.close(pstmt);
			MyConnection.close(pstmt2);
			MyConnection.close(pstmt3);
			MyConnection.close(pstmt4,con);
		}		
	}

	@Override
	public List<Tripcourse> listcourse() { //미완성
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Tripcourse> list = new ArrayList<Tripcourse>();
		
		String insertSQL = "select *\r\n" + 
				"        from course\r\n" + 
				"        order by no";
		
		try {
			con = sql.MyConnection.getConnection();
			pstmt = con.prepareStatement(insertSQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {	
				Tripcourse tc = new Tripcourse();
				tc.setNo(rs.getInt("no"));
//				tc.setStep(rs.getInt("step"));
				tc.setUser(rs.getString("user_id"));
				tc.setTitle(rs.getString("title"));
				tc.setWith(rs.getString("withyn"));
//				tc.setXlocationS(rs.getString("longtitude"));
//				tc.setYlocationS(rs.getString("latitude"));
				list.add(tc);
			}		
			System.out.println("test"+list);
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} finally {
			MyConnection.close(rs, pstmt, con);
		}
	}

	@Override
	public List<Tripcourse> detailcourse(int num) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<Tripcourse> list = new ArrayList<Tripcourse>();
		
		String selectSQL = "select c.no, dc.step, c.title, c.detail, c.withyn, c.trip_date, dc.LATITUDE, dc.LONGTITUDE\r\n" + 
				"from course c join detail_course dc\r\n" + 
				"on c.no = dc.no\r\n" + 
				"where c.no = ?";
		try {
			con=MyConnection.getConnection();
			pstmt = con.prepareStatement(selectSQL);
			pstmt.setInt(1,num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new Tripcourse(
							rs.getInt("no"),
							rs.getInt("step"),
							rs.getString("trip_date"),
							rs.getString("title"),
							rs.getString("detail"),
							rs.getString("latitude"),
							rs.getString("longtitude")
						));
			}
			return list;
		}
		finally {
			MyConnection.close(rs, pstmt, con);			
		}
		
	}
}
