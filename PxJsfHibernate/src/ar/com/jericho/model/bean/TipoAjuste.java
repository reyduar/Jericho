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
@Table(name="motivoajuste")
public class TipoAjuste {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="mtacodigo")
	private Integer codigo;
	@Column(name="mtanombre")
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
