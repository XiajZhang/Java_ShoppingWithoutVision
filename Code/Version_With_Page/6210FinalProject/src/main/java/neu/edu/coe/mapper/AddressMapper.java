package neu.edu.coe.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import neu.edu.coe.model.Address;

public class AddressMapper implements RowMapper<Address> {

	@Override
	public Address mapRow(ResultSet rs, int rowNum) throws SQLException {
		Address address = new Address();
		address.setAddressid(rs.getInt("addressid"));
		address.setAddress(rs.getString("address"));
		address.setState(rs.getString("state"));
		address.setCountry(rs.getString("country"));
		address.setZipCode(rs.getString("zipCode"));
		address.setReceiver(rs.getString("receiver"));
		return address;
	}
}
