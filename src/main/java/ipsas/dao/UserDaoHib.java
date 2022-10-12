package ipsas.dao;
/**
* @Author -- Moez Kchaou
*/
import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transaction;

import org.hibernate.Session;

import ipsas.model.User;
import ipsas.utils.HibernateUtil;



public class UserDaoHib {

	public static void save(User u) {
		Session s=HibernateUtil.getSessionFactory().openSession();
		org.hibernate.Transaction trx=s.beginTransaction();
		s.persist(u);
		trx.commit();
		s.close();

	}

	public static User sendEmail(String email, String pwd) {
		String querystring="From User u where u.email = :email and u.pwd = :pwd";
		Session s=HibernateUtil.getSessionFactory().openSession();
		Query q=s.createQuery(querystring);
		q.setParameter("email",email);
		q.setParameter("pwd",pwd);
		User user=null;

		List<User> liste =q.getResultList();
		
		return liste.get(0);
		}

	

 	public static boolean findByEmailAndPwd(String email, String pwd) {
		  
	        User user = null;
	        Session session = HibernateUtil.getSessionFactory().openSession();
	           
	            user = (User) session.createQuery("From User u where u.email = :email").setParameter("email", email)
	                .uniqueResult();

	            if (user != null && user.getPwd().equals(pwd)) {
	                return true;
	            }
	            
	           
	        
	            
	        
	        return false;
	    }
		
 
	
	public static List<User> findAll() {
	
		String querystring="From User u ";
		Session s=HibernateUtil.getSessionFactory().openSession();
		Query q=s.createQuery(querystring);
		List<User> list=q.getResultList();
		return list;
}

}
