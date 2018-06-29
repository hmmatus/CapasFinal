package com.uca.capas.domain;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(schema = "public", name = "operacion")
public class Operacion {
	@Id
	@GeneratedValue(generator = "operacion_id_operacion_seq", strategy = GenerationType.AUTO)
	@SequenceGenerator(name = "operacion_id_operacion_seq", sequenceName = "public.operacion_id_operacion_seq",initialValue=1, allocationSize=1)
	@Column(name = "id_operacion")
	private Integer idOperacion;
	
	@Column(name = "tipo_operacion")
	private Integer tipoOperacion;
	
	@DateTimeFormat(pattern = "yyyy/MM/DD hh:mm:ss")
	@Column(name = "fecha")
	private Calendar fOperacion;
	
	@Column (name= "monto")
	private Double monto;
	
	@Column (name= "concepto")
	private String concepto;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_usuario", referencedColumnName = "id_usuario")
	private Usuario idUsuario;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_beneficiario", referencedColumnName = "id_usuario")
	private Usuario idBeneficiario;
	
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

	public Integer getEstado() {
		return estado;
	}

	public void setEstado(Integer estado) {
		this.estado = estado;
	}

	public String getsEstado() {
		String result="";
		if(this.estado.equals(0)) {
			result = "Pending";
		}
		else if(this.estado.equals(1)) {
			result="Done";
		}
		else if(this.estado.equals(2)) {
			result = "Rejected";
		}
		return result;
	}
	
	public String getOTipoOperacion() {
		String result="";
		if(this.tipoOperacion==0)
			result="Credit";
		else if(this.tipoOperacion==1)
			result="Debit";
		else
			result="Transaction";
		return result;
	}

	public Usuario getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Usuario idUsuario) {
		this.idUsuario = idUsuario;
	}

	public Usuario getIdBeneficiario() {
		return idBeneficiario;
	}

	public void setIdBeneficiario(Usuario idBeneficiario) {
		this.idBeneficiario = idBeneficiario;
	}

	public Operacion(Integer idOperacion, Integer tipoOperacion, Calendar fOperacion, Double monto, String concepto,
			Usuario idUsuario, Usuario idBeneficiario, Integer estado) {
		super();
		this.idOperacion = idOperacion;
		this.tipoOperacion = tipoOperacion;
		this.fOperacion = fOperacion;
		this.monto = monto;
		this.concepto = concepto;
		this.idUsuario = idUsuario;
		this.idBeneficiario = idBeneficiario;
		this.estado = estado;
	}
	
	public Operacion(Integer tipoOperacion, Calendar fOperacion, Double monto, String concepto, Usuario idUsuario,
			Usuario idBeneficiario, Integer estado) {
		super();
		this.tipoOperacion = tipoOperacion;
		this.fOperacion = fOperacion;
		this.monto = monto;
		this.concepto = concepto;
		this.idUsuario = idUsuario;
		this.idBeneficiario = idBeneficiario;
		this.estado = estado;
	}
	public Operacion() {
	
	}
}
