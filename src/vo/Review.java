package vo;

public class Review {
	private int no;
	private String user_id;
	private String trip_date;
	private String title;
	private String detail;
	private String posted;
	private String latitude;
	private String longtitude;
	private int views;
	private int good;
	
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Review(String latitude, String longtitude) {
		super();
		this.latitude = latitude;
		this.longtitude = longtitude;
	}

	//관리자 차트 생성자
	public Review(String user_id, int good) {
		super();
		this.user_id = user_id;
		this.good = good;
	}

	//여행후기 글쓰기 생성자
	public Review(int no, String user_id, String trip_date, String title, String detail, String posted, String latitude,
			String longtitude) {
		super();
		this.no = no;
		this.user_id = user_id;
		this.trip_date = trip_date;
		this.title = title;
		this.detail = detail;
		this.posted = posted;
		this.latitude = latitude;
		this.longtitude = longtitude;
	}

	//여행후기 리스트 생성자
	public Review(int no, String user_id, String title, String posted) {
		super();
		this.no = no;
		this.user_id = user_id;
		this.title = title;
		this.posted = posted;
	}
	
	
	
	//여행후기 디테일 생성자
	public Review(int no, String user_id, String trip_date, String title, String detail, String posted, int views,
	         int good) {
	      super();
	      this.no = no;
	      this.user_id = user_id;
	      this.trip_date = trip_date;
	      this.title = title;
	      this.detail = detail;
	      this.posted = posted;
	      this.views = views;
	      this.good = good;
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

	public String getTrip_date() {
		return trip_date;
	}

	public void setTrip_date(String trip_date) {
		this.trip_date = trip_date;
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

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongtitude() {
		return longtitude;
	}

	public void setLongtitude(String longtitude) {
		this.longtitude = longtitude;
	}
	

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getGood() {
		return good;
	}

	public void setGood(int good) {
		this.good = good;
	}

	@Override
	public String toString() {
		return "Review [no=" + no + ", user_id=" + user_id + ", trip_date=" + trip_date + ", title=" + title
				+ ", detail=" + detail + ", posted=" + posted + ", latitude=" + latitude + ", longtitude=" + longtitude
				+ ", views=" + views + ", good=" + good + "]";
	}

}
