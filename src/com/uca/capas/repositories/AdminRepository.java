package com.uca.capas.repositories;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.uca.capas.domain.Admin;
import com.uca.capas.domain.Operacion;
import com.uca.capas.domain.Usuario;

public interface AdminRepository extends JpaRepository<Usuario, Serializable> {
	public List<Usuario> findAllByOrderByIdUsuarioAsc();

	public List<Usuario> findBynumCuentaContaining(String numCuenta);

	public Usuario findByidUsuario(Integer id);
	
	public Admin findBySusernameAndSpassword(String user,String pass);


	@Modifying(clearAutomatically=true)
	@Query(nativeQuery=true,value = "Update public.usuario u set u.username=:user,u.password=:pass,u.nombre_completo=:nC,u.estado=:est where u.id_usuario=:id")
	public int updateUsuario(@Param("user") String user, @Param("pass") String pass, @Param("nC") String name,
			@Param("est") boolean estado, @Param("id") Integer id);
	
	@Query(nativeQuery=true,value="update public.operacion o set o.estado=2 where o.id_usuario=:id or o.id_benefiario=:id")
	public void updateOperacion(@Param("id") Integer id);
}
