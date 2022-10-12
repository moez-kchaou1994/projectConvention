package ipsas.dao;
/**
* @Author -- Moez Kchaou
*/
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;

import ipsas.model.Contact;
import ipsas.model.Convention;
import ipsas.utils.HibernateUtil;

public class ConventionDaoHib {
	public static void save(Convention c) {
		Session s=HibernateUtil.getSessionFactory().openSession();
		org.hibernate.Transaction trx=s.beginTransaction();
		s.persist(c);
		trx.commit();
		s.close();

	}
	public static List<Convention> findByIDConv(int id_conv) {
		String querystring="From Convention c where c.id_conv = :id_conv";
		Session s=HibernateUtil.getSessionFactory().openSession();
		Query q=s.createQuery(querystring);
		q.setParameter("id_conv",id_conv);
		List<Convention> liste =q.getResultList();
		return liste;
		}
	public static List<Convention> findBytype(String type) {
		String querystring="From Convention c where c.type = :type";
		Session s=HibernateUtil.getSessionFactory().openSession();
		Query q=s.createQuery(querystring);
		q.setParameter("type",type);
		List<Convention> liste =q.getResultList();
		return liste;
		}
	public static List<Convention> findBystartdate(String start_date) {
		String querystring="From Convention c where c.start_date = :start_date";
		Session s=HibernateUtil.getSessionFactory().openSession();
		Query q=s.createQuery(querystring);
		q.setParameter("start_date",start_date);
		List<Convention> liste =q.getResultList();
		return liste;
		}
	public static List<Convention> findBydateexpiry(String date_expiry) {
		String querystring="From Convention c where c.date_expiry = :date_expiry";
		Session s=HibernateUtil.getSessionFactory().openSession();
		Query q=s.createQuery(querystring);
		q.setParameter("date_expiry",date_expiry);
		List<Convention> liste =q.getResultList();
		return liste;
		}
	public static List<Convention> findBydateedition(String date_edition) {
		String querystring="From Convention c where c.date_edition = :date_edition";
		Session s=HibernateUtil.getSessionFactory().openSession();
		Query q=s.createQuery(querystring);
		q.setParameter("date_edition",date_edition);
		List<Convention> liste =q.getResultList();
		return liste;
		}
	public static List<Convention> findBydatesignature(String date_signature) {
		String querystring="From Convention c where c.date_signature = :date_signature";
		Session s=HibernateUtil.getSessionFactory().openSession();
		Query q=s.createQuery(querystring);
		q.setParameter("date_signature",date_signature);
		List<Convention> liste =q.getResultList();
		return liste;
		}
	public static List<Convention> findAll() {
		
		String querystring="From Convention c ";
		Session s=HibernateUtil.getSessionFactory().openSession();
		Query q=s.createQuery(querystring);
		List<Convention> list=q.getResultList();
		return list;
}
	
	public static List<Convention> findobject(String object) {
		String querystring="From Convention c where c.object = :object";
		Session s=HibernateUtil.getSessionFactory().openSession();
		Query q=s.createQuery(querystring);
		q.setParameter("object",object);
		List<Convention> liste =q.getResultList();
		return liste;
		}
	public static void deleteconvention(int id_conv)  {
		

		Session session = HibernateUtil.getSessionFactory().openSession();
	       
	    	org.hibernate.Transaction t = session.beginTransaction();

	       
	        Convention convention = session.get(Convention.class,id_conv);
	        if (convention != null) {
	            session.delete(convention);
	           
	        }

	        t.commit();  
	}
	public static void editconvention(Convention convention)  {
		

		Session session = HibernateUtil.getSessionFactory().openSession();
	    
		org.hibernate.Transaction t = session.beginTransaction();

	   
	   
	    if (convention != null) {
	        session.update(convention);
	       
	    }

	    t.commit(); 
	}
	
}
