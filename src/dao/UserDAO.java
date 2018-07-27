package dao;

import java.util.List;
import vo.Users;

public interface UserDAO {
	void insert(Users u) throws Exception;
	Users selectById(String id) throws Exception;
	String selectTypeById(String id) throws Exception;
	List<Users> selectAll() throws Exception;
	void update(Users u) throws Exception;
	String selectByBusiNum(String busiNumValue) throws Exception;
	void insert2(Users u) throws Exception;
	String selectbyIdTel(String name, String tel) throws Exception;
	String selectbyIdEmail(String name, String email) throws Exception;
	String drop(String idValue) throws Exception;
}
