package ar.com.jericho.model.dao;

import java.util.Collection;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import ar.com.jericho.model.bean.Articulo;

public class ArticuloDAO extends HibernateDAO<Articulo> {

	public ArticuloDAO(Session session) {
		super(Articulo.class,session);
	}
	
	public List<Articulo> getArticuloStock(Articulo art, Collection<Integer>codigosExcluidos){
		Criteria crit =  session.createCriteria(Articulo.class).add(getExample(art));
		crit.add(Restrictions.gt("artstockmin", 0));// gt = mayor que
		if(codigosExcluidos != null && codigosExcluidos.size()>0){
			crit.add(Restrictions.not(Restrictions.in("codigo", codigosExcluidos)));//Es para exluir los codigos de articulos q no qeremos
		}
		
		return crit.list();
	}
	
	public List<Articulo> getArticuloPorProveedor(Articulo art){
		Example example = getExample(art);
		
		Criteria criArt = session.createCriteria(Articulo.class);
		criArt.setCacheable(true);
		
		if(art.getMarca() != null){
			criArt.add(Restrictions.eq("marca.codigo", art.getMarca().getCodigo()));
		}
		return criArt.add(example).list();
		
		//return session.createCriteria(Articulo.class).add(example).list();
	}



}
