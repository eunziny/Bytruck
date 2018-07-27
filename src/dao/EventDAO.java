package dao;

import java.util.List;

import vo.Event;

public interface EventDAO {
	public void insertevent(Event ev) throws Exception;
	public List<Event> selectAll() throws Exception;
	public Event selectDetail(int bNum) throws Exception;
	public List<Event>selectEvent() throws Exception;
	public void update(Event ev) throws Exception;
}
