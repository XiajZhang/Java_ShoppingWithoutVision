package neu.edu.coe.model;

public class User {
	
	private Integer uid;
	private String username;
	private String password;
	private boolean enabled = false;
	private String authority;
	private String email;
	private String phone;
	
	public User(String username, String password){
		this.username = username;
		this.password = password;
	}
	
	
	public User() {
		super();
	}


	public User(Integer uid, String username, String password, String email, String phone, boolean enabled, String authority) {
		super();
		this.uid = uid;
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.authority = authority;
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
	
	public boolean isEnabled() {
		return enabled;
	}


	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}


	public String getAuthority() {
		return authority;
	}


	public void setAuthority(String authority) {
		this.authority = authority;
	}


	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", password=" + password + ", email="
				+ email + ", phone=" + phone + "]";
	}
	
}
