package ipsas.utils;
/**
* @Author -- Moez Kchaou
*/
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	private static final SessionFactory sessionFactory;
	 
	static {
		   try {
			StandardServiceRegistry standardRegistry = 
		       new StandardServiceRegistryBuilder().configure("hibernate.cgf.xml").build();
			sessionFactory = new Configuration().buildSessionFactory(standardRegistry); 

		   } catch (Throwable th) {
			System.err.println("Enitial SessionFactory creation failed" + th);
			throw new ExceptionInInitializerError(th);
		  }
		}
 
    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
 
    public static void shutdown() {
    	// Close caches and connection pools
    	getSessionFactory().close();
    }
}
