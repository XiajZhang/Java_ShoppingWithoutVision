package neu.edu.coe.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import neu.edu.coe.model.Comment;
import neu.edu.coe.model.Product;
import neu.edu.coe.model.User;

public class CommentMapper implements RowMapper<Comment> {

	@Override
	public Comment mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		User user = new User();
		
		Comment comment = new Comment();
		
		Product product = new Product();
		comment.setComid(rs.getInt("comid"));
//		comment.setTime(rs.getDate("time"));
		comment.setpLevel(rs.getInt("pLevel"));
		comment.setsLevel(rs.getInt("sLevel"));
		comment.setProduct(product);
		comment.setUser(user);
//		System.out.println("before");
		user.setUid(rs.getInt("user_uid"));
		product.setPid(rs.getInt("product_pid"));
//		System.out.println("after");

		
		return comment;
	}

}
