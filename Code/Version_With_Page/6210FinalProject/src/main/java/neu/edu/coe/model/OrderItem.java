package neu.edu.coe.model;

public class OrderItem {
	
	private Integer counts;
	
	private Double subtotal;
	private Product product;
	private Order order;
	
	public Integer getCounts() {
		return counts;
	}
	public void setCounts(Integer counts) {
		this.counts = counts;
	}
	public Double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	@Override
	public String toString() {
		return "OrderItem [counts=" + counts + ", subtotal=" + subtotal + ", product=" + product
				+ ", order=" + order + "]";
	}
}
