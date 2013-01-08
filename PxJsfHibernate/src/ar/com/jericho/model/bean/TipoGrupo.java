package ar.com.jericho.model.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Date : 07/10/2012
 * @author Ariel Duarte
 *
 */
@Entity
@Table(name="tipo_grupo")
public class TipoGrupo {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="tg_codigo")
	private Integer codigo;
	
	@Column(name="gru_codigo")
	private Integer grupo;
	
	@Column(name="tg_nombre")
	private String nombre;
	

	public Integer getGrupo() {
		return grupo;
	}
	public void setGrupo(Integer grupo) {
		this.grupo = grupo;
	}
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
