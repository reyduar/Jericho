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
import javax.persistence.Transient;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * Date : 07/10/2012
 * @author Ariel Duarte
 *
 */

@Entity
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
@Table(name="articulo")
public class Articulo {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="art_codigo")
	private Integer codigo;
	
	@Column(name="artbarra")
	private String artbarra;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="gru_codigo")
	private Grupo grupo;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="tg_codigo")
	private TipoGrupo tipoGrupo;
	
	@Column(name="artnomreal")
	private String artnomreal;
	
	@Column(name="artnomfact")
	private String artnomfact;
	
	@Column(name="artcodorigen")
	private String artcodorigen;
	
	@Column(name="artnropieza")
	private String artnropieza;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="mar_codigo")
	private Marca marca;
	
	@Column(name="codigomarca")
	private String codigomarca;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="pais_codigo")
	private Pais pais;
	
	@Column(name="artprecact")
	private Double artprecact;
	
	@Column(name="artpreant")
	private Double artpreant;
	
	@Column(name="artpreventa")
	private Double artpreventa;
	
	@Column(name="arttpiva")
	private String arttpiva;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="ubica_codigo")
	private Ubicacion ubicacion;
	
	@Column(name="artstockmin")
	private Integer artstockmin;
	
	@Column(name="artobs")
	private String artobs;
	
	@Column(name="artivaporc")
	private Double artivaporc;
	
	
	public Grupo getGrupo() {
		return grupo;
	}
	public void setGrupo(Grupo grupo) {
		this.grupo = grupo;
	}
	public TipoGrupo getTipoGrupo() {
		return tipoGrupo;
	}
	public void setTipoGrupo(TipoGrupo tipoGrupo) {
		this.tipoGrupo = tipoGrupo;
	}
	public Ubicacion getUbicacion() {
		return ubicacion;
	}
	public void setUbicacion(Ubicacion ubicacion) {
		this.ubicacion = ubicacion;
	}
	public Marca getMarca() {
		return marca;
	}
	public void setMarca(Marca marca) {
		this.marca = marca;
	}
	public Pais getPais() {
		return pais;
	}
	public void setPais(Pais pais) {
		this.pais = pais;
	}
	public Integer getCodigo() {
		return codigo;
	}
	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}
	public String getArtbarra() {
		return artbarra;
	}
	public void setArtbarra(String artbarra) {
		this.artbarra = artbarra;
	}
	public String getArtnomreal() {
		return artnomreal;
	}
	public void setArtnomreal(String artnomreal) {
		this.artnomreal = artnomreal;
	}
	public String getArtnomfact() {
		return artnomfact;
	}
	public void setArtnomfact(String artnomfact) {
		this.artnomfact = artnomfact;
	}
	public String getArtcodorigen() {
		return artcodorigen;
	}
	public void setArtcodorigen(String artcodorigen) {
		this.artcodorigen = artcodorigen;
	}
	public String getArtnropieza() {
		return artnropieza;
	}
	public void setArtnropieza(String artnropieza) {
		this.artnropieza = artnropieza;
	}

	public String getCodigomarca() {
		return codigomarca;
	}
	public void setCodigomarca(String codigomarca) {
		this.codigomarca = codigomarca;
	}
	public Double getArtprecact() {
		return artprecact;
	}
	public void setArtprecact(Double artprecact) {
		this.artprecact = artprecact;
	}
	public Double getArtpreant() {
		return artpreant;
	}
	public void setArtpreant(Double artpreant) {
		this.artpreant = artpreant;
	}
	public Double getArtpreventa() {
		return artpreventa;
	}
	public void setArtpreventa(Double artpreventa) {
		this.artpreventa = artpreventa;
	}
	public String getArttpiva() {
		return arttpiva;
	}
	public void setArttpiva(String arttpiva) {
		this.arttpiva = arttpiva;
	}

	public Integer getArtstockmin() {
		return artstockmin;
	}
	public void setArtstockmin(Integer artstockmin) {
		this.artstockmin = artstockmin;
	}
	public String getArtobs() {
		return artobs;
	}
	public void setArtobs(String artobs) {
		this.artobs = artobs;
	}
	public Double getArtivaporc() {
		return artivaporc;
	}
	public void setArtivaporc(Double artivaporc) {
		this.artivaporc = artivaporc;
	}
	
	@Transient
	public boolean isValido() {
		if (artnomreal != null && artnomreal.length()>3 && marca != null && grupo != null && tipoGrupo != null && pais != null)
			return true;
		
		return false;
	}
	
}
