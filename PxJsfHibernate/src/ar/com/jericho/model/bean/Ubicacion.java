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
@Table(name="ubicacion")
public class Ubicacion {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ubica_codigo")
	private Integer codigo;
	
	@Column(name="ubica_nombre")
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
	
}
