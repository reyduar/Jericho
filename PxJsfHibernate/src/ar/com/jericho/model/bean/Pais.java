package ar.com.jericho.model.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Date : 07/10/2012
 * @author Ariel Duarte
 *
 */

@Entity
@Table(name="pais")
public class Pais {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="pais_codigo")
	private Integer codigo;
	
	@Column(name="pais_nombre")
	private String nombre;
	
	@Column(name="pais_gentilicio")
	private String gentilicio;
	
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
	public String getGentilicio() {
		return gentilicio;
	}
	public void setGentilicio(String gentilicio) {
		this.gentilicio = gentilicio;
	}
	
	

}
