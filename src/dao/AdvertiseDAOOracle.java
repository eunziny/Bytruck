package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import sql.MyConnection;
import vo.Advertisement;

public class AdvertiseDAOOracle implements AdvertiseDAO {

	@Override
	public void insertAd(Advertisement ad) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String insertSQL = "insert into advertisement(user_id, no, title, detail, posted) "
				+ "values(?, advertisement_no_seq.nextval, ?, ?, sysdate)";
		try {
			con = sql.MyConnection.getConnection();
			pstmt = con.prepareStatement(insertSQL);
			pstmt.setString(1, ad.getUser_id());
			pstmt.setString(2, ad.getTitle());
			pstmt.setString(3, ad.getDetail());
			
			pstmt.executeUpdate();
		}finally {
			MyConnection.close(pstmt, con);			
		}

	}

	//배너광고 리스트
	@Override
	public List<Advertisement> selectAll() throws Exception {
		List<Advertisement> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = sql.MyConnection.getConnection();
			String selectAllSQL =
					"SELECT user_id, no, title, posted "
					+ " FROM Advertisement"
					+ " ORDER BY no desc";
			pstmt = con.prepareStatement(selectAllSQL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new Advertisement(
					rs.getString("user_id"),
					rs.getInt("no"),
					rs.getString("title"),
					rs.getString("posted")));
			}
		} finally {
			MyConnection.close(rs, pstmt, con);
		}
		return list;
	}
	
	@Override
	public List<Advertisement> selectAllAd() throws Exception {
		List<Advertisement> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectAllSQL = "select no, title, user_id " + " from advertisement" + " order by no desc";
		try {
			con = sql.MyConnection.getConnection();
			pstmt = con.prepareStatement(selectAllSQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Advertisement(rs.getInt("no"), rs.getString("title"), rs.getString("user_id")));
			}
		} finally {
			MyConnection.close(rs, pstmt, con);
		}
		return list;
	}

	public static void main(String[] args) {
		AdvertiseDAOOracle test = new AdvertiseDAOOracle();
		try {
			List<Advertisement> list = test.selectAllAd();
			System.out.println(list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public Advertisement selectDetail(int no) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Advertisement ad = new Advertisement();
		String selectDetailSQL = "SELECT no, title, user_id, detail"
								+" FROM advertisement"
								+" WHERE no = ?"
								+" ORDER BY no desc";
		try {
			con = sql.MyConnection.getConnection();
			pstmt = con.prepareStatement(selectDetailSQL);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String title = rs.getString("title");
				String id = rs.getString("user_id");
				String detail = rs.getString("detail");
				ad = new Advertisement(no, title, id, detail);
			}
		} finally {
			MyConnection.close(rs, pstmt, con);
		}
		return ad;
	}

	@Override
	public List<Advertisement> selectByTitle(String content) throws Exception {
		List<Advertisement> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = sql.MyConnection.getConnection();
			String selectByTitleSQL = 
			"SELECT no, title, posted, user_id "
			+ " FROM Advertisement"
			+ " WHERE title "
			+ " LIKE ?"
			+ " ORDER BY no desc";
			pstmt = con.prepareStatement(selectByTitleSQL);
			pstmt.setString(1, "%"+ content +"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new Advertisement(
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
	public List<Advertisement> selectByDetail(String content) throws Exception {
		List<Advertisement> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = sql.MyConnection.getConnection();
			String selectByDetailSQL = 
			"SELECT no, title, posted, user_id "
			+ " FROM Advertisement"
			+ " WHERE detail "
			+ " LIKE ?"
			+ " ORDER BY no desc";
			pstmt = con.prepareStatement(selectByDetailSQL);
			pstmt.setString(1, "%"+ content +"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new Advertisement(
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
	
}