package ar.com.jericho.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.faces.event.ActionEvent;

import ar.com.jericho.model.bean.Articulo;
import ar.com.jericho.model.bean.CabeceraCompra;
import ar.com.jericho.model.bean.DetalleCompra;
import ar.com.jericho.model.bean.FormaPago;
import ar.com.jericho.model.bean.Proveedor;
import ar.com.jericho.model.dao.ArticuloDAO;
import ar.com.jericho.model.dao.HibernateDAO;
import ar.com.jericho.model.dao.InterfaceDAO;
import ar.com.jericho.util.FacesContextUtil;


/**
 * @author Ariel Duarte
 * Managed Bean : CompraBean
 */
public class CompraBean {
	public Integer numeroCompra = 0;
	private CabeceraCompra compra = new CabeceraCompra();
	private CabeceraCompra compraSuccess = new CabeceraCompra();
	private String codigoProveedor;
	//private String codigoOperacion;
	private FormaPago operacion = new FormaPago();
	private HashMap<Integer, Boolean> articulosSelecionados = new HashMap<Integer, Boolean>();
	private HashMap<Integer, Boolean> articulosExcluidos = new HashMap<Integer, Boolean>();
	
	//--Tratamiento de fechas --//
	Calendar c = Calendar.getInstance();
	private String cDay = Integer.toString(c.get(Calendar.DATE));
	private String cMonth = Integer.toString(c.get(Calendar.MONTH));
	private String cYear = Integer.toString(c.get(Calendar.YEAR));
	public String dateNow = cDay+"/"+cMonth+"/"+cYear;
	
	//-- Generar codigo de compra para detalle de compra --//
	
	
	/**
	 * @return the operacion
	 */
	public FormaPago getOperacion() {
		return operacion;
	}

	/**
	 * @param operacion the operacion to set
	 */
	public void setOperacion(FormaPago operacion) {
		this.operacion = operacion;
	}

	/**
	 * @return the articulosExcluidos
	 */
	public HashMap<Integer, Boolean> getArticulosExcluidos() {
		return articulosExcluidos;
	}

	/**
	 * @param articulosExcluidos the articulosExcluidos to set
	 */
	public void setArticulosExcluidos(HashMap<Integer, Boolean> articulosExcluidos) {
		this.articulosExcluidos = articulosExcluidos;
	}

	
	//-- Metodo para guardar la factura de compra --//
	public String guardarFacturaCompra(){
		if(compra.getFecha()==null){
			FacesContextUtil.setMessageError("Ingreses la fecha de la factura");
			return null;
		}
		//TODO: Hacer verificacion que la fecha ingreda no se mayor a la fecha actual
//		if(compra.getFecha().getTime() > fecha actual){
//			FacesContextUtil.setMessageError("La fecha ingresada no puede ser mayor a la fecha actual");
//			return null;
//		}
		//-- Se verifica si los montos subtotales de la factura esta bien cargados --//
		Set<DetalleCompra> detalles = getCompra().getDetalle();
		Double totalFactura = 0.0;
		for (DetalleCompra dc : detalles) {
			Double subTotal = dc.getPrecioUnitario()*dc.getCantidad() - dc.getSubtotal();
			if(subTotal != 0){
				FacesContextUtil.setMessageError("Atención, el subtotal del detalle "+dc.getArticulo().getArtnomreal()+" "+"incorrecto");
				return null;
			}
			totalFactura += dc.getSubtotal(); //suma de los subtotales 
			getCompra().setTotal(totalFactura);//seteamos total de factura en compra
		}
		
		getCompra().setFormaPago(getOperacion());//seteamos forma de pago en compra
		
		//--Guardamos los datos de la factura en la Base de Datos --//
		InterfaceDAO<CabeceraCompra> CabeceraCompraDAO = new HibernateDAO<CabeceraCompra>(CabeceraCompra.class, FacesContextUtil.getRequestSession()) ;
		CabeceraCompraDAO.salvar(getCompra());
		//-- Actualizamos el Stock --//
		InterfaceDAO<Articulo> articuloDAO = new HibernateDAO<Articulo>(Articulo.class, FacesContextUtil.getRequestSession()) ;
		for (DetalleCompra dc : detalles) {
			Articulo art = articuloDAO.getBean(dc.getArticulo().getCodigo());
			Integer newStock = art.getArtstockmin() + dc.getCantidad();
			art.setArtstockmin(newStock);
		}
		this.compraSuccess = CabeceraCompraDAO.getBean(getCompra().getNumero());
		
		//-- Restablecemos los valores de la factura --//
		limpiarFactura();
		
		return "success";
	}

	//-- Metodo para excluir un articulo al detalle --//
	public void excluirArticulo(ActionEvent evt){
		for(Integer i : articulosExcluidos.keySet()){
			 if(articulosExcluidos.get(i)){
				 DetalleCompra detalle = new DetalleCompra();
				 detalle.setArticulo(new Articulo());
				 detalle.getArticulo().setCodigo(i);
				 getCompra().getDetalle().remove(detalle);
			 }
		}
	}
	//-- Metodo para incluir un articulo al detalle --//
	public void selecionarArticulo(ActionEvent evt) {
		
		if(getCompra().getDetalle() == null)
			getCompra().setDetalle(new HashSet<DetalleCompra>());
		
		List<Serializable> ids = new ArrayList<Serializable>();
		for(Integer i : articulosSelecionados.keySet()){
			
			//-- Si el articulo esta seleccionado --//
			if(articulosSelecionados.get(i)){
				
				Articulo articulo = new Articulo();
				articulo.setCodigo(i);
				DetalleCompra detalle = new DetalleCompra();
				detalle.setArticulo(articulo);
				if(!compra.getDetalle().contains(detalle)){
					ids.add(i); 
				}
			}
		}
		ArticuloDAO articuloDAO = new ArticuloDAO(FacesContextUtil.getRequestSession());
		List<Articulo> articulos = articuloDAO.getBeansByIds("codigo", ids);
		for(Articulo art : articulos){
			DetalleCompra det = new DetalleCompra();
			det.setArticulo(art);
			det.setCompra(getCompra());
			getCompra().getDetalle().add(det);
		}
	}
	
	public String getCodigoProveedor() {
		return codigoProveedor;
	}
	public void setCodigoProveedor(String codigoProveedor) {
		this.codigoProveedor = codigoProveedor;
	}
	
	
	public String comfirmarProveedor(){
		InterfaceDAO<Proveedor> proveedorDAO = new HibernateDAO<Proveedor>(Proveedor.class, FacesContextUtil.getRequestSession());
		this.compra = new CabeceraCompra();
		this.compra.setProveedor(proveedorDAO.getBean(Integer.valueOf(codigoProveedor)));
		this.compra.setDetalle(new HashSet<DetalleCompra>());
		System.out.println("Proveedor Seleccionado : "+ compra.getProveedor().getCodigo());
		numeroCompra = proveedorDAO.lastInsertId("CabeceraCompra","numero")+1;
		compra.setNumero(numeroCompra);
		return null;
	}
	
	//-- Metodo que rinicia los valores de los atributos --//
	public void modificarProveedor(ActionEvent evt){
		limpiarFactura();
	}
	
	//-- Metodo que administra los datos de la Cabecera de compra --//
	public CabeceraCompra getCompra() {
		return compra;
	}
	
	//-- Metodo para restablcer valores de la factura de proveedor --//
	private void limpiarFactura(){
		this.codigoProveedor = null;
		setOperacion(new FormaPago());
		this.compra = new CabeceraCompra();
		
		//-- Restablecemos los valores de los HashMap --//
		setArticulosSelecionados(new HashMap<Integer, Boolean>());
		setArticulosExcluidos(new HashMap<Integer, Boolean>());
	}
	
	
	/**
	 * @return the articulosSelecionados
	 */
	public HashMap<Integer, Boolean> getArticulosSelecionados() {
		return articulosSelecionados;
	}
	/**
	 * @param articulosSelecionados the articulosSelecionados to set
	 */
	public void setArticulosSelecionados(HashMap<Integer, Boolean> articulosSelecionados) {
		this.articulosSelecionados = articulosSelecionados;
	}

	//-- Metodo para mostrar datos de compras guardados --//
	public CabeceraCompra getCompraSuccess() {
		return compraSuccess;
	}

	
	
	

	
	
	

}
