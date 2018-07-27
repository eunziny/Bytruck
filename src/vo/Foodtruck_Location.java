package vo;

import java.sql.Date;

public class Foodtruck_Location {
	private int no;
	private String user_id;
	private String title;
	private String opendate;
	private String detail;
	private String latitude;
	private String longtitude;
	private String poweryn;
	private String foodtype;
	private String imgpath;
	
	public Foodtruck_Location() {
		super();
	}
	
	public Foodtruck_Location(int no, String title, String imgpath) {
		super();
		this.no = no;
		this.title = title;
		this.imgpath = imgpath;
	}

	public Foodtruck_Location(String title, String imgpath) {
		super();
		this.title = title;
		this.imgpath = imgpath;
	}

	public Foodtruck_Location(String title, String latitude, String longtitude) {
		super();
		this.title=title;
		this.latitude = latitude;
		this.longtitude = longtitude;
	}
	
	public Foodtruck_Location(int no, String user_id, String title, String opendate, String detail, String latitude,
			String longtitude, String poweryn, String foodtype, String imgpath) {
		super();
		this.no = no;
		this.user_id = user_id;
		this.title = title;
		this.opendate = opendate;
		this.detail = detail;
		this.latitude = latitude;
		this.longtitude = longtitude;
		this.poweryn = poweryn;
		this.foodtype = foodtype;
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


	public String getOpendate() {
		return opendate;
	}


	public void setOpendate(String opendate) {
		this.opendate = opendate;
	}


	public String getDetail() {
		return detail;
	}


	public void setDetail(String detail) {
		this.detail = detail;
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


	public String getPoweryn() {
		return poweryn;
	}


	public void setPoweryn(String poweryn) {
		this.poweryn = poweryn;
	}


	public String getFoodtype() {
		return foodtype;
	}


	public void setFoodtype(String foodtype) {
		this.foodtype = foodtype;
	}


	public String getImgpath() {
		return imgpath;
	}


	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}


	@Override
	public String toString() {
		return "Foodtruck_Location [no=" + no + ", user_id=" + user_id + ", title=" + title + ", opendate=" + opendate
				+ ", detail=" + detail + ", latitude=" + latitude + ", longtitude=" + longtitude + ", poweryn="
				+ poweryn + ", foodtype=" + foodtype + ", imgpath=" + imgpath + "]";
	}
}