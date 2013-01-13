package ar.com.jericho.controller;

import java.util.Collection;
import java.util.Date;

import javax.faces.component.html.HtmlDataTable;

import ar.com.jericho.model.bean.Ajuste;
import ar.com.jericho.model.bean.Articulo;
import ar.com.jericho.model.dao.AjusteStockDAO;
import ar.com.jericho.model.dao.HibernateDAO;
import ar.com.jericho.model.dao.InterfaceDAO;
import ar.com.jericho.util.FacesContextUtil;
public class AjusteConfirmaBackingBean {
	
	private LoginBean login;
	private HtmlDataTable dataTableConfirmarAjuste;
	
	public String confirmar(){
		Ajuste ajusteBean = (Ajuste) dataTableConfirmarAjuste.getRowData();
		if(ajusteBean.getAjcant_confirmada() > ajusteBean.getArticulo().getArtstockmin()){
			FacesContextUtil.setMessageError("Cantidad solicitada superior a la del Stock");
			return null;
		}else if(ajusteBean.getAjcant_confirmada() > ajusteBean.getAjcant_solicitada()){
			FacesContextUtil.setMessageError("Cantidad de entrega no puede ser superior a la autorizada");
			return null;
		}else if(ajusteBean.getAjcant_solicitada() < ajusteBean.getArticulo().getArtstockmin() && ajusteBean.getAjcant_confirmada() < ajusteBean.getAjcant_solicitada()){
			FacesContextUtil.setMessageError("Cantidad confirmada no puede ser inferior a la solicitada");
			return null;
		}
		
		//-- Actualizamos el campo Stock de la Tabla Articulos
		Articulo art = ajusteBean.getArticulo();
		art.setArtstockmin(art.getArtstockmin() - ajusteBean.getAjcant_confirmada());
		InterfaceDAO<Articulo> artDAO = new HibernateDAO<Articulo>(Articulo.class, FacesContextUtil.getRequestSession());
		artDAO.actualizar(art);
		
		//-- Actualizamos el campo Stock de la Tabla Articulos
		InterfaceDAO<Ajuste> ajusteStockDAO = new AjusteStockDAO(FacesContextUtil.getRequestSession(), new HibernateDAO<Ajuste>(Ajuste.class, FacesContextUtil.getRequestSession()));
		ajusteBean.setAjfecha_confirmada(new Date());
		ajusteBean.setFun_autorizante(login.getUsuario());
		ajusteStockDAO.actualizar(ajusteBean);
		return null;
	}
	
	public Collection<Ajuste> getPendientesConfirmar(){
		AjusteStockDAO ajusteDAO = new AjusteStockDAO(FacesContextUtil.getRequestSession(),new HibernateDAO<Ajuste>(Ajuste.class, FacesContextUtil.getRequestSession()));
		
		return ajusteDAO.getPendientesConfirmar();
	}


	public LoginBean getLogin() {
		return login;
	}


	public void setLogin(LoginBean login) {
		this.login = login;
	}


	public HtmlDataTable getDataTableConfirmarAjuste() {
		return dataTableConfirmarAjuste;
	}


	public void setDataTableConfirmarAjuste(HtmlDataTable dataTableConfirmarAjuste) {
		this.dataTableConfirmarAjuste = dataTableConfirmarAjuste;
	}

}
