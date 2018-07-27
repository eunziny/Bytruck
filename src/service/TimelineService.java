package service;

import java.util.List;

import dao.TimelineDAO;
import dao.TimelineDAOOracle;
import vo.Chatting;

public class TimelineService {
	private TimelineDAO dao = new TimelineDAOOracle();
	
	public void insertChat(Chatting chatting) throws Exception {
		dao.insertChat(chatting);	
	}

	public List<Chatting> selectAll() throws Exception {
		return dao.selectAll();
	}

}
