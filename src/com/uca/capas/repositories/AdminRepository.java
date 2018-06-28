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

public interface AdminRepository extends JpaRepository<Admin, Serializable> {
	
	
	public Admin findBySusernameAndSpassword(String user,String pass);



}
