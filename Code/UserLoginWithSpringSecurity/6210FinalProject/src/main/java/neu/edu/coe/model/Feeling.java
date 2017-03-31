package neu.edu.coe.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Table(name = "feeling")
@Entity
public class Feeling {

	@Column(name = "pid")
	private Integer pid;
	@OneToMany(cascade = { CascadeType.ALL }, fetch = FetchType.EAGER, mappedBy = "color")
	private Set<Color> colorId = new HashSet<Color>();
	@OneToMany(cascade = { CascadeType.ALL }, fetch = FetchType.EAGER, mappedBy = "smell")
	private Set<Smell> smellId = new HashSet<Smell>();
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public Set<Color> getColorId() {
		return colorId;
	}
	public void setColorId(Set<Color> colorId) {
		this.colorId = colorId;
	}
	public Set<Smell> getSmellId() {
		return smellId;
	}
	public void setSmellId(Set<Smell> smellId) {
		this.smellId = smellId;
	}
	
	
	
}
