package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import sql.MyConnection;
import vo.Advertisement;
import vo.Review;

public class ReviewDAOOracle implements ReviewDAO {

	//여행후기 글쓰기
	@Override
	public void insertreview(Review rv) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String insertSQL = "insert into review(no, user_id, trip_date, title, detail, posted, latitude, longtitude) "
				+ "values(review_no_seq.nextval, ?, to_char(to_date(?, 'yyyy-mm-dd')), ?, ?, sysdate, ?, ?)";
		try {
			con = sql.MyConnection.getConnection();
			pstmt = con.prepareStatement(insertSQL);
			pstmt.setString(1, rv.getUser_id());
			pstmt.setString(2, rv.getTrip_date());
			pstmt.setString(3, rv.getTitle());
			pstmt.setString(4, rv.getDetail());
			pstmt.setString(5, rv.getLatitude());
			pstmt.setString(6, rv.getLongtitude());
									
			pstmt.executeUpdate();
		}finally {
			MyConnection.close(pstmt, con);			
		}

	}

	//여행후기 리스트
	@Override
	public List<Review> selectAll() throws Exception {
		List<Review> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con = sql.MyConnection.getConnection();
			String selectAllSQL =
					"SELECT user_id, no, title, posted "
					+ " FROM Review"
					+ " ORDER BY no desc";
			pstmt = con.prepareStatement(selectAllSQL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new Review(
					rs.getInt("no"),	
					rs.getString("user_id"),
					rs.getString("title"),
					rs.getString("posted")));
			}
		} finally {
			MyConnection.close(rs, pstmt, con);
		}
		return list;
	}
	
	//여행후기 디테일
	@Override
	   public Review selectDetail(int rnum) throws Exception {
	      Connection con = null;
	       PreparedStatement pstmt = null;
	       ResultSet rs = null;
	       Review r = new Review();
	       try {
	            String selectDetailSQL = "SELECT *" 
	                              + " FROM review" 
	                              + " WHERE no = ?"
	                              +" ORDER BY no desc";
	            con = sql.MyConnection.getConnection();
	            pstmt = con.prepareStatement(selectDetailSQL);
	            pstmt.setInt(1, rnum);
	            rs = pstmt.executeQuery();
	            if (rs.next()) {
	                 int no = rnum;
	               String id = rs.getString("user_id");
	               String tdate = rs.getString("trip_date");
	               String title = rs.getString("title");
	               String detail = rs.getString("detail");
	               String pdate = rs.getString("posted");
	               int views = rs.getInt("views");
	               int good = rs.getInt("good");
	               r = new Review(no, id, tdate, title, detail, pdate, views, good);
	               
	            }
	         } finally {
	            MyConnection.close(rs, pstmt, con);
	         }
	         return r;
	   }
	
	@Override
	public List<Review> selectByTitle(String content) throws Exception {
		List<Review> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = sql.MyConnection.getConnection();
			String selectByTitleSQL = 
			"SELECT no, title, posted, user_id "
			+ " FROM Review"
			+ " WHERE title "
			+ " LIKE ?"
			+ " ORDER BY no desc";
			pstmt = con.prepareStatement(selectByTitleSQL);
			pstmt.setString(1, "%"+ content +"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new Review(
						rs.getInt("no"),
						rs.getString("title"),
						rs.getString("posted"),
						rs.getString("user_id")));
			}
		}finally {
			MyConnection.close(rs, pstmt, con);
		}	
		return list;
	}

	@Override
	public List<Review> selectByDetail(String content) throws Exception {
		List<Review> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = sql.MyConnection.getConnection();
			String selectByDetailSQL = 
			"SELECT no, title, posted, user_id "
			+ " FROM Review"
			+ " WHERE detail "
			+ " LIKE ?"
			+ " ORDER BY no desc";
			pstmt = con.prepareStatement(selectByDetailSQL);
			pstmt.setString(1, "%"+ content +"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new Review(
						rs.getInt("no"),
						rs.getString("title"),
						rs.getString("posted"),
						rs.getString("user_id")));
			}
		}finally {
			MyConnection.close(rs, pstmt, con);
		}	
		return list;
	}

	@Override
	public List<Review> selectlocation(int fNum) throws Exception {
		List<Review> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = sql.MyConnection.getConnection();
			String selectSQL ="select latitude, longtitude\r\n" + 
					"from review\r\n" + 
					"where no = ?";
			pstmt = con.prepareStatement(selectSQL);
			pstmt.setInt(1, fNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				list.add(new Review(
						rs.getString("latitude"),
						rs.getString("longtitude")
						));
			}
		}finally {
			MyConnection.close(rs, pstmt, con);
		}
		System.out.println(list);
		return list;
	}

}