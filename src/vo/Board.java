package vo;

import java.util.Date;

public class Board {
	private int no;
	private int type;
	private String title;
	private String detail;
	private String  posted;
	private String user_id;
	private int views;
	private int level;
	private int parent;
	

	public Board() {
		super();
	}
	
	
	//은진 공지사항 리스트
	public Board(int no, String title, String posted, String user_id) {
		super();
		this.no = no;
		this.title = title;
		this.posted = posted;
		this.user_id = user_id;
	}



	public Board(int no, String title, String posted, int views) {
		super();
		this.no = no;
		this.title = title;
		this.posted = posted;
		this.views = views;
	}	
	
	public Board(int no, int type, String title, String posted, int views) {
		super();
		this.no = no;
		this.type = type;
		this.title = title;
		this.posted = posted;
		this.views = views;
	}
	
	public Board(int no, int type, String title, String detail, String posted) {
		super();
		this.no = no;
		this.type = type;
		this.title = title;
		this.detail = detail;
		this.posted = posted;
	}
	
	public Board(int no, int type, String title, String detail, String posted, String user_id, int views) {
		super();
		this.no = no;
		this.type = type;
		this.title = title;
		this.detail = detail;
		this.posted = posted;
		this.user_id = user_id;
		this.views = views;
	}
	
	public Board(int no, int parent, int type, String title, String detail, String user_id, int views, String posted, int level) {
		super();
		this.no = no;
		this.parent = parent;
		this.type = type;
		this.title = title;
		this.detail = detail;
		this.user_id = user_id;
		this.views = views;
		this.posted = posted;
		this.level = level;
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
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	
	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}
	@Override
	public String toString() {
		return "board [no=" + no + ", type=" + type + ", title=" + title + ", detail=" + detail + ", posted=" + posted
				+ "]";
	}
	
}
