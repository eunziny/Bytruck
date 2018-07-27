package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import sql.MyConnection;
import vo.Event;
import vo.Profit;

public class ProfitDAOOracle implements ProfitDAO {

	@Override
	public List<Profit> selectProfit() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectAllSQL = "select price, start_date from profit";
		List<Profit>list = new ArrayList<>();
		try {
			con = sql.MyConnection.getConnection();
			pstmt = con.prepareStatement(selectAllSQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new Profit(
						rs.getInt("price"),
						rs.getDate("start_date")
						));
			} 
			return list;
		}finally {
			MyConnection.close(rs, pstmt, con);
		}
	}
	public static void main(String[] args) {
		ProfitDAOOracle test = new ProfitDAOOracle();
		try {
			List<Profit> list = test.selectProfit();
			System.out.println(list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
