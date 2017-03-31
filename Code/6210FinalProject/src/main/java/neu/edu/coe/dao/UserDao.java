package neu.edu.coe.dao;

import java.util.List;

import neu.edu.coe.model.User;

public interface UserDao {
	
	public void insert(User user);
	
	public User findByUserID(int userId);
	
	public List<User> getUsers();
	
	public User findByUserName(String username);
	

}
