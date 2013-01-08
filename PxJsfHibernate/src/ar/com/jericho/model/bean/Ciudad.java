package ar.com.jericho.model.bean;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
/**
 * Date : 07/10/2012
 * @author Ariel Duarte
 *
 */
@Entity
@Table(name="ciudad")
public class Ciudad {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ciu_codigo")
	private Integer codigo;
	@Column(name="ciu_nombre")
	private String nombre;
	
	public Integer getCodigo() {
		return codigo;
	}
	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	
//	private List<Proveedor> proveedores ;
//	
//	@Transient
//	public List<Proveedor> getProveedores() {
//		return proveedores;
//	}
//	
//	
//	public void setProveedores(List<Proveedor> proveedores) {
//		this.proveedores = proveedores;
//	}
	
	
	
	
	
}
