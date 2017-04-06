package neu.edu.coe.dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Component;

import neu.edu.coe.mapper.ProductMapper;
import neu.edu.coe.model.Product;

@Component
public class ProductDaoImp implements ProductDao {

	private JdbcTemplate jdbc;

	private DataSource dataSource;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbc = new JdbcTemplate(dataSource);
	}

	@Override
	public void insert(Product product) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO product " + "(pname,price,pdesc,is_hot,pdate,cid) VALUES (?, ?, ?, ?, ?, ?)";
		jdbc.update(sql, product.getPname(), product.getPrice(), product.getPdesc(),
				product.getIs_hot(), product.getPdate(), product.getCategory().getCid());
		return;
	}

	@Override
	public List<Product> findByDescription(String desc) {
		// TODO Auto-generated method stub
		ProductMapper prodMapper = new ProductMapper();
		String sql = "SELECT * FROM product Where pdesc like '%" + desc + "%' ;";
		List<Product> prod = jdbc.query(sql, prodMapper);

		return prod;
	}

	@Override
	public List<Product> getProduct() {
		// TODO Auto-generated method stub
		String sql = "select * from product";
		List<Product> products = jdbc.query(sql, new ProductMapper());
		return products;
	}

	@Override
	public void update(Product product) {
		String sql = "update product set pname=?,price=?, pdesc=?,is_hot=?,pdate=? where pid=?";
		jdbc.update(sql, product.getPname(), product.getPrice(), product.getPdesc(),
				product.getIs_hot(), product.getPdate(), product.getPid());
	}

	@Override
	public void delete(Product product) {
		String sql = "DELETE FROM product WHERE pid=?";
		jdbc.update(sql, product.getPid());
	}

	@Override
	public List<Product> findByCategory(int cid) {
		String sql = "SELECT * FROM product JOIN category ON product.cid=category.cid WHERE category.cid = ?";
		List<Product> products = jdbc.query(sql, new Object[]{cid},new ProductMapper());
		return products;
	}

	@Override
	public List<Product> getProducts() {

		String sql = "select * from product";
		List<Product> products = jdbc.query(sql, new ProductMapper());
		return products;
	}

	@Override
	public List<Product> findByName(String desc) {
		// TODO Auto-generated method stub
		return null;
	}
	
	



	public void addImage(byte[] bytes, Integer pid) {
		// TODO Auto-generated method stub
		String sql = "UPDATE product set image = ? WHERE pid =?";
		jdbc.update(sql,bytes,pid);
	}

	@Override
	public Product findById(int pid) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM PRODUCT WHERE pid = ?";
		Product product = jdbc.query(sql, new Object[]{pid}, new ResultSetExtractor<Product>() {
			
			public Product extractData(ResultSet rs) throws SQLException, DataAccessException {

				Product product = null;
				while (rs.next()) {
					product = new Product();
					product.setPid(rs.getInt(1));
					product.setPname(rs.getString(2));
					product.setPrice(rs.getDouble(3));
					product.setPdesc(rs.getString(4));
					product.setIs_hot(rs.getInt(5));
					product.setPdate(rs.getDate(6));	
				}
				return product;
			}
		});
		return product;
	}

}
