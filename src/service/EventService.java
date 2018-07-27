package service;

import java.util.List;

import dao.EventDAO;
import dao.EventDAOOracle;
import vo.Event;

public class EventService {
	private EventDAO dao = new EventDAOOracle();

	//이벤트 글쓰기
	public void eventwrite(Event ev) throws Exception {
		dao.insertevent(ev);
	}

	//이벤트 리스트
	public List<Event> findAll() throws Exception {
		return dao.selectAll();
	}

	//풀캘린더 리스트
	public List<Event> findEvent() throws Exception {
		return dao.selectEvent();
	}

	//이벤트 디테일
	public Event findDetail(int bNum) throws Exception {
		return dao.selectDetail(bNum);
	}
	
	public void eventupdate(Event ev) throws Exception {
		dao.update(ev);
	}
}
