package com.uca.capas.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(schema = "public", name = "usuarioxbeneficiario")
public class UsuarioBeneficiario {
	@Id
	@GeneratedValue(generator = "tareados_code_seq", strategy = GenerationType.AUTO)
	@SequenceGenerator(name = "tareaos_code_seq", sequenceName = "tareados.tareados_code_seq")
	
	@Column(name = "id_usuarioxbeneficiario")
	private Integer idUsuarioBeneficiario;
	
	@Column(name = "id_usuario")
	private Integer idUsuario;
	
	@Column(name = "id_beneficiario")
	private Integer idBeneficiario;

	public Integer getIdUsuarioBeneficiario() {
		return idUsuarioBeneficiario;
	}

	public void setIdUsuarioBeneficiario(Integer idUsuarioBeneficiario) {
		this.idUsuarioBeneficiario = idUsuarioBeneficiario;
	}

	public Integer getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}

	public Integer getIdBeneficiario() {
		return idBeneficiario;
	}

	public void setIdBeneficiario(Integer idBeneficiario) {
		this.idBeneficiario = idBeneficiario;
	}
	
	
}
