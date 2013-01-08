package ar.com.jericho.model.bean;

import java.util.Date;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="ajuste")
public class Ajuste {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ajuste_nro")
	private Integer codigo;
	
	private Integer dep_codigo;
	private Integer suc_codigo;

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="art_codigo")
	private Articulo articulo;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="mtacodigo")
	private TipoAjuste tipoAjuste;
	
	private Date ajfecha_solicitada;
	private Date ajfecha_autorizada;
	private Date ajfecha_confirmada;
	private Integer ajcant_solicitada;
	private Integer ajcant_autorizada;
	private Integer ajcant_confirmada;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="fun_solicitante")
	private Funcionario fun_solicitante;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="fun_autorizante")
	private Funcionario fun_autorizante;
	
	private Integer ajautorizado;
	
	
	public Integer getCodigo() {
		return codigo;
	}
	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}
	public Integer getDep_codigo() {
		return dep_codigo;
	}
	public void setDep_codigo(Integer dep_codigo) {
		this.dep_codigo = dep_codigo;
	}
	public Integer getSuc_codigo() {
		return suc_codigo;
	}
	public void setSuc_codigo(Integer suc_codigo) {
		this.suc_codigo = suc_codigo;
	}
	public Articulo getArticulo() {
		return articulo;
	}
	public void setArticulo(Articulo articulo) {
		this.articulo = articulo;
	}
	public TipoAjuste getTipoAjuste() {
		return tipoAjuste;
	}
	public void setTipoAjuste(TipoAjuste tipoAjuste) {
		this.tipoAjuste = tipoAjuste;
	}
	public Date getAjfecha_solicitada() {
		return ajfecha_solicitada;
	}
	public void setAjfecha_solicitada(Date ajfecha_solicitada) {
		this.ajfecha_solicitada = ajfecha_solicitada;
	}
	public Date getAjfecha_confirmada() {
		return ajfecha_confirmada;
	}
	public void setAjfecha_confirmada(Date ajfecha_confirmada) {
		this.ajfecha_confirmada = ajfecha_confirmada;
	}
	public Date getAjfecha_autorizada() {
		return ajfecha_autorizada;
	}
	public void setAjfecha_autorizada(Date ajfecha_autorizada) {
		this.ajfecha_autorizada = ajfecha_autorizada;
	}
	public Integer getAjcant_solicitada() {
		return ajcant_solicitada;
	}
	public void setAjcant_solicitada(Integer ajcant_solicitada) {
		this.ajcant_solicitada = ajcant_solicitada;
	}
	public Integer getAjcant_autorizada() {
		return ajcant_autorizada;
	}
	public void setAjcant_autorizada(Integer ajcant_autorizada) {
		this.ajcant_autorizada = ajcant_autorizada;
	}
	public Funcionario getFun_solicitante() {
		return fun_solicitante;
	}
	public void setFun_solicitante(Funcionario fun_solicitante) {
		this.fun_solicitante = fun_solicitante;
	}
	public Funcionario getFun_autorizante() {
		return fun_autorizante;
	}
	public void setFun_autorizante(Funcionario fun_autorizante) {
		this.fun_autorizante = fun_autorizante;
	}
	public Integer getAjautorizado() {
		return ajautorizado;
	}
	public void setAjautorizado(Integer ajautorizado) {
		this.ajautorizado = ajautorizado;
	}
	public Integer getAjcant_confirmada() {
		return ajcant_confirmada;
	}
	public void setAjcant_confirmada(Integer ajcant_confirmada) {
		this.ajcant_confirmada = ajcant_confirmada;
	}
	
	
	
	
	
	
	
	
	
}
