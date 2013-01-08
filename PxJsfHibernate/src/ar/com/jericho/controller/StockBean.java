package ar.com.jericho.controller;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.faces.component.html.HtmlDataTable;

import ar.com.jericho.model.bean.Ajuste;
import ar.com.jericho.model.bean.Articulo;
import ar.com.jericho.model.dao.ArticuloDAO;
import ar.com.jericho.model.dao.HibernateDAO;
import ar.com.jericho.model.dao.InterfaceDAO;
import ar.com.jericho.util.FacesContextUtil;

/**
 * @author Ariel Duarte
 * Managed Bean : StockBean
 */


public class StockBean {
	
	private HashMap<Integer, Ajuste> articulosSeleccionados = new HashMap<Integer, Ajuste>();
	private HtmlDataTable dataTableArticulosDisponibles ;//Para binding
	private HtmlDataTable dataTableAjusteStock;
	private LoginBean login; //Para saber quien es el funcionario logueado
	private Collection<Ajuste>ajusteStockSuccess;
	
	
	public String confirmarAjusteStock(){
		InterfaceDAO<Ajuste> ajusteDAO = new HibernateDAO<>(Ajuste.class, FacesContextUtil.getRequestSession());
		for (Ajuste ajuste : articulosSeleccionados.values()) {
			if(ajuste.getAjcant_solicitada() < 0){
				 FacesContextUtil.setMessageError("La cantidad deberá ser mayor o igual a cero!");
				 return null;
			}
		//	ajusteDAO.salvar(ajuste);
		}
		//-- Guardamos los datos de ajustes --//
		ajusteDAO.salvar(articulosSeleccionados.values());
		//-- Cargamos la collection con los datos almacenados --//
		setAjusteStockSuccess(articulosSeleccionados.values());
		//--Limpiamos las variables utilizadas --//
		articulosSeleccionados = new HashMap<Integer, Ajuste>();
		
		return "success";
	}
	
	
	public String excluirArticulo(){
		Articulo articulo = ((Ajuste) getDataTableAjusteStock().getRowData()).getArticulo();
		articulosSeleccionados.remove(articulo.getCodigo());
		 
		return null;
	}
	
	public String incluirArticulo(){
		Articulo articulo = (Articulo) getDataTableArticulosDisponibles().getRowData();
		Ajuste ajusteStock = new Ajuste();
		ajusteStock.setArticulo(articulo);
		ajusteStock.setAjautorizado(0);
		ajusteStock.setFun_solicitante(login.getUsuario());
		ajusteStock.setAjfecha_solicitada(new Date());
		
		articulosSeleccionados.put(articulo.getCodigo(), ajusteStock);
		
		return null;
	}
	

	public List<Articulo> getArticulosStock(){
		ArticuloDAO articuloDAO = new ArticuloDAO(FacesContextUtil.getRequestSession());
		return articuloDAO.getArticuloStock(new Articulo(), articulosSeleccionados.keySet());
		 
	}


	
	public HtmlDataTable getDataTableArticulosDisponibles() {
		return dataTableArticulosDisponibles;
	}


	public void setDataTableArticulosDisponibles(
			HtmlDataTable dataTableArticulosDisponibles) {
		this.dataTableArticulosDisponibles = dataTableArticulosDisponibles;
	}


	public void setLogin(LoginBean login) {
		this.login = login;
	}


	public Collection<Ajuste> getArticulosSeleccionados() {
		return articulosSeleccionados.values();
	}


	public HtmlDataTable getDataTableAjusteStock() {
		return dataTableAjusteStock;
	}


	public void setDataTableAjusteStock(HtmlDataTable dataTableAjusteStock) {
		this.dataTableAjusteStock = dataTableAjusteStock;
	}


	public Collection<Ajuste> getAjusteStockSuccess() {
		return ajusteStockSuccess;
	}


	public void setAjusteStockSuccess(Collection<Ajuste> ajusteStockSuccess) {
		this.ajusteStockSuccess = ajusteStockSuccess;
	}
	
	
	
	
}
