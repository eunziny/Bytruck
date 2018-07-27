package dao;

import java.util.List;

import vo.Chatting;

public interface TimelineDAO {
	void insertChat(Chatting chatting) throws Exception;
	List<Chatting> selectAll() throws Exception;
}
