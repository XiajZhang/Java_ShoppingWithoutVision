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
		// TODO Auto-generated method stub
		Order order = new Order();
		order.setOid(rs.getInt("oid"));
		order.setOrdertime(rs.getDate("ordertime"));
		order.setTotal(rs.getDouble("total"));
		
//		User user = new User();
//		user.setUid(rs.getInt("uid"));
//		
//		Address address = new Address();
//		address.setAddressId(rs.getInt("addressId"));
//		address.setAddress(rs.getString("address"));
//		address.setState(rs.getString("state"));
//		address.setCountry(rs.getString("country"));
//		address.setZipCode(rs.getString("zipCode"));
//		address.setUid(rs.getInt("uid"));
//		address.setReceiver(rs.getString("receiver"));
		
		
		return order;
	}

}
