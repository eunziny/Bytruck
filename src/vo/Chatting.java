package vo;

public class Chatting {
	private int no;
	private String posted;
	private String user_id;
	private String message;
	
	public Chatting() {
		super();
	}

	
	public Chatting(String user_id, String message) {
		super();
		this.user_id = user_id;
		this.message = message;
	}


	public Chatting(String user_id, String posted, String message) {
		super();
		this.posted = posted;
		this.user_id = user_id;
		this.message = message;
	}


	public Chatting(int no, String posted, String user_id, String message) {
		super();
		this.no = no;
		this.posted = posted;
		this.user_id = user_id;
		this.message = message;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
