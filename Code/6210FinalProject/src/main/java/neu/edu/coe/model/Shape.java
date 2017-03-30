package neu.edu.coe.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="shape")
@Entity
public class Shape {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer shapeId;
	private Integer currencyRange;
	private Integer currencyFrequence;
	private String shapeName;
	public Integer getShapeId() {
		return shapeId;
	}
	public void setShapeId(Integer shapeId) {
		this.shapeId = shapeId;
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
	public String getShapeName() {
		return shapeName;
	}
	public void setShapeName(String shapeName) {
		this.shapeName = shapeName;
	}
	
	
	

}
