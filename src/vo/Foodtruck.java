package vo;

public class Foodtruck {
	private String user_id;
	private String bussiness_name;
	private String menu_name;
	private int price;
	private String menu_type;
	private String detail;

	public Foodtruck() {
		super();
	}

	public Foodtruck(String user_id, String bussiness_name, String menu_name, int price, String ptype, String detail) {
		super();
		this.user_id = user_id;
		this.bussiness_name = bussiness_name;
		this.menu_name = menu_name;
		this.price = price;
		this.menu_type = ptype;
		this.detail = detail;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getBussiness_name() {
		return bussiness_name;
	}

	public void setBussiness_name(String bussiness_name) {
		this.bussiness_name = bussiness_name;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getMenu_type() {
		return menu_type;
	}

	public void setMenu_type(String menu_type) {
		this.menu_type = menu_type;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}
}
