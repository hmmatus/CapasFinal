package com.uca.capas.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.uca.capas.domain.Admin;
import com.uca.capas.domain.Operacion;
import com.uca.capas.domain.Usuario;
import com.uca.capas.repositories.AdminRepository;
import com.uca.capas.repositories.OperacionRepository;
import com.uca.capas.repositories.UsuarioRepository;

@Controller
@SessionAttributes("tought")

public class TransferenciaController {
	

	@Autowired
	private AdminRepository adminRepository;
	
	@Autowired
	private UsuarioRepository usuarioRepository;
	
	@Autowired
	private OperacionRepository operacionRepository;
	
	
	
	
	@RequestMapping("/validate2")
	public ModelAndView validate(@RequestParam String user, @RequestParam String pass){
		ModelAndView mav = new ModelAndView();
		String nvista ="";
		Admin a = adminRepository.findBySusernameAndSpassword(user, pass);
		Usuario u = usuarioRepository.findByUsernameAndPassword(user, pass);
		if(a!=null) {
			nvista="admin";
		}
		else if(u!=null) {
			if(!u.getuEstado()) {
				nvista="index";
			}
			else {
				nvista="cuenta";
			}

		}
		else {
			nvista="mtotransferencia";
		}
		
		System.out.println(nvista);
		mav.setViewName(nvista);

		return mav;
	}
	
	@RequestMapping("/pendienteTrans")
	public ModelAndView updateTrans(){
		ModelAndView mav = new ModelAndView();
		List<Operacion> o = operacionRepository.findByEstado(2);
		
		
		mav.addObject("operacion", o);

		
		mav.setViewName("mtotransferencia");

		return mav;
	}
	
	@RequestMapping("/accept")
	public ModelAndView acceptTrans(@RequestParam String id){
		ModelAndView mav = new ModelAndView();
		Operacion o = operacionRepository.findOne(Integer.parseInt(id));
		o.setEstado(1);
	
		operacionRepository.saveAndFlush(o);
		System.out.println("Loco");

		mav.setViewName("mtotransferencia");
		return mav;
	}
	
	@RequestMapping("/deny")
	public ModelAndView denyTrans(@RequestParam String id_r){
		ModelAndView mav = new ModelAndView();
		Operacion o = operacionRepository.findOne(Integer.parseInt(id_r));
		o.setEstado(2);
		operacionRepository.saveAndFlush(o);
		
		//mav.addObject("operacion", o);

		
		mav.setViewName("mtotransferencia");

		return mav;
	}

}
