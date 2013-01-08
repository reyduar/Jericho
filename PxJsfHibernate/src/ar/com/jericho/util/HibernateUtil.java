package ar.com.jericho.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;


/**
 * Date 
 * @author Ariel Duarte
 * Configuración Hibernate
 */

/*
 * Configuracion de Hibernate
 */
public class HibernateUtil {
	private static final SessionFactory sessionFactory;
	public static final String HIBERNATE_SESSION = "hibernate_session";

	public static SessionFactory getSessionfactory() {
		return sessionFactory;
	}

	static{
		//-- Configuracion utilizando mapeamiento --//
		//sessionFactory = new Configuration().configure("ar/iariel/siscom/util/hibernate.cfg.xml").buildSessionFactory();
		
		//-- Configuracion con Annotations --//
		sessionFactory = new AnnotationConfiguration().configure("ar/com/jericho/util/hibernate.cfg.xml").buildSessionFactory();
	}
	
	
	/*
	 * Este codigo queda unitilizable, se lo cargo en este metodo solo
	 * para no perderlo, todo esto se paso al archivo hibernate.cfg.xml
	 */
	private SessionFactory getSessionFactoryCodigo(){
		Configuration configuration = new Configuration();
		/*Configuracion para trabajar con PostgreSQL*/
//		configuration.setProperty("hibernate.dialect","org.hibernate.dialect.PostgreSQLDialect");
//		configuration.setProperty("hibernate.connection.driver_class","org.postgresql.Driver");
//		configuration.setProperty("hibernate.connection.url","jdbc:postgresql://localhost:5432/stock");
//		configuration.setProperty("hibernate.connection.username","postgres");
//		configuration.setProperty("hibernate.connection.password","123");
		/*Configuracion para trabajar con MySQL*/
		configuration.setProperty("hibernate.dialect","org.hibernate.dialect.MySQLDialect");
		configuration.setProperty("hibernate.connection.driver_class","com.mysql.jdbc.Driver");
		configuration.setProperty("hibernate.connection.url","jdbc:mysql://localhost:3306/dbsiscom");
		configuration.setProperty("hibernate.connection.username","root");
		configuration.setProperty("hibernate.connection.password","123");
		configuration.setProperty("hibernate.show_sql","true");
		configuration.setProperty("hibernate.c3p0.min_size","1");
		configuration.setProperty("hibernate.c3p0.max_size","5");
		configuration.setProperty("hibernate.c3p0.timeout","300");
		configuration.setProperty("hibernate.c3p0.max_statements","50");
		configuration.setProperty("hibernate.c3p0.idle_test_period","5");
		configuration.setProperty("hibernate.current_session_context_class","thread");
		configuration.setProperty("hibernate.format_sql","true");
		configuration.setProperty("hibernate.pool_size","10");
		configuration.addResource("ar/iariel/siscom/model/bean/Proveedor.hbm.xml");
		configuration.addResource("ar/iariel/siscom/model/bean/Marca.hbm.xml");
		configuration.addResource("ar/iariel/siscom/model/bean/Pais.hbm.xml");
		configuration.addResource("ar/iariel/siscom/model/bean/Grupo.hbm.xml");
		configuration.addResource("ar/iariel/siscom/model/bean/Ubicacion.hbm.xml");
		configuration.addResource("ar/iariel/siscom/model/bean/TipoGrupo.hbm.xml");
		configuration.addResource("ar/iariel/siscom/model/bean/Ciudad.hbm.xml");
		return configuration.buildSessionFactory();
	}
}
