package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sql.MyConnection;
import vo.Review;
import vo.Users;

public class AdminDAOOracle implements AdminDAO {

	public List<Review> selectGoodRank() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectGoodRankSQL = " select RANK()OVER (ORDER BY good desc), user_id, good" + " from review";
		List<Review> list = new ArrayList<>();
		try {
			con = sql.MyConnection.getConnection();
			pstmt = con.prepareStatement(selectGoodRankSQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Review(rs.getString("user_id"), rs.getInt("good")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			MyConnection.close(rs, pstmt, con);
		}
		return list;
	}

	@Override
	public int[] selectUserConut() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectUserCountSQL = "select tr.tt TR, bk.tb BK"
				+ " from(select count(type) tt from users where type='TR') tr, "
				+ " (select count(type) tb from users where type = 'BK') bk";
		int count[] = new int[2];
		try {
			con = sql.MyConnection.getConnection();
			pstmt = con.prepareStatement(selectUserCountSQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count[0] = rs.getInt("TR");
				count[1] = rs.getInt("BK");
			}

		} finally {
			MyConnection.close(rs, pstmt, con);
		}
		return count;
	}
	
	public static void main(String[] args) {
		AdminDAOOracle test = new AdminDAOOracle();
		try {
			int[] u = test.selectUserConut();
			System.out.println(u[0]);
			System.out.println(u[1]);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
