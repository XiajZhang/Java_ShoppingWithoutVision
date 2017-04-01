package neu.edu.coe.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="color")
@Entity
public class Color {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer colorId;
	private Integer currencyRange;
	private Integer currencyFrequence;
	private String colorName;
	public Integer getColorId() {
		return colorId;
	}
	public void setColorId(Integer colorId) {
		this.colorId = colorId;
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
	public String getColorName() {
		return colorName;
	}
	public void setColorName(String colorName) {
		this.colorName = colorName;
	}
	
	

}
