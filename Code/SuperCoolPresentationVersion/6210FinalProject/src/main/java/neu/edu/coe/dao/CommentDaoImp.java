package neu.edu.coe.dao;



import java.util.List;

import javax.sql.DataSource;

import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import neu.edu.coe.mapper.CommentMapper;
import neu.edu.coe.model.Comment;
import neu.edu.coe.model.Product;

@Component
@Repository("commentDao")
public class CommentDaoImp implements CommentDao {

	private JdbcTemplate jdbc;

	private DataSource dataSource;
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbc = new JdbcTemplate(dataSource);
	}
	
	
	@Override
	public Integer CountComment() {
		return null;
	}

	@Override
	public void insert(Comment comment) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO comments " + "(product_pid,user_uid,pLevel,sLevel) VALUES (?, ?, ?, ?)";
	    jdbc.update(sql, comment.getProduct().getPid(), comment.getUser().getUid(), comment.getpLevel(), comment.getsLevel());
	    return;
	}


	@Override
	public List<Comment> findAll() {
		// TODO Auto-generated method stub
		String sql = "select * from comment";
		List<Comment> comments = jdbc.query(sql, new CommentMapper());
	    return comments;
	}


	@Override
	public List<Comment> findByProduct(Product product) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM comments WHERE product_pid=?";
		List<Comment> commentlist = jdbc.query(sql, new Object[]{product.getPid()}, new CommentMapper());
		return commentlist;
	}

}
