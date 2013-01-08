package ar.com.jericho.model.dao;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import ar.com.jericho.model.bean.CabeceraCompra;
/**
 * Date : 07/10/2012
 * @author Ariel Duarte
 *
 * @param <T>
 */

public interface InterfaceDAO<T> {
	void salvar(T bean);
	void actualizar(T bean);
	void eliminar(T bean);
	void salvar(Collection<T> beans);
	T getBean(Serializable codigo);
	List<T> getsBeans();
	List<T> getBeansByExample(T Bean);
	List<T> getBeansByIds(String atributo, List<Serializable> codigos);
	Integer lastInsertId(String clase, String id);
}
