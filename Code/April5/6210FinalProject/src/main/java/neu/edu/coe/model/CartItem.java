package neu.edu.coe.model;

public class CartItem {
	
	//product information in cart
	private Product product; 
	//the count
	private int count;       
	@SuppressWarnings("unused")
	// the total prices of one product
	private double subtotal; 
	
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
//	public double getSubtotal(){
//		if(product.getShop_price()!=null){
//			return count*product.getShop_price();
//		}
//		return 0;
//	}
}
