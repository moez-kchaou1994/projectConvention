package ipsas.model;
/**
* @Author -- Moez Kchaou
*/

import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.Table;

@Entity
@Table(name="user")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID_USER")
	private long id_user;
	@Column(name = "FIRST_NAME")
	private String first_name;
	@Column(name = "LAST_NAME")
	private String last_name; 
	@Column(name = "EMAIL")
	private String email;
	@Column(name = "PASSWORD")
	private String pwd;
	public long getId_user() {
		return id_user;
	}
	public void setId_user(long id_user) {
		this.id_user = id_user;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public User() {
		super();
		this.first_name = "";
		this.last_name = "";
		this.email = "";
		this.pwd = "";
	}
	public User(String first_name, String last_name, String email, String pwd) {
		super();
		this.first_name = first_name;
		this.last_name = last_name;
		this.email = email;
		this.pwd = pwd;
	}
	

}
