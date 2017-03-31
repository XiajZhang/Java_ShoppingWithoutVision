package neu.edu.coe.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import neu.edu.coe.mapper.UserMapper;
import neu.edu.coe.model.User;

@Component
public class UserDaoImp implements UserDao{

	private JdbcTemplate jdbc;
	
	private DataSource dataSource;
	
	@Autowired
	public void setDataSource(DataSource dataSource){
		this.dataSource = dataSource;
		this.jdbc = new JdbcTemplate(dataSource);
	}
	@Override
	public void insert(User user) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO USER " +
				"(username, password) VALUES (?, ?)";
		jdbc.update(sql, user.getUsername(), user.getPassword());
		System.out.println("Created Record Name = " + user.getUsername() + ", Password = " + user.getPassword());
		return;
	}

	@Override
	public User findByUserID(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> getUsers() {
		String sql = "SELECT * FROM USER";
	    List <User> users = jdbc.query(sql, new UserMapper());
	    return users;
	}

	@Override
	public User findByUserName(String username) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM USER " + 
				"WHERE username = ?";
		User user = jdbc.queryForObject(sql, new Object[]{username}, new UserMapper());
		return user;
	}
	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		String sql = "UPDATE USER SET email = ?, phone = ?, password = ? WHERE uid = ?";
		jdbc.update(sql, user.getEmail(), user.getPhone(), user.getPassword(), user.getUid());
	}

}
