package neu.edu.coe.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import neu.edu.coe.model.Cart;
import neu.edu.coe.model.Product;
import neu.edu.coe.model.User;

public class CartMapper implements RowMapper<Cart> {

	@Override
	public Cart mapRow(ResultSet rs, int rowNum) throws SQLException {
		Cart cartItem = new Cart();
		Product product = new Product();
		product.setPid(rs.getInt("pid"));
		cartItem.setProduct(product);
		cartItem.setQuantity(rs.getInt("quantity"));
		User user = new User();
		user.setUid(rs.getInt("uid"));
		cartItem.setUser(user);
		return cartItem;
	}
}