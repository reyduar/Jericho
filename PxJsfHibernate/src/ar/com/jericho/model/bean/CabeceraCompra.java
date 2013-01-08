package ar.com.jericho.model.bean;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

/**
 * Date : 08/11/2012
 * @author Ariel Duarte
 *
 */

@Entity
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
@Table(name="compra")
public class CabeceraCompra {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="com_nro")
	private Integer numero;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="forc_codigo")
	private FormaPago formaPago;
	
	@Column(name="mon_codigo")
	private Integer moneda;
	
	@Column(name="suc_codigo")
	private Integer sucursal;
	
	@Column(name="dep_codigo")
	private Integer deposito;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="pro_codigo")
	private Proveedor proveedor;
	
	@Column(name="com_fact_nro")
	private String nroFactura;
	
	@Column(name="com_fecha")
	private Date fecha;
	
	@Column(name="com_exe")
	private Double exento;
	
	@Column(name="com_gra")
	private Double gravado;
	
	@Column(name="com_iva")
	private Double iva;
	
	@Column(name="com_desc")
	private Double descuento;
	
	@Column(name="com_recar")
	private Double recargo;
	
	@Column(name="com_total")
	private Double total;
	
	@Column(name="com_cond")
	private String condicion;
	
	@Column(name="com_cambio")
	private Double cotizacion;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="compra")
	@Cascade(value={CascadeType.SAVE_UPDATE})
	@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
	@JoinColumn(name="com_nro", insertable=true, updatable=true)
	private Set<DetalleCompra> detalle ;
	
	
	public Set<DetalleCompra> getDetalle() {
		return detalle;
	}

	public void setDetalle(Set<DetalleCompra> detalle) {
		this.detalle = detalle;
	}

	public Integer getNumero() {
		return numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public FormaPago getFormaPago() {
		return formaPago;
	}

	public void setFormaPago(FormaPago formaPago) {
		this.formaPago = formaPago;
	}

	public Integer getMoneda() {
		return moneda;
	}

	public void setMoneda(Integer moneda) {
		this.moneda = moneda;
	}

	public Integer getSucursal() {
		return sucursal;
	}

	public void setSucursal(Integer sucursal) {
		this.sucursal = sucursal;
	}

	public Integer getDeposito() {
		return deposito;
	}

	public void setDeposito(Integer deposito) {
		this.deposito = deposito;
	}

	public Proveedor getProveedor() {
		return proveedor;
	}

	public void setProveedor(Proveedor proveedor) {
		this.proveedor = proveedor;
	}

	public String getNroFactura() {
		return nroFactura;
	}

	public void setNroFactura(String nroFactura) {
		this.nroFactura = nroFactura;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public Double getExento() {
		return exento;
	}

	public void setExento(Double exento) {
		this.exento = exento;
	}

	public Double getGravado() {
		return gravado;
	}

	public void setGravado(Double gravado) {
		this.gravado = gravado;
	}

	public Double getIva() {
		return iva;
	}

	public void setIva(Double iva) {
		this.iva = iva;
	}

	public Double getDescuento() {
		return descuento;
	}

	public void setDescuento(Double descuento) {
		this.descuento = descuento;
	}

	public Double getRecargo() {
		return recargo;
	}

	public void setRecargo(Double recargo) {
		this.recargo = recargo;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public String getCondicion() {
		return condicion;
	}

	public void setCondicion(String condicion) {
		this.condicion = condicion;
	}

	public Double getCotizacion() {
		return cotizacion;
	}

	public void setCotizacion(Double cotizacion) {
		this.cotizacion = cotizacion;
	}
	
}
