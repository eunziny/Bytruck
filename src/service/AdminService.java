package service;

import java.util.List;

import dao.AdminDAO;
import dao.AdminDAOOracle;
import dao.UserDAO;
import dao.userDAOOracle;
import vo.Review;
import vo.Users;

public class AdminService {
	private UserDAO userdao = new userDAOOracle();
	AdminDAO dao = new AdminDAOOracle();
	public List<Users> selectAll() throws Exception{
		return userdao.selectAll();
	}

	public List<Review> findGoodRank() throws Exception {
		return dao.selectGoodRank();
	}
	
	public int[] findUserCount() throws Exception{
		return dao.selectUserConut();
	}
}
