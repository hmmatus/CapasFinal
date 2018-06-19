package com.uca.capas.repositories;

<<<<<<< HEAD
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.uca.capas.domain.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Integer>{
	
	public List<Usuario> findAll();
	public Usuario findByusername(String user);
=======
public interface UsuarioRepository {
>>>>>>> branch 'master' of https://github.com/hmmatus/CapasFinal.git

}
