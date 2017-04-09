package neu.edu.coe.dao;

import java.util.List;

import neu.edu.coe.model.OrderItem;

public interface OrderItemDao {
	public List<OrderItem> getOrderItemByOid(int oid);
}
