package neu.edu.coe.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import neu.edu.coe.model.Address;
import neu.edu.coe.model.Order;
import neu.edu.coe.model.User;

public class OrderMapper implements RowMapper<Order>{

	@Override
	public Order mapRow(ResultSet rs, int rowNum) throws SQLException {
		Order order = new Order();
		order.setOid(rs.getInt("oid"));
		Address address = new Address();
		address.setAddressid(rs.getInt("addressid"));
		order.setAddress(address);
		order.setOrdertime(rs.getDate("ordertime"));
		order.setTotal(rs.getDouble("total"));
		User u = new User();
		u.setUid(rs.getInt("uid"));
		order.setUser(u);
		return order;
	}

}
