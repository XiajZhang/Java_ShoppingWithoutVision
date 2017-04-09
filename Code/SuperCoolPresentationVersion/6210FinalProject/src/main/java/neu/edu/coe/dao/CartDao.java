package neu.edu.coe.dao;

import java.util.List;

import neu.edu.coe.model.Cart;
import neu.edu.coe.model.User;

public interface CartDao {
	
	public void createCart(Cart cart);
	
	public void deleteCart(Cart cart);
	
	public void changeQuantity(Cart cart);
	
	public void deleteByUser(User user);
	
	public List<Cart> findByUser(User user);
	
	public double sum(User user);
	
	public void checkOut(User user);
}
