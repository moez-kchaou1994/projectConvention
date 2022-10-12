package ipsas.model;
/**
* @Author -- Moez Kchaou
*/
import java.util.ArrayList;

import java.util.List;



import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import javax.persistence.Table;



@Entity
//@NamedQuery("findall","FROM CONVENTION")
@Table(name="convention")
public class Convention {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID_CONV")
	private int id_conv;
	@Column(name="TYPE")
	private String type;
	@Column(name="DATE_EDITION")
 
	private String date_edition;
	@Column(name="DATE_SIGNATURE")
 

	private String date_signature;
	@Column(name="OBJECT")
	private String object;
	@Column(name="START_DATE")
 
	private String start_date;
	@Column(name="DATE_EXPIRY")
 
	private String date_expiry;
	@ManyToMany
	private List<Participant> participants = new ArrayList<Participant>();
	
	
	public List<Participant> getParticipants() {
		return participants;
	}
	public void setParticipants(List<Participant> participants) {
		this.participants = participants;
		
	}
	public boolean addParticipant(Participant participant) {
		if(this.participants.size() < 4) {
			this.participants.add(participant);
			return true;
		}
		else {
			return false;
		}
	}
	
	public String getDate_edition() {
		return date_edition;
	}
	public void setDate_edition(String date_edition) {
		this.date_edition = date_edition;
	}
	public String getDate_signature() {
		return date_signature;
	}
	public void setDate_signature(String date_signature) {
		this.date_signature = date_signature;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getDate_expiry() {
		return date_expiry;
	}
	public void setDate_expiry(String date_expiry) {
		this.date_expiry = date_expiry;
	}
	public int getId_conv() {
		return id_conv;
	}
	public void setId_conv(int id_conv) {
		this.id_conv = id_conv;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public String getObject() {
		return object;
	}
	public void setObject(String object) {
		this.object = object;
	}
	
	public Convention(int id_conv, String type,  String date_edition,  String date_signature, String object,
			 String start_date,  String date_expiry) {
		super();
		this.id_conv = id_conv;
		this.type = type;
		this.date_edition = date_edition;
		this.date_signature = date_signature;
		this.object = object;
		this.start_date = start_date;
		this.date_expiry = date_expiry;
		
	}
	public Convention() {
		super();
		
		this.type = "";
		this.date_edition = "";
		this.date_signature ="";
		this.object = "";
		this.start_date = " ";
		this.date_expiry ="";
		
	}
	
	
	
	
	
	

}
