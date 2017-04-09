package neu.edu.coe.dao;

import java.util.List;

import neu.edu.coe.model.Order;

public interface OrderDao {
	public void insert(Order order);

	public List<Order> getOrders();
	
	public List<Order> getOrdersByUid(int uid);

	public List<Order> findByName(String desc);
	
	public Order findById(int oid);

	public List<Order> findByDescription(String desc);

	public void update(Order order);

	public void delete(Order order);

	public List<Order> findByCategory(int oid);
	
}
