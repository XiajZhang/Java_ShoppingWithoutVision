package neu.edu.coe.model;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

public class Cart {
	//Cart Attribute
	//shopping map��the key: pid��value��product
	private Map<Integer, CartItem> map = new LinkedHashMap<Integer, CartItem>();
	
	//the object has one cartItems Attribute
	public Collection<CartItem> getCartItems(){
		return map.values();
	}

	//total of shopping
	private double total;
	
	public double getTotal() {
		return total;
	}
	
	//the function of cart��
	//1.add product into cart
	public void addCart(CartItem cartItem) {
		//judge whether the product has been in the cart or not 
		/**
		 * Yes: Add Number
		 * sum+ = prices;
		 * 
		 * No:
		 * add product into cart
		 * sum+ = prices;
		 */
		//getProduct().getPid()
		Integer pid = cartItem.getProduct().getPid();
		//whether exist in cart
		if(map.containsKey(pid)){
			//Yes: get id
			CartItem _carCartItem = map.get(pid);
			//add number on the old number
			_carCartItem.setCount(_carCartItem.getCount()+cartItem.getCount());
		}else {
			map.put(pid, cartItem);
		}
		// set total
		total += cartItem.getSubtotal();
	}
	
	// 2.remove product
	public void removeCart(Integer pid) {
		//remove product from cart
		CartItem cartItem = map.remove(pid);
		total -= cartItem.getSubtotal();
	}
	
	//3.clear cart
	public void clearCart() {
		//clear cart
		map.clear();
		//total = 0
		total = 0;
	}
}
