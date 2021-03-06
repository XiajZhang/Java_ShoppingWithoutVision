package neu.edu.coe.dao;

import java.util.List;
import neu.edu.coe.model.Product;

public interface ProductDao {

	public void insert(Product product);

	public List<Product> getProduct();

	public List<Product> findByName(String desc);
	
	public Product findById(int pid);

	public List<Product> findByDescription(String desc);

	public List<Product> getProducts();

	public void update(Product product);

	public void delete(Product product);

	public List<Product> findByCategory(int cid);
	
	public void addImage (byte[] bytes, Integer pid);

}