package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sql.MyConnection;
import vo.Board;
import vo.Chatting;

public class TimelineDAOOracle implements TimelineDAO {

	@Override
	public void insertChat(Chatting chatting) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = sql.MyConnection.getConnection();
			String insertSQL = "INSERT INTO chatting(no, posted, user_id, message) VALUES (chatting_no_seq.nextval,to_char(sysdate,'yyyy/MM/dd hh24:mi:ss'),?,?)";
			pstmt = con.prepareStatement(insertSQL);
			pstmt.setString(1, chatting.getUser_id());
			pstmt.setString(2, chatting.getMessage());		
			pstmt.executeUpdate();
		} catch (SQLException e) {
			if (e.getErrorCode() == 1) {
				throw new Exception("등록 실패 하셨습니다.");
			} else {
				throw e;
			}
		} finally {
			sql.MyConnection.close(pstmt, con);
		}

	}

	@Override
	public List<Chatting> selectAll() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectAllSQL = "SELECT user_id, posted, message FROM chatting ORDER BY no desc";
		List<Chatting>list = new ArrayList<>();
		
		try {
			con = sql.MyConnection.getConnection();
			pstmt = con.prepareStatement(selectAllSQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new Chatting(
						rs.getString("user_id"),
						 rs.getString("posted"),
						 rs.getString("message")
						 ));
			}

			return list;
		}finally {
			MyConnection.close(rs, pstmt, con);			
		}
	}

}
