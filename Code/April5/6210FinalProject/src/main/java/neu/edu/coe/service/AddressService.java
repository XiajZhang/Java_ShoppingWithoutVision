package neu.edu.coe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import neu.edu.coe.dao.AddressDao;
import neu.edu.coe.model.Address;

@Repository
public class AddressService {
	
	AddressDao addressDao;
	
	@Autowired
	public void setAddressdao(AddressDao addressDao){
		this.addressDao = addressDao;
	}
	
	public List<Address> getCurrent(){
		return addressDao.getAll();
	}
	
	public void create(Address address){
		addressDao.create(address);
	}

}
