package com.uca.capas.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.uca.capas.domain.Admin;

public interface AdminRepository  extends JpaRepository<Admin, Integer> {
	public Admin findBySusernameAndSpassword(String user, String pass);


}
