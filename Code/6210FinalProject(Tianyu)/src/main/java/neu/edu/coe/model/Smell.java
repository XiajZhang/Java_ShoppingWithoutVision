package neu.edu.coe.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Table(name="smell")
@Entity
public class Smell {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer smellId;
	private Integer currencyRange;
	private Integer currencyFrequence;
	private String SmellName;
	
	@OneToOne
	@JoinColumn(name="pid")
	private Product product_pid;

	public Integer getSmellid() {
		return smellId;
	}

	public void setSmellid(Integer smellid) {
		this.smellId = smellid;
	}

	public Integer getCurrencyRange() {
		return currencyRange;
	}

	public void setCurrencyRange(Integer currencyRange) {
		this.currencyRange = currencyRange;
	}

	public Integer getCurrencyFrequence() {
		return currencyFrequence;
	}

	public void setCurrencyFrequence(Integer currencyFrequence) {
		this.currencyFrequence = currencyFrequence;
	}

	public String getSmellName() {
		return SmellName;
	}

	public void setSmellName(String smellName) {
		SmellName = smellName;
	}

	public Product getProduct_pid() {
		return product_pid;
	}

	public void setProduct_pid(Product product_pid) {
		this.product_pid = product_pid;
	}
	
	
	

}
