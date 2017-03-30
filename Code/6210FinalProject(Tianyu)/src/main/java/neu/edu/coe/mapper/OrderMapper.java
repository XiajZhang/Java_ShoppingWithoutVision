package neu.edu.coe.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import neu.edu.coe.model.Order;

public class OrderMapper implements RowMapper<Order>{
	
	@Override
	public Order mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		Order order = new Order();
		order.setOid(rs.getInt("oid"));
		order.setOrdertime(rs.getString("username"));
		order.setEmail(rs.getString("email"));
		order.setPassword(rs.getString("password"));
		order.setPhone(rs.getString("phone"));	
		return order;
	}

}
