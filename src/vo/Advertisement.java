package vo;

import java.util.Date;

public class Advertisement {
	private String user_id;
	private int no;
	private int type;
	private Date start_date;
	private Date end_date;
	private String title;
	private String detail;
	private String posted;
	
	public Advertisement() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public Advertisement( int no, String user_id, String title) {
		super();
		this.user_id = user_id;
		this.no = no;
		this.title = title;
	}


	public Advertisement(int no, String title, String user_id,  String detail) {
		super();
		this.user_id = user_id;
		this.no = no;
		this.title = title;
		this.detail = detail;
	}


	public Advertisement(String user_id, int no, String title, String posted) {
		super();
		this.user_id = user_id;
		this.no = no;
		this.title = title;
		this.posted = posted;
	}

	public Advertisement(String user_id, int no, String title, String detail, String posted) {
		super();
		this.user_id = user_id;
		this.no = no;
		this.title = title;
		this.detail = detail;
		this.posted = posted;
	}
	
	public Advertisement(String user_id, int no, int type, Date start_date, Date end_date, String title, String detail) {
		super();
		this.user_id = user_id;
		this.no = no;
		this.type = type;
		this.start_date = start_date;
		this.end_date = end_date;
		this.title = title;
		this.detail = detail;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
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

	public String getPosted() {
		return posted;
	}

	public void setPosted(String posted) {
		this.posted = posted;
	}

	@Override
	public String toString() {
		return "Advertisement [user_id=" + user_id + ", no=" + no + ", title=" + title + ", detail=" + detail
				+ ", posted=" + posted + "]";
	}
	
}
