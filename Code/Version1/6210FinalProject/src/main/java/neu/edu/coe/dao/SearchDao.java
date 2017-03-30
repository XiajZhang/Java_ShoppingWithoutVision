package neu.edu.coe.dao;

import java.util.List;

import neu.edu.coe.model.Product;


public interface SearchDao {
	
	
	public List<Product> getProduct();
		
	public List<Product> findByName(String desc);
	
	public List<Product> findByDescription(String desc);
	
	
	

}
