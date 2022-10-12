package ipsas.model;
/**
* @Author -- Moez Kchaou
*/
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name="participant")
public class Participant {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID_PARTICIPANT")
	private int id_participant;
	@Column(name = "PARTICIPANT")
	private String participant;
	@ManyToMany (mappedBy = "participants" ) 
	private Collection <Convention> conventions = new ArrayList<Convention>();
	
	public Collection<Convention> getConventions() {
		return conventions;
	}
	public void setConventions(Collection<Convention> conventions) {
		this.conventions = conventions;
	}
	public long getId_participant() {
		return id_participant;
	}
	public void setId_participant(int id_participant) {
		this.id_participant = id_participant;
	}
	public String getParticipant() {
		return participant;
	}
	public void setParticipant(String participant) {
		this.participant = participant;
	}
	public Participant() {
		super();
		
		this.participant = "";
	}
	public Participant(int id_participant,String participant) {
		super();
		this.id_participant =id_participant;
		this.participant = participant;
	}
	
}
