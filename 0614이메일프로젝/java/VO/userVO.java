package VO;

public class userVO {

	private String id;
	private String password;
	private String name;
	// "S" :  관리자, "U" : 일반사용자
	private String email;
	private String address;
	private String phone;
	public userVO() {
	}

	public userVO( String email, String id, String password, String name, String address, String phone) {
		super();
		this.email = email;
		this.id = id;
		this.password = password;
		this.name = name;
		this.address = address;
		this.phone = phone;
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "userVO [id=" + id + ", password=" + password + ", name=" + name + ", email=" + email + ", address="
				+ address + ", phone=" + phone + "]";
	}

	
	
	
}
