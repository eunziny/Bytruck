package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import sql.MyConnection;
import vo.Event;
import vo.Foodtruck_Location;

public class EventDAOOracle implements EventDAO {

	@Override
	public void insertevent(Event ev) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String insertSQL = "insert into event(no, user_id, title, detail, event_date, imgpath) "
				+ "values(event_id_seq.nextval, ?, ?, ?, to_char(to_date(?, 'yyyy-mm-dd'),'yyyy-mm-dd'), ?)";
		try {
			con = sql.MyConnection.getConnection();
			pstmt = con.prepareStatement(insertSQL);
			pstmt.setString(1, ev.getUser_id());
			pstmt.setString(2, ev.getTitle());
			pstmt.setString(3, ev.getDetail());
			pstmt.setString(4, ev.getEvent_date());
			pstmt.setString(5, ev.getImgpath());	
			pstmt.executeUpdate();
		}finally {
			MyConnection.close(pstmt, con);			
		}

	}

	@Override
	public List<Event> selectAll() throws Exception {
		List<Event> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = sql.MyConnection.getConnection();
			String selectAllSQL =
					"SELECT no, title, imgpath"
					+ " FROM Event"
					+ " ORDER BY no desc";
			pstmt = con.prepareStatement(selectAllSQL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new Event(
						rs.getInt("no"),
						rs.getString("title"),
						rs.getString("imgpath")
						));
			}
		} finally {
			MyConnection.close(rs, pstmt, con);
		}
		return list;
	}
	
	@Override
	   public Event selectDetail(int bNum) throws Exception {
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      Event event = null;
	      String selectDetailSQL = "select * from event where no = ?";
	      try {
	         con = sql.MyConnection.getConnection();
	         pstmt = con.prepareStatement(selectDetailSQL);
	         pstmt.setInt(1, bNum);
	         rs = pstmt.executeQuery();
	      if (rs.next()) {
	         int num = bNum;
	         String id = rs.getString("user_id");
	         String title = rs.getString("title");
	         String detail = rs.getString("detail");
	         String edate = rs.getString("event_date");
	         String imgpath = rs.getString("imgpath");
	         event = new Event(num, id, title, detail, edate, imgpath);
	         }
	      }finally {
	         MyConnection.close(rs, pstmt, con);
	      }
	      return event;
	   }
	

	   @Override
	   public List<Event> selectEvent() throws Exception {
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String selectAllSQL = "select no, user_id, title, detail, to_date(event_date,'YYYY-MM-DD') edate "
	                       +" from event";
	      List<Event> list = new ArrayList<>();

	      try {
	         con = sql.MyConnection.getConnection();
	         pstmt = con.prepareStatement(selectAllSQL);
	         rs = pstmt.executeQuery();

	         while (rs.next()) {
	            Date date = rs.getDate("edate");
	            System.out.println("date값  "+date);
	            list.add(new Event(rs.getInt("no"), rs.getString("user_id"), rs.getString("title"),
	                  rs.getString("detail"), date));
	         }
	         return list;
	      } finally {
	         MyConnection.close(rs, pstmt, con);
	      }
	   }
	   
	   
	   
		public static void main(String[] args) {
			EventDAOOracle test = new EventDAOOracle(); 
				try {
					List<Event> list = test.selectAll();
					for (Event ev : list) {
						System.out.println(ev);
					}
				} catch (Exception e) {
					e.printStackTrace();
			}
				
		}

		@Override
		public void update(Event ev) throws Exception {
			Connection con = null;
			PreparedStatement pstmt = null;
			String updateSQL = "UPDATE event SET title=?, event_date=?, detail=?, imgpath=? WHERE user_id=? and no=?";
			try {
				con = sql.MyConnection.getConnection();
				pstmt = con.prepareStatement(updateSQL);
				pstmt.setString(1, ev.getTitle());
				pstmt.setString(2, ev.getEvent_date());
				pstmt.setString(3, ev.getDetail());
				pstmt.setString(4, ev.getImgpath());
				pstmt.setString(5, ev.getUser_id());
				pstmt.setInt(6,  ev.getNo());
				pstmt.executeUpdate();
			}finally {
				MyConnection.close(pstmt, con);			
			}
		}
}