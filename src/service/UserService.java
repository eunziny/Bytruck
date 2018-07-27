package service;

import java.sql.Connection;
import java.sql.PreparedStatement;

import dao.UserDAO;
import dao.userDAOOracle;
import sql.MyConnection;
import vo.Users;

public class UserService {
	private UserDAO dao = new userDAOOracle();

	public String login(String id, String pwd) throws Exception {//로그인메소드
		Users u = dao.selectById(id);
		if (u != null) { // 아이디가 있는 경우
			if (u.getUser_pwd().equals(pwd)) {// 비밀번호일치
				return "1";// 유저정보 리턴시키기
			}
		}
		return "-1";
	}

	public String searchtype(String id) throws Exception {//로그인후 회원타입별 헤더 변경하기위한 메소드
		String type = dao.selectTypeById(id);
		return type;
	}
	
	public String dupChk(String id) throws Exception{
		Users c =  dao.selectById(id);
		if(c==null) {
			return "1"; 	//아이디가 없는경우(회원가입 가능)
		}else {
			return "-1";	//이미 존재하는 아이디(회원가입 불가능!)
		}
	}
	
	public void signup(Users u) throws Exception{
		dao.insert(u);
	}

	public String dupChkBusi(String busiNumValue) throws Exception {
		String c =  dao.selectByBusiNum(busiNumValue);
		if(c==null) {
			return "1"; 	//사업자 번호가 없는 경우(회원가입 가능)
		}else {
			return "-1";	//이미 존재하는 사업자 번호(회원가입 불가능!)
		}
	}

	public void signup2(Users u) throws Exception {
		dao.insert2(u);
	}

	public String findIdbyTel(String name, String tel) throws Exception {
		String id = dao.selectbyIdTel(name, tel);
		if(id==null) {
			return "-1";
		}else {
			return id;
		}
	}

	public String findIdbyEmail(String name, String email) throws Exception {
		String id = dao.selectbyIdEmail(name, email);
		
		if(id==null) {
			return "-1";
		}else {
			return id;
		}
	}

	public Users finduser(String idValue) throws Exception {
		Users u = dao.selectById(idValue);
		
		if (u != null) {//회원이 존재할 경우
			return u;
		}
		return null;
	}

	public String userdrop(String idValue) throws Exception {//탈퇴
		String dropResult = dao.drop(idValue);
		if(dropResult == "1") {//탈퇴성공
			return "1";
		}else {
			return "-1";
		}
	}

	public void update(Users user) throws Exception {
		dao.update(user);
	}
}
