package neu.edu.coe.model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class Order {
	private int oid;
	private Address address;
	private User user;
	private Date ordertime;
	private Double total;
	private List<OrderItem> orderItems = new ArrayList<OrderItem>();
	
	public Order(){
		super();
	}
	
	public Order(Address address, User user, Date ordertime, Double total) {
		this.address = address;
		this.user = user;
		this.ordertime = ordertime;
		this.total = total;
	}
	public Order(int oid, Address address, User user, Date ordertime, Double total) {
		super();
		this.oid = oid;
		this.address = address;
		this.user = user;
		this.ordertime = ordertime;
		this.total = total;
	}
	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}
	

	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public Date getOrdertime() {
		return ordertime;
	}

	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<OrderItem> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(List<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}

	@Override
	public String toString() {
		return "Order [oid=" + oid + ", total=" + total + ", ordertime=" + ordertime + ",  user=" + user + "]";
	}
}
