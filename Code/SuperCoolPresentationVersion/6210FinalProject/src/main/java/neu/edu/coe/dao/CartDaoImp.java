package neu.edu.coe.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import neu.edu.coe.mapper.CartMapper;
import neu.edu.coe.mapper.ProductMapper;
import neu.edu.coe.model.Cart;
import neu.edu.coe.model.Product;
import neu.edu.coe.model.User;

public class CartDaoImp implements CartDao {

	private DataSource dataSource;
	private JdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbc = new JdbcTemplate(dataSource);
	}

	@Override
	public void createCart(Cart cart) {
		// TODO Auto-generated method stub
		String test ="SELECT * FROM cart WHERE pid = ? and uid = ?";
		List<Cart> cartItems = jdbc.query(test, new Object[] {cart.getProduct().getPid(), cart.getUser().getUid()}, new CartMapper());
		String sql;
		int quantity = cart.getQuantity();
		if(cartItems == null || cartItems.size()==0 || cartItems.get(0) == null){
			sql = "INSERT INTO cart" + "(quantity, uid, pid) VALUES (?, ?, ?)";
		} else{
			System.out.println(cartItems.get(0));
			quantity = quantity + cartItems.get(0).getQuantity();
			System.out.println(quantity);
			sql = "UPDATE cart SET quantity = ? WHERE uid = ? and  pid = ?";
		}
		jdbc.update(sql, quantity, cart.getUser().getUid(), cart.getProduct().getPid());	
	}

	@Override
	public void deleteCart(Cart cart) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM cart WHERE pid = ?";
		jdbc.update(sql, cart.getProduct().getPid());
	}

	@Override
	public void changeQuantity(Cart cart) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteByUser(User user) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Cart> findByUser(User user) {

		String sql = "SELECT * FROM cart WHERE uid = ?";
		List<Cart> cartItems = jdbc.query(sql, new Object[] {user.getUid()}, new CartMapper());
		return cartItems;
	}

	@Override
	public double sum(User user) {
		// TODO Auto-generated method stub
		String sql = "SELECT sum(quantity*price) FROM cart JOIN product ON cart.pid = product.pid WHERE cart.uid = " + user.getUid();
		double sum = jdbc.queryForInt(sql);
		return sum;
	}

	@Override
	public void checkOut(User user) {
		// TODO Auto-generated method stub
		String sql = "UPDATE cart SET checkout = ? WHERE uid = ?";
		String sql2 = "DELETE FROM cart WHERE uid = ?";
		jdbc.update(sql, 1, user.getUid());
		jdbc.update(sql2, user.getUid());	
	}
	
	

}
