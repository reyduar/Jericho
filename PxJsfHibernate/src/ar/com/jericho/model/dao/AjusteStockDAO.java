package ar.com.jericho.model.dao;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;

import ar.com.jericho.model.bean.Ajuste;
import ar.com.jericho.util.FacesContextUtil;

public class AjusteStockDAO implements InterfaceDAO<Ajuste> {
	private InterfaceDAO<Ajuste> hibDAO; 
	private Session session;

	public AjusteStockDAO(Session session, InterfaceDAO<Ajuste> dao) {
		hibDAO = dao;
		this.session = session;
	}
	
	//-- Vamos listar los ajustes que estan pendientes de autorizacion --//
	public List<Ajuste> getPendientesAutorizacion(){
		Criteria crit = session.createCriteria(Ajuste.class);
		crit.add(Restrictions.eq("ajautorizado", 0));
		crit.add(Restrictions.isNull("ajfecha_autorizada"));
		return crit.list();
		
	}
	
	//-- Vamos listar los ajustes que estan pendientes de autorizacion --//
	public List<Ajuste> getPendientesConfirmar(){
		Criteria crit = session.createCriteria(Ajuste.class);
		crit.add(Restrictions.eq("ajautorizado", 1));
		crit.add(Restrictions.isNotNull("ajfecha_autorizada"));
		crit.add(Restrictions.isNull("ajfecha_confirmada"));
		return crit.list();
		
	}

	public void salvar(Ajuste bean) {
		hibDAO.salvar(bean);
	}

	public void actualizar(Ajuste bean) {
		hibDAO.actualizar(bean);
	}

	public void eliminar(Ajuste bean) {
		hibDAO.eliminar(bean);
	}

	public void salvar(Collection<Ajuste> beans) {
		hibDAO.salvar(beans);
	}

	public Ajuste getBean(Serializable codigo) {
		return hibDAO.getBean(codigo);
	}

	public List<Ajuste> getsBeans() {
		return hibDAO.getsBeans();
	}

	public List<Ajuste> getBeansByExample(Ajuste Bean) {
		return hibDAO.getBeansByExample(Bean);
	}

	public List<Ajuste> getBeansByIds(String atributo,
			List<Serializable> codigos) {
		return hibDAO.getBeansByIds(atributo, codigos);
	}

	public Integer lastInsertId(String clase, String id) {
		return hibDAO.lastInsertId(clase, id);
	}

	
	
}
