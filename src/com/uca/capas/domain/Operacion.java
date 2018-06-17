package com.uca.capas.domain;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(schema = "public", name = "operacion")
public class Operacion {
	@Id
	@GeneratedValue(generator = "tareados_code_seq", strategy = GenerationType.AUTO)
	@SequenceGenerator(name = "tareaos_code_seq", sequenceName = "tareados.tareados_code_seq")
	
	@Column(name = "id_operacion")
	private Integer idOperacion;
	
	@Column(name = "tipo_operacion")
	private Integer tipoOperacion;
	
	@DateTimeFormat(pattern = "yyyy/MM/DD")
	@Column(name = "fecha")
	private Calendar fOperacion;
	
	@Column (name= "monto")
	private Double monto;
	
	@Column (name= "concepto")
	private String concepto;
	
	@Column (name= "id_usuario")
	private String idUsuario;
	
	@Column (name= "estado")
	private Integer estado;
	
	public String getFechaOperacion(){
		if(this.fOperacion == null){
			return "";
		}
		else{
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			String shortdate = sdf.format(this.fOperacion.getTime());
			return shortdate;
		}
	}

	public Integer getIdOperacion() {
		return idOperacion;
	}

	public void setIdOperacion(Integer idOperacion) {
		this.idOperacion = idOperacion;
	}

	public Integer getTipoOperacion() {
		return tipoOperacion;
	}

	public void setTipoOperacion(Integer tipoOperacion) {
		this.tipoOperacion = tipoOperacion;
	}

	public Calendar getfOperacion() {
		return fOperacion;
	}

	public void setfOperacion(Calendar fOperacion) {
		this.fOperacion = fOperacion;
	}

	public Double getMonto() {
		return monto;
	}

	public void setMonto(Double monto) {
		this.monto = monto;
	}

	public String getConcepto() {
		return concepto;
	}

	public void setConcepto(String concepto) {
		this.concepto = concepto;
	}

	public String getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(String idUsuario) {
		this.idUsuario = idUsuario;
	}

	public Integer getEstado() {
		return estado;
	}

	public void setEstado(Integer estado) {
		this.estado = estado;
	}
	
}
