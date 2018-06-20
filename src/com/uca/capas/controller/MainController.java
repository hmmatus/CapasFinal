package com.uca.capas.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import com.uca.capas.domain.Usuario;
import com.uca.capas.domain.Admin;
import com.uca.capas.domain.Usuario;
import com.uca.capas.repositories.AdminRepository;
import com.uca.capas.repositories.UsuarioRepository;

@Controller
@SessionAttributes("tought")

public class MainController {
	@Autowired
	private AdminRepository adminRepository;
	
	@Autowired
	private UsuarioRepository usuarioRepository;
	

	@RequestMapping("/index")
	public ModelAndView initMain() {
		ModelAndView mv = new ModelAndView();
		List<Usuario> usuarios = usuarioRepository.findAll();
		mv.addObject("usuarios", usuarios);
		mv.setViewName("agregarbeneficiario");
		return mv;
	}

	@RequestMapping("/numCuentaBenef")
	public ModelAndView numCuentaBenef(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String nombrebenef =request.getParameter("name");
		Usuario v = usuarioRepository.findByusername(nombrebenef);
		mv.addObject("beneficiario", v);
		mv.setViewName("agregarbeneficiario");
		return mv;
	}

	
	
	@RequestMapping("/validate")
	public ModelAndView validate(@RequestParam String user, @RequestParam String pass){
		ModelAndView mav = new ModelAndView();
		
		String nvista ="";
		Admin a = adminRepository.findBySusernameAndSpassword(user, pass);
		Usuario u = usuarioRepository.findByUsernameAndPassword(user, pass);
		
		if(a!=null) {
			nvista="admin";
		}
		else if(u!=null) {
			nvista="cuenta";
			
		}
		else {
			nvista="index";
		}
		
		mav.setViewName(nvista);

		return mav;
	}

}
