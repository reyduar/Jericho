package ar.com.jericho.controller;

import java.util.ArrayList;
import java.util.List;

import javax.faces.model.SelectItem;

import org.hibernate.classic.Session;

import ar.com.jericho.model.bean.Articulo;
import ar.com.jericho.model.bean.Ciudad;
import ar.com.jericho.model.bean.FormaPago;
import ar.com.jericho.model.bean.Proveedor;
import ar.com.jericho.model.dao.ArticuloDAO;
import ar.com.jericho.model.dao.HibernateDAO;
import ar.com.jericho.model.dao.InterfaceDAO;
import ar.com.jericho.util.FacesContextUtil;
/**
 * @author Ariel Duarte
 * Backing Bean : CompraBackingBean
 */
public class CompraBackingBean {
	
	private Proveedor proveedor = new Proveedor();
	private Articulo articulo = new Articulo();
	private Ciudad ciudad = new Ciudad();
	private CompraBean compraBean;
	List<SelectItem> proveedores;
	List<Articulo> articulos;

	//-- Metodos que permite hacer la busqueda de proveedor --//
	public Proveedor getProveedor() {
		return proveedor;
	}

	public void setProveedor(Proveedor proveedor) {
		this.proveedor = proveedor;
	}

	//-- Metodo para rellenar el DropDown con los Proveedores --//
	public List<SelectItem> getProveedores(){
		if(proveedores == null){
			Session session = FacesContextUtil.getRequestSession(); 
			
			InterfaceDAO<Proveedor> proveedorDAO = new HibernateDAO<Proveedor>(Proveedor.class, session);
			
			//-- En el caso de que algun elemento este null el lo pueda encontrar igual pero como vacio --//
			if(proveedor.getNombre() != null && proveedor.getNombre().equals("")){
				proveedor.setNombre(null);
			}
			if(proveedor.getRuc() != null && proveedor.getRuc().equals("")){
				proveedor.setRuc(null);
			}
			
			List<Proveedor> proveedoresByExample = proveedorDAO.getBeansByExample(proveedor);
			
			proveedores = new ArrayList<SelectItem>();
			proveedores.add(new SelectItem(null, "Seleccione proveedor..."));
			 for (Proveedor p : proveedoresByExample) {
				 proveedores.add(new SelectItem(p.getCodigo().toString(), p.getNombre()));
			}
		}
			
		return proveedores;
	}
	//-- Listado de operaciones para el dropdown --//
	public List<SelectItem> getOperaciones(){
		Session session = FacesContextUtil.getRequestSession(); 
		InterfaceDAO<FormaPago> operacionDAO = new HibernateDAO<FormaPago>(FormaPago.class, session);
		List<SelectItem> selectOperaciones = new ArrayList<SelectItem>();
		//selectOperaciones.add(new SelectItem(null, "Seleccione operacion..."));
		 for (FormaPago op : operacionDAO.getsBeans()) {
			 selectOperaciones.add(new SelectItem(op.getCodigo().toString(), op.getNombre()));
		}
		return selectOperaciones;
		
	}
	
	//-- Listado de articulos de la tabla JSF --//
	public List<Articulo> getArticulos(){
		if(articulos==null){
			articulos = new ArrayList<Articulo>();
			Session session = FacesContextUtil.getRequestSession(); 
			InterfaceDAO<Articulo> articuloDAO = new HibernateDAO<Articulo>(Articulo.class, session);
			if(getArticulo().getArtnomreal() != null && getArticulo().getArtnomreal().equals("")){
				articulo.setArtnomreal(null);
			}
			
			List<Articulo> articulosByExample = articuloDAO.getBeansByExample(articulo);
			for (Articulo a : articulosByExample) {
				articulos.add(a);
			}
			//TODO: Este codigo es para un filtro de proveedor por producto, pero que no lo tenemos en implementado en esta aplicacion
			/*
			ArticuloDAO articuloDAO = new ArticuloDAO(session); -----para usar la clase ArticuloDAO
			if(compraBean.getCompra().getProveedor() != ){
				getArticulo().setProveedor(compraBean.getCompra().getProveedor());
				return articuloDAO.getArticuloPorProveedor(getArticulo());
			}
			*/
		}
		
		
		return articulos;
		//return articuloDAO.getsBeans();
	}

	//-- Getter y Setter de compraBean --//
	public CompraBean getCompraBean() {
		return compraBean;
	}

	public void setCompraBean(CompraBean compraBean) {
		this.compraBean = compraBean;
	}

	public Articulo getArticulo() {
		return articulo;
	}

	public void setArticulo(Articulo articulo) {
		this.articulo = articulo;
	}
	
}
