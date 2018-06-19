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
	@GeneratedValue(generator = "proyectodb_code_seq", strategy = GenerationType.AUTO)
	@SequenceGenerator(name = "proyectodb_code_seq", sequenceName = "proyectodb.proyectodb_code_seq")
	
	@Column(name = "id_admin")
	private Integer idAdmin;
	
	@Column (name= "username")
	private String susername;
	
	@Column (name= "pass")
	private String spassword;
	
	
}
