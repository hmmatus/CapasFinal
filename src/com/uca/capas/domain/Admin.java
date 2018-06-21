package com.uca.capas.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
@Entity
@Table(schema = "public", name = "admin")
public class Admin {
	@Id
	@GeneratedValue(generator = "admin_id_admin_seq", strategy = GenerationType.AUTO)
	@SequenceGenerator(name = "admin_id_admin_seq", sequenceName = "public.admin_id_admin_seq", initialValue=1, allocationSize=1)
	
	@Column(name = "id_admin")
	private Integer idAdmin;
	
	@Column (name= "username")
	private String susername;
	
	@Column (name= "pass")
	private String spassword;

	public Integer getIdAdmin() {
		return idAdmin;
	}

	public void setIdAdmin(Integer idAdmin) {
		this.idAdmin = idAdmin;
	}

	public String getSusername() {
		return susername;
	}

	public void setSusername(String susername) {
		this.susername = susername;
	}

	public String getSpassword() {
		return spassword;
	}

	public void setSpassword(String spassword) {
		this.spassword = spassword;
	}
	
	
	
	
}
