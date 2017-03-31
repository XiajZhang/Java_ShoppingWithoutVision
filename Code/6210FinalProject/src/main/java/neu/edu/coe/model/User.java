package neu.edu.coe.model;

public class User {
	
	private Integer uid;
	private String username;
	private String password;
	private String email;
	private String phone;
	
	public User(String username, String password){
		this.username = username;
		this.password = password;
	}
	
	
	public User() {
		super();
	}


	public User(Integer uid, String username, String password, String email, String phone) {
		super();
		this.uid = uid;
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone = phone;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", password=" + password + ", email="
				+ email + ", phone=" + phone + "]";
	}
	
}
