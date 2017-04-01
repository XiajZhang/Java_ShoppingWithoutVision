package neu.edu.coe.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import neu.edu.coe.model.Order;
import neu.edu.coe.model.OrderItem;
import neu.edu.coe.model.User;

@Component
public class OrderDaoImp implements OrderDao{
	
private JdbcTemplate jdbc;
	
	private DataSource dataSource;
	
	@Autowired
	public void setDataSource(DataSource dataSource){
		this.dataSource = dataSource;
		this.jdbc = new JdbcTemplate(dataSource);
	}
	
	@Override
	public void insert(Order order) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO ORDER " +
				"(oid, ordertime, total) VALUES (?, ?, ?)";
		jdbc.update(sql, order.getOid(), order.getOrdertime(), order.getTotal());
		System.out.println("Created Record Order ID = " + order.getOid() + ", Order time = " + order.getOrdertime() + ", Total = " + order.getTotal());
		return;
	}

	@Override
	public int findCountByUid(Integer uid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Order> findPageByUid(Integer uid, int begin, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Order findByOid(Integer oid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int findCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Order> findByPage(int begin, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderItem> findOrderItem(Integer oid) {
		// TODO Auto-generated method stub
		return null;
	}

}
