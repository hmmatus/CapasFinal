package com.uca.capas.repositories;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.uca.capas.domain.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Integer>{
	
	public List<Usuario> findAll();
	public Usuario findByusername(String user);
	public Usuario findByUsernameAndPassword(String a, String b);
}
