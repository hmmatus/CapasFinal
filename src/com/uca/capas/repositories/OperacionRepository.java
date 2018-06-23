package com.uca.capas.repositories;

import java.util.Calendar;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.uca.capas.domain.Operacion;
import com.uca.capas.domain.UsuarioBeneficiario;

public interface OperacionRepository extends JpaRepository<Operacion,Integer> {
	
	//Cuando las 2 fechas no vengan vacias
	public List<Operacion> findByfOperacionBetweenAndIdUsuario(Calendar fingre,Calendar fvenc,String idUsuario);
	
	//Cuando fvenc venga vacio
	public List<Operacion> findByfOperacionGreaterThanAndIdUsuario(Calendar fingre,String idUsuario);
	
	//Cuando fingre venga vacio
	public List<Operacion> findByfOperacionLessThanAndIdUsuario(Calendar fvenc,String idUsuario);
	public Operacion save(Operacion x);
}
