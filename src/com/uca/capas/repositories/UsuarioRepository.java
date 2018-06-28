package com.uca.capas.repositories;
import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.uca.capas.domain.Usuario;
import com.uca.capas.domain.UsuarioBeneficiario;

public interface UsuarioRepository extends JpaRepository<Usuario, Serializable>{
	
	public List<Usuario> findAll();
	@Query(nativeQuery =true, 
			value="SELECT * FROM usuario INNER JOIN "
					+ "usuarioxbeneficiario ON usuarioxbeneficiario.id_beneficiario = usuario.id_usuario"
					+ " WHERE usuario.estado=true AND usuarioxbeneficiario.id_usuario =:id_usuario")
	public List<Usuario> findBeneficiarioByUsuario(@Param("id_usuario") int id_usuario);
	/*@Query(nativeQuery =true, 
			value="SELECT * FROM usuario INNER JOIN "
					+ "usuarioxbeneficiario ON usuarioxbeneficiario.id_beneficiario != usuario.id_usuario"
					+ " WHERE usuario.estado=true AND usuarioxbeneficiario.id_usuario =:id_usuario")
	public List<Usuario> findBeneficiarioNOTUsuario(@Param("id_usuario") int id_usuario);*/
	@Query(nativeQuery =true, 
			value="SELECT * FROM usuario WHERE id_usuario !=:id_usuario and estado=true")
	public List<Usuario> findBeneficiarioNotEqualUsuario(@Param("id_usuario") int id_usuario);
	public Usuario findByusername(String user);
	public Usuario findBynumCuenta(String numcuenta);
	public Usuario findByUsernameAndPassword(String a, String b);
	public List<Usuario> findAllByOrderByIdUsuarioAsc();

	public List<Usuario> findBynumCuentaContaining(String numCuenta);

	public Usuario findByidUsuario(Integer id);
	@Modifying(clearAutomatically=true)
	@Query(nativeQuery=true,value = "Update public.usuario u set u.username=:user,u.password=:pass,u.nombre_completo=:nC,u.estado=:est where u.id_usuario=:id")
	public int updateUsuario(@Param("user") String user, @Param("pass") String pass, @Param("nC") String name,
			@Param("est") boolean estado, @Param("id") Integer id);
	
	@Query(nativeQuery=true,value="update public.operacion o set o.estado=2 where o.id_usuario=:id or o.id_benefiario=:id")
	public void updateOperacion(@Param("id") Integer id);

}
