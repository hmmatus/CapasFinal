package com.uca.capas.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.uca.capas.domain.UsuarioBeneficiario;

public interface UsuarioBenefRepository extends JpaRepository<UsuarioBeneficiario, Integer>{

	public UsuarioBeneficiario save(UsuarioBeneficiario x);
}
