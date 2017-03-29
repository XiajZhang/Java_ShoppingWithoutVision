package neu.edu.coe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import neu.edu.coe.model.User;

@Component
public class UserDaoImp implements UserDao{

//	private JdbcTemplate jdbc;
//	
//	@Autowired
//	public void setJdbc(DataSource jdbc) {
//		this.jdbc = new JdbcTemplate(jdbc);
//	}

	private DataSource dataSource;
	
	@Autowired
	public void setDataSource(DataSource dataSource){
		this.dataSource = dataSource;
	}
	@Override
	public void insert(User user) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO USER " +
				"(username, password) VALUES (?, ?)";
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

}
