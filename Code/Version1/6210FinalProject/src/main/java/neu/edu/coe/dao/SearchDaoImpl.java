package neu.edu.coe.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import neu.edu.coe.mapper.ProductMapper;
import neu.edu.coe.model.Product;
import neu.edu.coe.model.User;

@Component
public class SearchDaoImpl implements SearchDao {

	private JdbcTemplate jdbc;

	private DataSource dataSource;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbc = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Product> findByDescription(String desc) {
		// TODO Auto-generated method stub
		ProductMapper prodMapper = new ProductMapper();
		String sql = "SELECT * FROM product Where pdesc like '%" + desc + "%' ;";
		List<Product> prod = jdbc.query(sql, prodMapper);
		
		return prod;
	}
	
	
	
	
	
	
}
