package neu.edu.coe.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import neu.edu.coe.mapper.OrderItemMapper;
import neu.edu.coe.model.OrderItem;

@Component
public class OrderItemDaoImp implements OrderItemDao{
	private JdbcTemplate jdbc;

	private DataSource dataSource;
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbc = new JdbcTemplate(dataSource);
	}
	@Override
	public List<OrderItem> getOrderItemByOid(int oid) {
		String sql = "SELECT * FROM orderItem WHERE oid = ?";
		return jdbc.query(sql, new Object[]{oid}, new OrderItemMapper());
	}

}
