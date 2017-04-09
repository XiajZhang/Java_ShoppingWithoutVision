package neu.edu.coe.model;


public class Cart {
	
	private User user;
	private int quantity;
	private Product product;
	
	
	
	public Cart() {
		super();
	}
	public Cart(User user, int quantity, Product product) {
		super();
		this.user = user;
		this.quantity = quantity;
		this.product = product;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
	@Override
	public String toString() {
		return "Cart [user=" + user + ", quantity=" + quantity + ", product=" + product + "]";
	}	
}
