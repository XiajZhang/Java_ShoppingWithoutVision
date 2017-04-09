package neu.edu.coe.model;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "comment")
public class Comment {
	/**
	 * 
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int comid;
	private Date time;
	private int pLevel;
	private int sLevel;
	private Product product;
	private User user;

//	@JoinColumn(name = "uid")
//	@ManyToOne
//	private User user;
	

	public Comment() {
		// TODO Auto-generated constructor stub
		super();
	}

	public Comment(User user, Product product, int pLevel, int sLevel) {
		// TODO Auto-generated constructor stub
		super();
		this.user=user;
		this.product=product;
		this.pLevel=pLevel;
		this.sLevel=sLevel;
//		this.time=time;
	}


	public int getCid() {
		return comid;
	}

	public int getComid() {
		return comid;
	}

	public void setComid(int comid) {
		this.comid = comid;
	}

	public int getpLevel() {
		return pLevel;
	}

	public void setpLevel(int pLevel) {
		this.pLevel = pLevel;
	}

	public int getsLevel() {
		return sLevel;
	}

	public void setsLevel(int sLevel) {
		this.sLevel = sLevel;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public void setCid(int cid) {
		this.comid = cid;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
