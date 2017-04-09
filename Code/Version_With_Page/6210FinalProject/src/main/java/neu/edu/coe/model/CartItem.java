package neu.edu.coe.model;

public class CartItem {
	
	//product information in cart
	private Product product; 
	//the count
	private int count;       
	// the total prices of one product
	private double subtotal; 
	
	private Order order;
	
	
	
	public double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}

}
