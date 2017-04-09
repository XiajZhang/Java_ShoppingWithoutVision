package neu.edu.coe.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import neu.edu.coe.mapper.AddressMapper;
import neu.edu.coe.mapper.ProductMapper;
import neu.edu.coe.model.Address;
import neu.edu.coe.model.Product;

public class AddressDaoImp implements AddressDao {
	private DataSource dataSource;
	private JdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbc = new JdbcTemplate(dataSource);
	}
	
	@Override
	public void create(Address address) {
		String sql = "INSERT INTO address" + "(address, state, country, zipCode, receiver, uid) VALUES (?, ?, ?, ?, ?, ?)";
		jdbc.update(sql, address.getAddress(), address.getState(), address.getCountry(), address.getZipCode(), address.getReceiver(), address.getUser().getUid());
		return;
	}

	public void Update(Address address) {
		String sql = "UPDATE address SET address=?, state=?, country=?, zipCode=?, receiver=? WHERE addressid=?";
		jdbc.update(sql, address.getAddress(), address.getState(), address.getCountry(), address.getZipCode(), address.getReceiver(), address.getAddressid());
		
	}

	public void delete(Address address){
		String sql = "DELETE FROM address WHERE addressid=?";
		jdbc.update(sql, address.getAddressid());
	}
	
	

	public Address findAddressById(int addressid){
		String sql = "SELECT * FROM address WHERE addressid = ?";
		Address address = jdbc.query(sql, new Object[]{addressid}, new ResultSetExtractor<Address>() {
			
			public Address extractData(ResultSet rs) throws SQLException, DataAccessException {

				Address address = null;
				while (rs.next()) {
					address = new Address();
					address.setAddressid(rs.getInt(1));
					address.setAddress(rs.getString(2));
					address.setState(rs.getString(3));
					address.setCountry(rs.getString(4));
					address.setZipCode(rs.getString(5));
					address.setReceiver(rs.getString(6));
				}
				return address;
			}
		});
		return address;
	}

	@Override
	public List<Address> getAll() {
		// TODO Auto-generated method stub
		return jdbc.query("SELECT * FROM address", new AddressMapper());
	}

	@Override
	public List<Address> findByUser(int uid) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM address JOIN user ON address.uid=user.uid WHERE user.uid = ?";
		List<Address> addresses = jdbc.query(sql, new Object[]{uid},new AddressMapper());
		return addresses;
	}

}
