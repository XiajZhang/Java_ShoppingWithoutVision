package neu.edu.coe.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Table(name = "touching")
@Entity
public class Touching {

	@Id
	@GeneratedValue(generator = "foreigngen")
	@GenericGenerator(strategy = "foreign", name = "foreigngen")
	@Column(name = "pid")
	private Integer pid;
	@OneToMany(cascade = { CascadeType.ALL }, fetch = FetchType.EAGER, mappedBy = "shape")
	private Set<Shape> shapeId = new HashSet<Shape>();
	@OneToMany(cascade = { CascadeType.ALL }, fetch = FetchType.EAGER, mappedBy = "texture")
	private Set<Texture> texture = new HashSet<Texture>();
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public Set<Shape> getShapeId() {
		return shapeId;
	}
	public void setShapeId(Set<Shape> shapeId) {
		this.shapeId = shapeId;
	}
	public Set<Texture> getTexture() {
		return texture;
	}
	public void setTexture(Set<Texture> texture) {
		this.texture = texture;
	}
	
	
	
}
