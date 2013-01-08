package ar.com.jericho.model.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import ar.com.jericho.model.bean.CabeceraCompra;
import ar.com.jericho.model.bean.Proveedor;
/**
 * Date : 07/10/2012
 * @author Ariel Duarte
 * @param <T>
 */

/*
 * Implementamos la InterfaceDAO que se encargara de la manipulacion de datos 
 * Hibernate tiene su propia forma de manipulacion de datos sin necesidad de SQL
 */
public class HibernateDAO<T> implements InterfaceDAO<T> {

	
	private Class<T> classe; 
	protected Session session;
	
	/*
	 * Es necesario pasarle la clase para la cual se va a usar el HibernateDAO
	 */
	public HibernateDAO(Class<T> classe, Session session) {
		super();
		this.classe = classe;
		this.session = session;
	}
	
	@Override
	public void salvar(T bean) {
		session.save(bean);
		
	}

	@Override
	public void actualizar(T bean) {
		session.update(bean);
		
	}

	@Override
	public void eliminar(T bean) {
		session.delete(bean);
		
	}

	@Override
	public T getBean(Serializable codigo) {
		T bean = (T)session.get(classe, codigo);
		return bean;
	}

	@Override
	public List<T> getsBeans() {
		Criteria criteria = session.createCriteria(classe);
		criteria.setCacheable(true);// Se define a la consulta que trabaje con la cache
		//List<T> beans = (List<T>)session.createCriteria(classe).list();
		List<T> beans = (List<T>)criteria.list();
		return beans;
	}

	@Override
	public List<T> getBeansByExample(T bean) {
		Example example = getExample(bean);
		return session.createCriteria(classe).add(example).list();
	}
	
	protected Example getExample(T bean){
		Example example = Example.create(bean); 
		example.enableLike(MatchMode.ANYWHERE);
		example.ignoreCase();
		example.excludeZeroes();
		return example;
	}
	
	//TODO : Implementacion de codigo HQL
	public List<Proveedor> getProveedorListHQL(){
		 String queryHQL = "from Proveedor P order by P.nombre" ;
		// session.createSQLQuery(queryHQL);//Crea un SQL conveciona
		 return (List<Proveedor>) session.createQuery(queryHQL).list();//Crea un HQL
	}
	
	//TODO : Implementacion de codigo con Query Criteria
	public List<Proveedor> getProveedorSinDireccion(){
		
		Criteria criteria = session.createCriteria(Proveedor.class);
		criteria.add(Restrictions.or(Restrictions.isNull("direccion"), Restrictions.eq("direccion", "")));
		 return (List<Proveedor>) criteria.list();//Crea un HQL
	}

	//-- Metodo que permite obtner el ultimo codigo ingresado en una tabla --//
	public Integer lastInsertId(String bean, String id){
		List<Integer> resutado = new ArrayList<Integer>();
		String query = "select c."+id+" from "+bean+" c order by c."+id+" desc limit 1";
		resutado = (List<Integer>) session.createQuery(query).list();
		if(resutado.get(0) != null)
			return resutado.get(0);
		else
			return 1;
	}
	
	
	@Override
	public List<T> getBeansByIds(String atributo, List<Serializable> codigos) {
		try {
			if(codigos.size()==1){
				List<T> resultado = new ArrayList<T>();
				resultado.add(getBean(codigos.get(0)));
				return resultado;
			}else if(codigos.size() > 1){
				Criteria crit = session.createCriteria(classe);
				crit.add(Restrictions.in("codigo", codigos));
				return crit.list();
			}
			return new ArrayList<T>();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void salvar(Collection<T> beans) {
		Iterator<T> it = beans.iterator();
		int i = 0;
		// Permitira almacenar una lista de beans
		while(it.hasNext()) {
			session.save(it.next());
			//-- Se verifica si son 20 beans los que se este salvando para hacer el commit en la base de datos
			//-- ver propiedad hibernate.jdbc.batch_size de hibernate conf
			if(i % 20 == 0 || i >= beans.size()-1){
				session.flush();
				session.clear();
			}
			i++;
		}
		
	}

	
}
