package ipsas.dao;
/**
* @Author -- Moez Kchaou
*/
import java.util.List;

import javax.persistence.Query;
import javax.transaction.SystemException;
import javax.transaction.Transaction;

import org.hibernate.Session;

import ipsas.model.Contact;

import ipsas.utils.HibernateUtil;

public class ContactDaoHib {
	public static void save(Contact co) {
		Session s=HibernateUtil.getSessionFactory().openSession();
		org.hibernate.Transaction trx=s.beginTransaction();
		s.persist(co);
		trx.commit();
		s.close();

	}

public static List<Contact> findAll() {
		
	
	String querystring="From Contact c ";
	Session s=HibernateUtil.getSessionFactory().openSession();
	Query q=s.createQuery(querystring);
	List<Contact> list=q.getResultList();
	return list;
}

public static void deletecontact(int id_contact)  {
	

	Session session = HibernateUtil.getSessionFactory().openSession();
       
    	org.hibernate.Transaction t = session.beginTransaction();

       
        Contact contact = session.get(Contact.class,id_contact);
        if (contact != null) {
            session.delete(contact);
           
        }

        t.commit();  
}
public static void editcontact(Contact contact)  {
	

	Session session = HibernateUtil.getSessionFactory().openSession();
    
	org.hibernate.Transaction t = session.beginTransaction();

   
   
    if (contact != null) {
        session.update(contact);
       
    }

    t.commit(); 
}
}
	



