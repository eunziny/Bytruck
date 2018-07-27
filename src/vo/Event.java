package vo;

import java.sql.Date;

public class Event {
	private int no;
	private String user_id;
	private String title;
	private String detail;
	private String event_date;
	private String imgpath;
	private Date date;
	
	public Event() {
		super();
		// TODO Auto-generated constructor stub
	}

	//풀캘린더 생성자
    public Event(int no, String user_id, String title, String detail, Date date) {
	      super();
	      this.no = no;
	      this.user_id = user_id;
	      this.title = title;
	      this.detail = detail;
	      this.date = date;
	}
    
    //이벤트 디테일 생성자
    public Event(int no, String user_id, String title, String detail, String event_date, String imgpath) {
	      super();
	      this.no = no;
	      this.user_id = user_id;
	      this.title = title;
	      this.detail = detail;
	      this.event_date = event_date;
	      this.imgpath = imgpath;
	   }
	
	
	//이벤트 리스트 생성자
	public Event(int no, String title, String imgpath) {
		super();
		this.no = no;
		this.title = title;
		this.imgpath = imgpath;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getEvent_date() {
		return event_date;
	}

	public void setEvent_date(String event_date) {
		this.event_date = event_date;
	}

	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Event [no=" + no + ", user_id=" + user_id + ", title=" + title + ", detail=" + detail + ", event_date="
				+ event_date + ", imgpath=" + imgpath + "]";
	}

	
	
	

}
