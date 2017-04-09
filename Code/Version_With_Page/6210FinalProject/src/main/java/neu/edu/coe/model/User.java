package neu.edu.coe.model;

import java.io.IOException;

import javax.persistence.Lob;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

public class User {
	
	private Integer uid;
	private String username;
	private String password;
	private boolean enabled = false;
	private String authority;
	private String email;
	private String phone;
	@Lob 
	private byte[] photoBytes;
	@Transient
	private MultipartFile photo;
	@Transient
	private MultipartFile photoChange;
	
	private String photoContentType; 
	
	private String photoFilename;
	
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
	
	public User(Integer uid, String username, String password, boolean enabled, String authority, String email,
			String phone, byte[] photoBytes, MultipartFile photo, MultipartFile photoChange, String photoContentType,
			String photoFilename) {
		super();
		this.uid = uid;
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.authority = authority;
		this.email = email;
		this.phone = phone;
		this.photoBytes = photoBytes;
		this.photo = photo;
		this.photoChange = photoChange;
		this.photoContentType = photoContentType;
		this.photoFilename = photoFilename;
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
	//photo attribute
	public byte[] getPhotoBytes() {
		return photoBytes;
	}

	public void setPhotoBytes(byte[] photoBytes) {
		this.photoBytes = photoBytes;
	}

	
	public MultipartFile getPhotoChange() {
		return photoChange;
	}

	public void setPhotoChange(MultipartFile photoChange) {
		this.photoChange = photoChange;
	}

	public MultipartFile getPhoto() {
		return photo;
	}

	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
		setPhotoContentType(photo.getContentType());
		setPhotoFilename(photo.getOriginalFilename());
		try {
			setPhotoBytes(photo.getBytes());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public String getPhotoContentType() {
		return photoContentType;
	}
	public void setPhotoContentType(String photoContentType) {
		this.photoContentType = photoContentType;
	}
	public String getPhotoFilename() {
		return photoFilename;
	}
	public void setPhotoFilename(String photoFilename) {
		this.photoFilename = photoFilename;
	}


	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", password=" + password + ", email="
				+ email + ", phone=" + phone + "]";
	}
	
}
