package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sun.org.apache.xerces.internal.util.SynchronizedSymbolTable;

import sql.MyConnection;
import vo.Chatting;
import vo.Users;

public class userDAOOracle implements UserDAO {

	@Override
	public void insert(Users u) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = sql.MyConnection.getConnection();
			String insertSQL = "INSERT INTO users(user_id, user_pwd, name, birthday, phone_number, email, type) VALUES (?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(insertSQL);
			pstmt.setString(1, u.getUser_id());
			pstmt.setString(2, u.getUser_pwd());
			pstmt.setString(3, u.getName());
			pstmt.setString(4, u.getBirthday());
			pstmt.setString(5, u.getPhone_number());
			pstmt.setString(6, u.getEmail());
			pstmt.setString(7, u.getType());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			if (e.getErrorCode() == 1) {
				throw new Exception("이미 사용중인 아이디입니다");
			} else {
				throw e;
			}
		} finally {
			sql.MyConnection.close(pstmt, con);
		}
	}
	
	@Override
	public void insert2(Users u) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = sql.MyConnection.getConnection();
			String insertSQL = "INSERT INTO users(user_id, user_pwd, name, birthday, phone_number, email, bussiness_number, type) VALUES (?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(insertSQL);
			pstmt.setString(1, u.getUser_id());
			pstmt.setString(2, u.getUser_pwd());
			pstmt.setString(3, u.getName());
			pstmt.setString(4, u.getBirthday());
			pstmt.setString(5, u.getPhone_number());
			pstmt.setString(6, u.getEmail());
			pstmt.setString(7,  u.getBussiness_number());
			pstmt.setString(8, u.getType());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			if (e.getErrorCode() == 1) {
				throw new Exception("이미 사용중인 아이디입니다");
			} else {
				throw e;
			}
		} finally {
			sql.MyConnection.close(pstmt, con);
		}
	}

	@Override
	public Users selectById(String id) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = sql.MyConnection.getConnection();
			String loginSQL = "SELECT user_id, user_pwd, name, birthday, phone_number, email, nvl(bussiness_number,'X') bnum, type FROM users WHERE user_id=? and useryn='y'";
			pstmt = con.prepareStatement(loginSQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (!rs.next()) { // 아이디가 없는경우
				return null;
			} else {
				return new Users(id, rs.getString("user_pwd"), rs.getString("name"), rs.getString("birthday"),
						rs.getString("phone_number"), rs.getString("email"), rs.getString("bnum"),
						rs.getString("type"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			sql.MyConnection.close(rs, pstmt, con);
		}
	}

	@Override
	public List<Users> selectAll() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectAllSQL = "SELECT user_id, user_pwd, name, birthday, phone_number, email, nvl(bussiness_number,'X') bnum, type FROM users WHERE useryn='y' ORDER BY type asc";
		List<Users> list = new ArrayList<>();
		
		try {
			con = sql.MyConnection.getConnection();
			pstmt = con.prepareStatement(selectAllSQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new Users(
						rs.getString("user_id"),
						rs.getString("user_pwd"),
						 rs.getString("name"),
						 rs.getString("birthday"),
						 rs.getString("phone_number"),
						 rs.getString("email"),
						 rs.getString("bnum"),
						 rs.getString("type")
						 ));
			}

			return list;
		}finally {
			MyConnection.close(rs, pstmt, con);			
		}
	}

	@Override
	public void update(Users u) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String updateSQL = "UPDATE users SET user_pwd=?, email=?, phone_number=? WHERE user_id=?";
		try {
			con = sql.MyConnection.getConnection();
			pstmt = con.prepareStatement(updateSQL);
			pstmt.setString(1, u.getUser_pwd());
			pstmt.setString(2, u.getEmail());
			pstmt.setString(3, u.getPhone_number());
			pstmt.setString(4, u.getUser_id());
			pstmt.executeUpdate();
		}finally {
			MyConnection.close(pstmt, con);			
		}
	}

	@Override
	public String selectTypeById(String id) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = sql.MyConnection.getConnection();
			String loginTypeSQL = "SELECT type FROM users WHERE user_id=?";
			pstmt = con.prepareStatement(loginTypeSQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (!rs.next()) { // 아이디가 없는경우
				return null;
			} else {
				return rs.getString("type");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			sql.MyConnection.close(rs, pstmt, con);
		}
	}
	
	@Override
	public String selectByBusiNum(String busiNumValue) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = sql.MyConnection.getConnection();
			String checkBusiNumSQL = "SELECT user_id FROM users WHERE bussiness_number=?";
			pstmt = con.prepareStatement(checkBusiNumSQL);
			pstmt.setString(1, busiNumValue);
			rs = pstmt.executeQuery();
			if (!rs.next()) { // 없는경우
				//System.out.println("no businum ");
				return null;
			} else {
				System.out.println("already businum");
				return rs.getString("user_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			sql.MyConnection.close(rs, pstmt, con);
		}
	}
	@Override
	public String selectbyIdTel(String name, String tel)throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = sql.MyConnection.getConnection();
			String findidSQL = "SELECT user_id FROM users WHERE name=? and phone_number=? and useryn='y'";
			pstmt = con.prepareStatement(findidSQL);
			pstmt.setString(1, name);
			pstmt.setString(2, tel);
			rs = pstmt.executeQuery();
			if (!rs.next()) { // 없는경우
				return null;
			} else {
				return rs.getString("user_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			sql.MyConnection.close(rs, pstmt, con);
		}
	}
	
	@Override
	public String selectbyIdEmail(String name, String email) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = sql.MyConnection.getConnection();
			String findidSQL = "SELECT user_id FROM users WHERE name=? and email=? and useryn='y'";
			pstmt = con.prepareStatement(findidSQL);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			System.out.println("daoOracle()");
			if (!rs.next()) { // 없는경우
				return null;
			} else {
				return rs.getString("user_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			sql.MyConnection.close(rs, pstmt, con);
		}
	}
	
	@Override
	public String drop(String idValue) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = sql.MyConnection.getConnection();
			String dropSQL = "UPDATE users SET useryn='n' where user_id=?";
			pstmt = con.prepareStatement(dropSQL);
			pstmt.setString(1, idValue);
			pstmt.executeUpdate();
			return "1";
		} catch (SQLException e) {
			if (e.getErrorCode() == 1) {
				throw new Exception("탈퇴실패했습니다.");
			} else {
				throw e;
			}
		} finally {
			sql.MyConnection.close(pstmt, con);
		}
	}
}
