package neu.edu.coe.dao;

import java.util.List;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import neu.edu.coe.mapper.CategoryRowMapper;
import neu.edu.coe.model.Category;

public class CategoryDaoImp implements CategoryDao {
	private DataSource dataSource;
	private JdbcTemplate jdbc;

	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbc = new JdbcTemplate(dataSource);
	}

	@Override
	public void create(Category category) {
		// TODO Auto-generated method stub
		String sql = "insert into category (cname) values (?)";
	    jdbc.update(sql, category.getCname());
//	    System.out.println("Category ID = " + category.getCid() + ", Created category name = " + category.getCname());
	    
	    return;
	}

	@Override
	public Category findCategoryByName(String cname) {
		// TODO Auto-generated method stub
		String sql ="select * from category where cname=?";
		Category category = jdbc.queryForObject(sql, new Object[]{cname}, new CategoryRowMapper());	
		
		return category;
	}
	
	public void Update(Category category) {
		// TODO Auto-generated method stub
		String sql="update category set cname=? where cid=?";
		jdbc.update(sql, category.getCname(), category.getCid());
		
		return;
	}

	@Override
	public void delete(Category category) {
		// TODO Auto-generated method stub
		String sql ="delete from category where cid=?";
		jdbc.update(sql, category.getCid());
		return;
	}

	@Override
	public List<Category> getAll() {
		// TODO Auto-generated method stub
		return jdbc.query("select * from category", new CategoryRowMapper());
	}

	@Override
	public Category findCategoryById(int cid) {
		// TODO Auto-generated method stub
		String sql ="select * from category where cid=?";
		Category category = jdbc.queryForObject(sql, new Object[]{cid}, new CategoryRowMapper());	
		
		return category;
	}
	

	

}

