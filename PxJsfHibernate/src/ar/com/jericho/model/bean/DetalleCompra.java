package ar.com.jericho.model.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="det_compra")
public class DetalleCompra {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="det_codigo")
	private Integer codigo;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="com_nro")
	private CabeceraCompra compra;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="art_codigo")
	private Articulo articulo;
	
	@Column(name="det_com_can")
	private Integer cantidad;
	
	@Column(name="det_com_pre")
	private Double precioUnitario;
	
	@Column(name="det_com_exe")
	private Double precioExento;
	
	@Column(name="det_com_gra10")
	private Double precioGravado10;
	
	@Column(name="det_com_gra5")
	private Double precioGravado5;
	
	@Column(name="det_com_sub")
	private Double subtotal;
	
	@Column(name="det_com_porc")
	private Double iva;

	
	
	
	public Integer getCodigo() {
		return codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

	public CabeceraCompra getCompra() {
		return compra;
	}

	public void setCompra(CabeceraCompra compra) {
		this.compra = compra;
	}

	public Articulo getArticulo() {
		return articulo;
	}

	public void setArticulo(Articulo articulo) {
		this.articulo = articulo;
	}

	public Integer getCantidad() {
		return cantidad;
	}

	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}

	public Double getPrecioUnitario() {
		return precioUnitario;
	}

	public void setPrecioUnitario(Double precioUnitario) {
		this.precioUnitario = precioUnitario;
	}

	public Double getPrecioExento() {
		return precioExento;
	}

	public void setPrecioExento(Double precioExento) {
		this.precioExento = precioExento;
	}

	public Double getPrecioGravado10() {
		return precioGravado10;
	}

	public void setPrecioGravado10(Double precioGravado10) {
		this.precioGravado10 = precioGravado10;
	}

	public Double getPrecioGravado5() {
		return precioGravado5;
	}

	public void setPrecioGravado5(Double precioGravado5) {
		this.precioGravado5 = precioGravado5;
	}

	public Double getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}

	public Double getIva() {
		return iva;
	}

	public void setIva(Double iva) {
		this.iva = iva;
	}

	@Override
	public boolean equals(Object obj) {
		if(!(obj instanceof DetalleCompra)){
			return false;
		}
		DetalleCompra dc = (DetalleCompra) obj;
		if(getCodigo() != null && getCodigo().equals(dc.getCodigo()))
		 	return true;
		
		if(getCodigo() == null && getArticulo() != null && getArticulo().getCodigo().equals(dc.getArticulo().getCodigo()))
			return true;
		
		return false;
	}

	@Override
	public int hashCode() {
		if(getCodigo() != null){
			return (int) getCodigo();
		}
		return (int) getArticulo().getCodigo();
	}
	
	
	
	
	
}
