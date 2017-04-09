package neu.edu.coe.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import neu.edu.coe.model.Order;
import neu.edu.coe.model.OrderItem;
import neu.edu.coe.model.Product;


public class OrderItemMapper implements RowMapper<OrderItem>{

	@Override
	public OrderItem mapRow(ResultSet rs, int rowNum) throws SQLException {
		OrderItem item = new OrderItem();
		item.setCounts(rs.getInt("counts"));
		item.setSubtotal(rs.getDouble("subtotal"));
		Product p = new Product();
		p.setPid(rs.getInt("pid"));
		item.setProduct(p);
		Order o = new Order();
		o.setOid(rs.getInt("oid"));
		item.setOrder(o);
		return item;
	}

}
