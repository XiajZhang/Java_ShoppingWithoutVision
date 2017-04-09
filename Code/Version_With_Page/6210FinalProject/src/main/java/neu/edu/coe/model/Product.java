package neu.edu.coe.model;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;

/**
 * entity of product
 */
public class Product {

	private Integer pid;
	private String pname;
	private Double price;
	private String pdesc;
	private Integer is_hot;
	private Date pdate;
	private Category category;

	@OneToOne(cascade = CascadeType.ALL)
	@PrimaryKeyJoinColumn
	private Feeling productFeeling;
	
	
	public Product(){
		
	}
	

	public Product(String pname, Double price, String pdesc, Integer is_hot, Date pdate) {
		// TODO Auto-generated constructor stub
		this.pname = pname;
		this.price = price;
	//	this.image = image;
		this.pdesc = pdesc;
		this.is_hot = is_hot;
		this.pdate = pdate;
	}
	
	public Product(Integer pid,String pname, Double price,  String pdesc, Integer is_hot, Date pdate, Category category){
		this.pid=pid;
		this.pname = pname;
		this.price = price;
//		this.image = image;
		this.pdesc = pdesc;
		this.is_hot = is_hot;
		this.pdate = pdate;
		this.category = category;
	}

	public Product(Integer pid){
		this.pid=pid;
	}
	
	public Feeling getProductFeeling() {
		return productFeeling;
	}

	public void setProductFeeling(Feeling productFeeling) {
		this.productFeeling = productFeeling;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getPdesc() {
		return pdesc;
	}

	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}

	public Integer getIs_hot() {
		return is_hot;
	}

	public void setIs_hot(Integer is_hot) {
		this.is_hot = is_hot;
	}

	public Date getPdate() {
		return pdate;
	}

	public void setPdate(Date date) {
		this.pdate = date;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Product [pid=" + pid + ", pname=" + pname + ", price=" + price + ", pdesc=" + pdesc
				+ ", is_hot=" + is_hot + ", pdate=" + pdate + ", productFeeling=" + productFeeling + ", category="
				+ category + "]";
	}

}
