package neu.edu.coe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import neu.edu.coe.model.User;

@Component
public class UserDaoImp implements UserDao{


	private DataSource dataSource;
	
	@Autowired
	public void setDataSource(DataSource dataSource){
		this.dataSource = dataSource;
//		this.jdbc = new JdbcTemplate(dataSource);
	}
	@Override
	public void insert(User user) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO USER " +
				"(username, password) VALUES (?, ?)";
//		jdbc.update(sql, user.getUsername(), user.getPassword());
//		System.out.println("Created Record Name = " + user.getUsername() + ", Password = " + user.getPassword());
//		return;
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);

		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {}
			}
		}
		
	}

	@Override
	public User findByUserID(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> getUsers() {
		// TODO Auto-generated method stub
		return null;
	}

//		String sql = "SELECT * FROM USER " +
//				"WHERE username = ?";

//	}
	@Override
	public User findByUserName(String username) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM USER " + 
				"WHERE username = ?";
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			User user = null;
			if (rs.next()) {
				user = new User(
					rs.getInt("uid"),
					rs.getString("username"),
					rs.getString("password"),
					rs.getString("email"),
					rs.getString("phone")
				);
			}
			rs.close();
			ps.close();
			return user;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {}
			}
		}	
	}

}
