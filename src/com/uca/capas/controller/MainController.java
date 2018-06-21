package com.uca.capas.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import com.uca.capas.domain.Usuario;
import com.uca.capas.domain.UsuarioBeneficiario;
import com.uca.capas.domain.Admin;
import com.uca.capas.repositories.AdminRepository;
import com.uca.capas.repositories.UsuarioBenefRepository;
import com.uca.capas.repositories.UsuarioRepository;

@Controller
@SessionAttributes("tought")

public class MainController {
	@Autowired
	private AdminRepository adminRepository;
	@Autowired
	private UsuarioBenefRepository usuarioBenefRepository;
	@Autowired
	private UsuarioRepository usuarioRepository;
	Calendar cal = Calendar.getInstance();
	Usuario publico = new Usuario(1,"cesar","1234","cesarLima","1234d4",cal,12.00,true);
	@RequestMapping("/index")
	public ModelAndView initMain() {
		ModelAndView mv = new ModelAndView();
		List<Usuario> todos = usuarioRepository.findAll();
		List<Usuario> usuarios = usuarioRepository.findBeneficiarioByUsuario(todos.get(0).getIdUsuario());
		mv.addObject("usuarios", usuarios);
		mv.setViewName("agregarbeneficiario");
		return mv;
	}

	@RequestMapping(value="/agregarBenef", method = RequestMethod.POST)
	public ModelAndView agregarBenef(@RequestParam String numerocuenta) {
		ModelAndView mv = new ModelAndView();
		Usuario v = usuarioRepository.findBynumCuenta(numerocuenta);
		UsuarioBeneficiario a= new UsuarioBeneficiario(publico.getIdUsuario(),v.getIdUsuario());

			usuarioBenefRepository.save(a);
			mv.addObject("resultado", 0);
			mv.setViewName("transferencia");
		return mv;
	}

	
	
	@RequestMapping("/validate")
	public ModelAndView validate(@RequestParam String user, @RequestParam String pass){
		ModelAndView mav = new ModelAndView();
		
		String nvista ="";
		Admin a = adminRepository.findBySusernameAndSpassword(user, pass);
		//Usuario u = usuarioRepository.findByUsernameAndPassword(user, pass);
		
		if(a!=null) {
			nvista="admin";
		}
		/*else if(u!=null) {
			nvista="cuenta";
			
		}*/
		else {
			nvista="index";
		}
		
		mav.setViewName(nvista);

		return mav;
	}

}
