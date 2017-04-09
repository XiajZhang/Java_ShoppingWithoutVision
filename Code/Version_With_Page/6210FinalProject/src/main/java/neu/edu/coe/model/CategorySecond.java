package neu.edu.coe.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * entity of second category
 */
@Table(name="categorysecond")
@Entity
public class CategorySecond implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Id
	private Integer csid;
	private String csname;
	// the category
	@JoinColumn(name="cid")
	@ManyToOne
	private Category category;
	//new method of getting cid in table "Category"
	public CategorySecond(){
		this.category= new Category();
	}
	
	
	
	public CategorySecond(String csname,Category category){
		this.csname=csname;
		this.category=category;
	}
	
//	public CategorySecond(String csname, Integer cid) {
//		// TODO Auto-generated constructor stub
//		this.csname=csname;
//		this.cid = cid;
//	}

	public CategorySecond(String csname, Integer csid) {
		// TODO Auto-generated constructor stub
		this.csname=csname;
		this.csid=csid;
	}



	public CategorySecond(Integer csid) {
		// TODO Auto-generated constructor stub
		this.csid=csid;
	}



	public Integer getCid(){
		return this.category.getCid();
	}
	// product Set
	@OneToMany(fetch=FetchType.LAZY,mappedBy="categorySecond")
	private Set<Product> products = new HashSet<Product>();
	
	public Integer getCsid() {
		return csid;
	}
	public void setCsid(Integer csid) {
		this.csid = csid;
	}
	public String getCsname() {
		return csname;
	}
	public void setCsname(String csname) {
		this.csname = csname;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Set<Product> getProducts() {
		return products;
	}
	public void setProducts(Set<Product> products) {
		this.products = products;
	}
}
