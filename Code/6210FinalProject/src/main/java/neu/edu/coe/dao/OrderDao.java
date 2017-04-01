package neu.edu.coe.dao;

import java.util.List;

import neu.edu.coe.model.Order;
import neu.edu.coe.model.OrderItem;


public interface OrderDao {
	
	public void insert(Order order);
	
	// count my orders
	public int findCountByUid(Integer uid);

	// count pages 
	public List<Order> findPageByUid(Integer uid, int begin, int limit);

	// query order by id
	public Order findByOid(Integer oid);

	// count number
	public int findCount();

	// query by pages
	public List<Order> findByPage(int begin, int limit);
	
	// query orderItem by id
	public List<OrderItem> findOrderItem(Integer oid);
}
