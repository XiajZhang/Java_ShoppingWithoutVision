package neu.edu.coe.dao;

import java.util.List;

import neu.edu.coe.model.Comment;
import neu.edu.coe.model.Product;


public interface CommentDao {
	public void insert(Comment comment);
	
	public List<Comment> findAll();
	
	public List<Comment> findByProduct(Product product);
	
	public Integer CountComment();
}
