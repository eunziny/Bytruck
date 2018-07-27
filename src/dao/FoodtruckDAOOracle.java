package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sql.MyConnection;
import vo.Foodtruck;
import vo.Foodtruck_Location;
import vo.Users;

public class FoodtruckDAOOracle implements FoodtruckDAO {

	@Override
	public void insertfoodtruck(Foodtruck_Location fc) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String insertSQL = "insert into foodtruck_location(no, user_id, title, opendate, detail, latitude, longtitude, poweryn, foodtype, imgpath) "
				+ "values(foodtruck_no_seq.nextval, ?, ?, to_char(to_date(?, 'yyyy-mm-dd'), 'yyyy-mm-dd'), ?, ?, ?, ?, ?, ?)";
		try {
			con = sql.MyConnection.getConnection();
			pstmt = con.prepareStatement(insertSQL);
			pstmt.setString(1, fc.getUser_id());
			pstmt.setString(2, fc.getTitle());
			pstmt.setString(3, fc.getOpendate());
			pstmt.setString(4, fc.getDetail());
			pstmt.setString(5, fc.getLongtitude());
			pstmt.setString(6, fc.getLatitude());
			pstmt.setString(7, fc.getPoweryn());
			pstmt.setString(8, fc.getFoodtype());
			pstmt.setString(9, fc.getImgpath());
						
			pstmt.executeUpdate();
		}finally {
			MyConnection.close(pstmt, con);			
		}
	}
	
	@Override
	public void insert(Foodtruck ft) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = sql.MyConnection.getConnection();
			String insertSQL = "INSERT INTO foodtruck(user_id, bussiness_name, menu_name, price, menu_type, detail) VALUES (?,?,?,?,?,?)";
			pstmt = con.prepareStatement(insertSQL);
			pstmt.setString(1, ft.getUser_id());
			pstmt.setString(2, ft.getBussiness_name());
			pstmt.setString(3, ft.getMenu_name());
			pstmt.setInt(4, ft.getPrice());
			pstmt.setString(5, ft.getMenu_type());
			pstmt.setString(6, ft.getDetail());
			
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
	public Foodtruck selectById(String id) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = sql.MyConnection.getConnection();
			String infoSQL = "SELECT user_id, bussiness_name, menu_name, price, menu_type, detail FROM foodtruck WHERE user_id=?";
			pstmt = con.prepareStatement(infoSQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (!rs.next()) { // 아이디가 없는경우
				return null;
			} else {
				return new Foodtruck(id, rs.getString("bussiness_name"), rs.getString("menu_name"), rs.getInt("price"),
						rs.getString("menu_type"), rs.getString("detail"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			sql.MyConnection.close(rs, pstmt, con);
		}
	}

	@Override
	public void update(Foodtruck ft) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String updateSQL = "UPDATE foodtruck SET bussiness_name=?, menu_name=?, price=?, menu_type=?, detail=? WHERE user_id=?";
		try {
			con = sql.MyConnection.getConnection();
			pstmt = con.prepareStatement(updateSQL);
			pstmt.setString(1, ft.getBussiness_name());
			pstmt.setString(2, ft.getMenu_name());
			pstmt.setInt(3, ft.getPrice());
			pstmt.setString(4, ft.getMenu_type());
			pstmt.setString(5, ft.getDetail());
			pstmt.setString(6,  ft.getUser_id());
			pstmt.executeUpdate();
		}finally {
			MyConnection.close(pstmt, con);			
		}
	}

	@Override
	public List<Foodtruck_Location> selectAll() throws Exception {

		return null;
	}

	@Override
	public List<Foodtruck_Location> selectByType(String type) throws Exception {
		List<Foodtruck_Location> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = sql.MyConnection.getConnection();
			String selectByTypeSQL = 
					"SELECT title, imgpath, no"
					+ " FROM Foodtruck_Location"
					+ " WHERE foodtype = ?"
					+ " ORDER BY no desc";
			pstmt = con.prepareStatement(selectByTypeSQL);
			pstmt.setString(1, type);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new Foodtruck_Location(
						rs.getInt("no"),
						rs.getString("title"),
						rs.getString("imgpath")));
			}
		}finally {
			MyConnection.close(rs, pstmt, con);
		}
		return list;
	}

	@Override
	public Foodtruck_Location selectDetail(int fNum) throws Exception {
		  Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      Foodtruck_Location f = new Foodtruck_Location();
	      try {
	         con = sql.MyConnection.getConnection();
	         String selectByTypeSQL = "SELECT *" 
	                           + " FROM Foodtruck_Location" 
	                           + " WHERE no = ?";
	         pstmt = con.prepareStatement(selectByTypeSQL);
	         pstmt.setInt(1, fNum);
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	            f = new Foodtruck_Location(
	                  rs.getInt("no"), 
	                  rs.getString("user_id"), 
	                  rs.getString("title"),
	                  rs.getString("opendate"), 
	                  rs.getString("detail"),
	                  rs.getString("latitude"),
	                  rs.getString("longtitude"),
	             	  rs.getString("poweryn"),
	                  rs.getString("foodtype"), 
	                  rs.getString("imgpath"));
	         }
	      } finally {
	         MyConnection.close(rs, pstmt, con);
	      }
	      return f;
	}
	public static void main(String[] args) {
		FoodtruckDAOOracle test = new FoodtruckDAOOracle(); 
			String type = "drink";
			try {
				List<Foodtruck_Location> list = test.selectByType(type);
				for (Foodtruck_Location f : list) {
					System.out.println(f);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
		}	
	}

	@Override
	public void foodtruckBoardUpdate(Foodtruck_Location fc) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String updateSQL = "UPDATE foodtruck_location SET title=?, opendate=?, detail=?, latitude=?, longtitude=?, poweryn=?, foodtype=?, imgpath=? WHERE user_id=? and no=?";
		try {
			con = sql.MyConnection.getConnection();
			pstmt = con.prepareStatement(updateSQL);
			pstmt.setString(1, fc.getTitle());
			pstmt.setString(2, fc.getOpendate());
			pstmt.setString(3, fc.getDetail());
			pstmt.setString(4, fc.getLongtitude());
			pstmt.setString(5, fc.getLatitude());
			pstmt.setString(6,  fc.getPoweryn());
			pstmt.setString(7,  fc.getFoodtype());
			pstmt.setString(8,  fc.getImgpath());
			pstmt.setString(9,  fc.getUser_id());
			pstmt.setInt(10,  fc.getNo());
			pstmt.executeUpdate();
		}finally {
			MyConnection.close(pstmt, con);			
		}
	}
	
	@Override
	public List<Foodtruck_Location> selectlocation(int fNum) throws Exception {
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      List<Foodtruck_Location> list = new ArrayList<Foodtruck_Location>();
      try {
      con = sql.MyConnection.getConnection();
      String selectByTypeSQL = "SELECT *" 
                        + " FROM Foodtruck_Location" 
                        + " WHERE no = ?";
      
      pstmt = con.prepareStatement(selectByTypeSQL);
      pstmt.setInt(1, fNum);
      rs = pstmt.executeQuery();
      
      while(rs.next()) {
    	  list.add(new Foodtruck_Location(
    			  rs.getInt("no"), 
                  rs.getString("user_id"), 
                  rs.getString("title"),
                  rs.getString("opendate"), 
                  rs.getString("detail"),
                  rs.getString("latitude"),
                  rs.getString("longtitude"),
             	  rs.getString("poweryn"),
                  rs.getString("foodtype"), 
                  rs.getString("imgpath")
    			  ));
      }
      return list;
	}
	finally {
        MyConnection.close(rs, pstmt, con); 	
	}
	}
}
