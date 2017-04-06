package neu.edu.coe.dao;

import java.util.List;

import neu.edu.coe.model.Address;

public interface AddressDao {
	public List<Address> getAll();
	
	public void create(Address address);
	
	public void Update(Address address);
	
	public void delete(Address address);
	
	public List<Address> findByUser(int uid);
	
	public Address findAddressById(int addressid);
	
}
