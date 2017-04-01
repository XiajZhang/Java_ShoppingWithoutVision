package neu.edu.coe.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="texture")
@Entity
public class Texture {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer textureId;
	private Integer currencyRange;
	private Integer currencyFrequence;
	private String textureName;
	private Integer rigidity;
	public Integer getTextureId() {
		return textureId;
	}
	public void setTextureId(Integer textureId) {
		this.textureId = textureId;
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
	public String getTextureName() {
		return textureName;
	}
	public void setTextureName(String textureName) {
		this.textureName = textureName;
	}
	public Integer getRigidity() {
		return rigidity;
	}
	public void setRigidity(Integer rigidity) {
		this.rigidity = rigidity;
	}
	
	
}
