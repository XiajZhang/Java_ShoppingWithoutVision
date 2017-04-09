package neu.edu.coe.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import neu.edu.coe.mapper.OrderMapper;
import neu.edu.coe.model.Order;

@Component
public class OrderDaoImp implements OrderDao{

	private JdbcTemplate jdbc;

	private DataSource dataSource;
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbc = new JdbcTemplate(dataSource);
	}
	@Override
	public void insert(Order order) {
		String sql = "INSERT INTO orders" + "(addressid, uid, total, ordertime) VALUES ( ?, ?, ?, ?)";
		jdbc.update(sql,order.getAddress().getAddressid(), order.getUser().getUid(), order.getTotal(), order.getOrdertime());
	}

	@Override
	public List<Order> getOrders() {
		
		return null;
	}

	@Override
	public List<Order> findByName(String desc) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Order findById(int oid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Order> findByDescription(String desc) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Order order) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Order order) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Order> findByCategory(int oid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Order> getOrdersByUid(int uid) {
		String orderSql = "SELECT * FROM orders O WHERE O.UID='"+uid+"'";
		return jdbc.query(orderSql, new OrderMapper());
	}

}
