package com.uca.capas.repositories;

import java.util.Calendar;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.uca.capas.domain.Operacion;
import com.uca.capas.domain.Usuario;

public interface OperacionRepository extends JpaRepository<Operacion,Integer> {
	
	//Cuando las 2 fechas no vengan vacias
	public List<Operacion> findByfOperacionBetween(Calendar fingre,Calendar fvenc);
	
	//Cuando fvenc venga vacio
	public List<Operacion> findByfOperacionGreaterThan(Calendar fingre);
	
	//Cuando fingre venga vacio
	public List<Operacion> findByfOperacionLessThan(Calendar fvenc);
	
	public List<Operacion> findByEstado(Integer num);
	public List<Operacion> findByIdUsuario(Usuario num);

}
