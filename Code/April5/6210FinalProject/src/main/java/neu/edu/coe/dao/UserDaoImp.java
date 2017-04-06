package neu.edu.coe.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Component;

import neu.edu.coe.mapper.UserMapper;
import neu.edu.coe.model.User;

@Component
public class UserDaoImp implements UserDao {

	private JdbcTemplate jdbc;

	private DataSource dataSource;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbc = new JdbcTemplate(dataSource);
	}

	@Override
	public void insert(User user) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO USER " + "(username, password) VALUES (?, ?)";
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
		List<User> users = jdbc.query(sql, new UserMapper());
		return users;
	}

	@Override
	public User findByUserName(String username) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM USER " + "WHERE username = ?";
		User user = jdbc.query(sql, new Object[] {username}, new ResultSetExtractor<User>() {
			
			public User extractData(ResultSet rs) throws SQLException, DataAccessException {

				User user = null;
				while (rs.next()) {
					user = new User();
					user.setUid(rs.getInt(1));
					user.setUsername(rs.getString(2));
					user.setPassword(rs.getString(3));
					user.setEmail(rs.getString(4));
					user.setPhone(rs.getString(5));
					user.setEnabled(rs.getBoolean(6));
					user.setAuthority(rs.getString(7));
				}
				return user;
			}
		});
		return user;
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		String sql = "UPDATE USER SET email = ?, phone = ?, password = ? WHERE uid = ?";
		jdbc.update(sql, user.getEmail(), user.getPhone(), user.getPassword(), user.getUid());
	}

	@Override
	public void deleteUser(int userId) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM USER WHERE uid=?";
		jdbc.update(sql, userId);
	}

}
