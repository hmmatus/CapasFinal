package com.uca.capas.repositories;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.uca.capas.domain.Usuario;
import com.uca.capas.domain.UsuarioBeneficiario;

public interface UsuarioRepository extends JpaRepository<Usuario, Integer>{
	
	public List<Usuario> findAll();
	@Query(nativeQuery =true, 
			value="SELECT * FROM usuario INNER JOIN "
					+ "usuarioxbeneficiario ON usuarioxbeneficiario.id_beneficiario = usuario.id_usuario"
					+ " WHERE usuario.estado=true AND usuarioxbeneficiario.id_usuario =:id_usuario")
	public List<Usuario> findBeneficiarioByUsuario(@Param("id_usuario") int id_usuario);
	public Usuario findByusername(String user);
	public Usuario findBynumCuenta(String numcuenta);
	public Usuario findByUsernameAndPassword(String a, String b);

}
