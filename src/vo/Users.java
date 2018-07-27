package vo;

public class Users {
	private String user_id;
	private String user_pwd;
	private String name;
	private String birthday;
	private String phone_number;
	private String email;
	private String bussiness_number;
	private String type;
	
	public Users() {
		super();
	}

	public Users(String user_id, String user_pwd, String name, String birthday, String phone_number, String email,
			String type) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.name = name;
		this.birthday = birthday;
		this.phone_number = phone_number;
		this.email = email;
		this.type = type;
	}
	
	public Users(String user_id, String user_pwd, String name, String birthday, String phone_number, String email,
			String bussiness_number, String type) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.name = name;
		this.birthday = birthday;
		this.phone_number = phone_number;
		this.email = email;
		this.bussiness_number = bussiness_number;
		this.type = type;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBussiness_number() {
		return bussiness_number;
	}

	public void setBussiness_number(String bussiness_number) {
		this.bussiness_number = bussiness_number;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}