package vo;

import java.util.Date;

public class Profit {
	private int ad_id;
	private String type;
	private int price;
	private Date start_date;
	private Date end_date;
	private String detail;
	private String bussiness_name;

	public Profit() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Profit(int ad_id, String type, int price, Date start_date, Date end_date, String detail,
			String bussiness_name) {
		super();
		this.ad_id = ad_id;
		this.type = type;
		this.price = price;
		this.start_date = start_date;
		this.end_date = end_date;
		this.detail = detail;
		this.bussiness_name = bussiness_name;
	}

	public Profit(int price, Date start_date) {
		super();
		this.price = price;
		this.start_date = start_date;
	}

	public int getAd_id() {
		return ad_id;
	}

	public void setAd_id(int ad_id) {
		this.ad_id = ad_id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getBussiness_name() {
		return bussiness_name;
	}

	public void setBussiness_name(String bussiness_name) {
		this.bussiness_name = bussiness_name;
	}

	@Override
	public String toString() {
		return "Profit [ad_id=" + ad_id + ", type=" + type + ", price=" + price + ", start_date=" + start_date
				+ ", end_date=" + end_date + ", detail=" + detail + ", bussiness_name=" + bussiness_name + "]";
	}
}
