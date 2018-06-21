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
@Table(schema = "public", name = "usuario")
public class Usuario {
	@Id
	@GeneratedValue(generator = "usuario_id_usuario_seq", strategy = GenerationType.AUTO)
	@SequenceGenerator(name = "usuario_id_usuario_seq", sequenceName = "public.usuario_id_usuario_seq",initialValue=1, allocationSize=1)
	
	@Column(name = "id_usuario")
	private Integer idUsuario;
	
	@Column(name = "username")
	private String username;
	
	@Column(name = "password")
	private String password;
	
	@Column(name = "nombre_completo")
	private String nomCompleto;
	
	@Column(name = "numero_cuenta")
	private String numCuenta;
	
	@DateTimeFormat(pattern = "yyyy/MM/DD")
	@Column(name = "fecha_creacion")
	private Calendar fCreacion;
	
	@Column(name = "saldo")
	private Double saldo;
	
	@Column(name = "estado")
	private Boolean uEstado;
	
	public String getUactivoEstado(){
		if(this.uEstado == null){
			return "";
		}
		else{
			if(this.uEstado) return "ACTIVO";
			else return "INACTIVO";
		}
	}
	public String getFechaCreacion(){
		if(this.fCreacion == null){
			return "";
		}
		else{
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			String shortdate = sdf.format(this.fCreacion.getTime());
			return shortdate;
		}
	}
	public Integer getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNomCompleto() {
		return nomCompleto;
	}
	public void setNomCompleto(String nomCompleto) {
		this.nomCompleto = nomCompleto;
	}
	public String getNumCuenta() {
		return numCuenta;
	}
	public void setNumCuenta(String numCuenta) {
		this.numCuenta = numCuenta;
	}
	public Calendar getfCreacion() {
		return fCreacion;
	}
	public void setfCreacion(Calendar fCreacion) {
		this.fCreacion = fCreacion;
	}
	public Double getSaldo() {
		return saldo;
	}
	public void setSaldo(Double saldo) {
		this.saldo = saldo;
	}
	public Boolean getuEstado() {
		return uEstado;
	}
	public void setuEstado(Boolean uEstado) {
		this.uEstado = uEstado;
	}
	public Usuario() {
	}
	public Usuario(Integer idUsuario, String username, String password, String nomCompleto, String numCuenta,
			Calendar fCreacion, Double saldo, Boolean uEstado) {
		super();
		this.idUsuario = idUsuario;
		this.username = username;
		this.password = password;
		this.nomCompleto = nomCompleto;
		this.numCuenta = numCuenta;
		this.fCreacion = fCreacion;
		this.saldo = saldo;
		this.uEstado = uEstado;
	}
	
}
