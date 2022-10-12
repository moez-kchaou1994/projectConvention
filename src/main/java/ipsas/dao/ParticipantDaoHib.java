package ipsas.dao;
/**
* @Author -- Moez Kchaou
*/
import java.util.Collection;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;

import ipsas.model.Convention;
import ipsas.model.Participant;
import ipsas.utils.HibernateUtil;

public class ParticipantDaoHib {
	public static void save(Participant p) {
		Session s=HibernateUtil.getSessionFactory().openSession();
		org.hibernate.Transaction trx=s.beginTransaction();
		s.persist(p);
		trx.commit();
		s.close();

	}
public static List<Participant> findAllparticipant() {
		
		String querystring="From Participant p ";
		Session s=HibernateUtil.getSessionFactory().openSession();
		Query q=s.createQuery(querystring);
		List<Participant> list=q.getResultList();
		return list;
}
public static Participant findByidparticpant(int id_participant) {
	String querystring="From Participant p where p.id_participant = :id_participant";
	Session s=HibernateUtil.getSessionFactory().openSession();
	Query q=s.createQuery(querystring);
	q.setParameter("id_participant",id_participant);
	
	
	Participant participant=null;

	List<Participant> liste =q.getResultList();
	
	return liste.get(0);
	}

public static void deleteparticipant(int id_participant)  {
	

	Session session = HibernateUtil.getSessionFactory().openSession();
       
    	org.hibernate.Transaction t = session.beginTransaction();

       
    	Participant participant = session.get(Participant.class, id_participant);
        if (participant != null) {
            session.delete(participant);
           
        }

        t.commit();  
}
public static void editparticipant(Participant participant)  {
	

	Session session = HibernateUtil.getSessionFactory().openSession();
    
	org.hibernate.Transaction t = session.beginTransaction();

   
   
    if (participant != null) {
        session.update(participant);
       
    }

    t.commit(); 
}

 public static boolean countrow() {
	String querystring="SELECT COUNT(*) FROM Participant p";
	Session s=HibernateUtil.getSessionFactory().openSession();
	Query q=s.createQuery(querystring);
	Long count = (Long)((org.hibernate.Query) q).uniqueResult();
	if(count <= 3) {
	System.out.println("number of rows "+count);
	return true;
	}
		System.out.println("number of rows "+count);
		return false;
	}
	
	
	
	}
 

