package ar.com.jericho.controller;

import java.util.List;

import ar.com.jericho.model.bean.Funcionario;
import ar.com.jericho.model.dao.HibernateDAO;
import ar.com.jericho.model.dao.InterfaceDAO;
import ar.com.jericho.util.FacesContextUtil;

/**
 * @author Ariel Duarte
 * Managed Bean : LoginBean
 */
public class LoginBean {

	private Funcionario usuario = new Funcionario();
	private Boolean autenticado = false;
	
	
	
	//-- Metodo para iniciar session--//
	public String verifyLogin(){
		
		InterfaceDAO<Funcionario> funcionarioDAO = new HibernateDAO<>(Funcionario.class, FacesContextUtil.getRequestSession());
		Funcionario usuAux = new Funcionario();
		List<Funcionario> listaFuncionarios = funcionarioDAO.getBeansByExample(usuAux);
		usuAux.setLogin(getUsuario().getLogin());
		//-- hacemos la verificacion --//
		if(listaFuncionarios != null && listaFuncionarios.size()>0){
			usuAux = listaFuncionarios.get(0);
			if(usuario.getPass() != null && usuario.getPass().equals(usuAux.getPass())){
				autenticado = true;
				usuario = usuAux;
				return "success";
			}
		}
		FacesContextUtil.setMessageError("Usuario / Clave son invalidos");
		return null;
	}
	
	//-- Metodo para cerrar session--//
	public String salir(){
		setUsuario(new Funcionario());
		autenticado = false;
		return "login";
	}
	
	//-- Getters and Setters
	public Funcionario getUsuario() {
		return usuario;
	}
	public void setUsuario(Funcionario usuario) {
		this.usuario = usuario;
	}
	public Boolean getAutenticado() {
		return autenticado;
	}
	
	public Boolean getGerente(){
		return usuario != null && usuario.getCargo().trim().equalsIgnoreCase("gerente");
	}
	
}
