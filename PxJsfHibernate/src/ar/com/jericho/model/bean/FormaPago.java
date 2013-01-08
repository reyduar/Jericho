package ar.com.jericho.model.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * Date : 08/11/2012
 * @author Ariel Duarte
 *
 */

@Entity
@Table(name="forma_cobro")
public class FormaPago {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="forc_codigo")
	Integer codigo;
	
	@Column(name="forc_nombre")
	String nombre;
	
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
