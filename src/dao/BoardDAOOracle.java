package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sql.MyConnection;
import vo.Board;

public class BoardDAOOracle implements BoardDAO {

	@Override
	public void insertboard(Board board) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String insertSQL = "insert into board(no, type, title, detail, posted, user_id) values(board_no_seq.nextval, ?, ?, ?, sysdate, ?)";
		try {
			con = sql.MyConnection.getConnection();
			pstmt = con.prepareStatement(insertSQL);
			pstmt.setInt(1, board.getType());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getDetail());
			pstmt.setString(4, board.getUser_id());
			pstmt.executeUpdate();
		}finally {
			MyConnection.close(pstmt, con);			
		}
	}

	@Override
	public int selectCount() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectCountSQL = "SELECT COUNT(*) totalcnt" 
								+ " FROM board" 
							     + " WHERE type= 0";
		try {
			con = sql.MyConnection.getConnection();
			pstmt = con.prepareStatement(selectCountSQL);
			rs = pstmt.executeQuery();
			rs.next();
			int totalCount = rs.getInt("totalCnt");
			return totalCount;
		} finally {
			MyConnection.close(rs, pstmt, con);
		}
	}
	
	 @Override
	   public Board selectDetail(int boardNo,int btype) throws Exception {
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      Board b = null;
	      String selectDetailSQL = "SELECT no, type, title, detail, posted"
	                        +" FROM board"
	                        +" WHERE no = ? and type=?";
	      try {
	         con = sql.MyConnection.getConnection();
	         pstmt = con.prepareStatement(selectDetailSQL);
	         pstmt.setInt(1,boardNo);
	         pstmt.setInt(2, btype);
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	            int no = boardNo;
	            int t = btype;
	            String title = rs.getString("title");
	            String detail = rs.getString("detail");
	            String pdate = rs.getString("posted");
	            b = new Board(no, t, title, detail, pdate);
	         }
	      } finally {
	         MyConnection.close(rs, pstmt, con);
	      }
	      return b;
	   }
	
	public static void main(String[] args) {
		BoardDAOOracle test = new BoardDAOOracle();
		int page=1;
		int boardNo = 2;
		try {
			List<Board>list = test.selectAll(page);
			for(Board b:list) {
				System.out.println(b);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	public void deleteBoard(int boardNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//System.out.println(boardNum);
		try {
			con = sql.MyConnection.getConnection();
			String sql = "delete from board\r\n" + 
					"where no = ? and type = 0";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			pstmt.executeQuery();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			MyConnection.close(rs, pstmt, con);
		}		
	}

	@Override
	public void updateboard(Board board) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String insertSQL = "UPDATE board SET title=?, detail=? WHERE type=0 AND no=?";
		try {
			con = sql.MyConnection.getConnection();
			pstmt = con.prepareStatement(insertSQL);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getDetail());
			pstmt.setInt(3, board.getNo());
			pstmt.executeUpdate();
		}finally {
			MyConnection.close(pstmt, con);			
		}
	}
	
	public List<Board> selectAll(int type) throws Exception {
		List<Board> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = sql.MyConnection.getConnection();
			String selectAllSQL =
					"SELECT no, title, posted, user_id "
					+ " FROM Board"
					+ " WHERE type = ?"		
					+ " ORDER BY no desc";
			pstmt = con.prepareStatement(selectAllSQL);
			pstmt.setInt(1, type);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new Board(
					rs.getInt("no"),
					rs.getString("title"),
					rs.getString("posted"),
					rs.getString("user_id")));
			}
		} finally {
			MyConnection.close(rs, pstmt, con);
		}
		return list;
	}
	
	@Override
	public List<Board> selectByTitle(String content, int type) throws Exception {
		List<Board> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = sql.MyConnection.getConnection();
			String selectByTitleSQL = 
			"SELECT no, title, posted, user_id "
			+ " FROM Board"
			+ " WHERE title "
			+ " LIKE ?"
			+ " AND TYPE = ?"
			+ " ORDER BY no desc";
			pstmt = con.prepareStatement(selectByTitleSQL);
			pstmt.setString(1, "%"+ content +"%");
			pstmt.setInt(2, type);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new Board(
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
	public List<Board> selectByDetail(String content, int type) throws Exception {
		List<Board> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = sql.MyConnection.getConnection();
			String selectByDetailSQL = 
			"SELECT no, title, posted, user_id "
			+ " FROM Board"
			+ " WHERE detail "
			+ " LIKE ?"
			+ " AND TYPE = ?"
			+ " ORDER BY no desc";
			pstmt = con.prepareStatement(selectByDetailSQL);
			pstmt.setString(1, "%"+ content +"%");
			pstmt.setInt(2, type);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new Board(
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