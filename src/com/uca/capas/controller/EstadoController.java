package com.uca.capas.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.uca.capas.domain.Operacion;
import com.uca.capas.repositories.OperacionRepository;

@Controller
public class EstadoController {
	
	@Autowired
	public OperacionRepository operacionRepo;
	
	
	@RequestMapping("/estado")
	public ModelAndView estadoInit() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("estado_cuenta");
		List<Operacion> operaciones=operacionRepo.findAll();
		mav.addObject("ope",operaciones);
		return mav;
	}
	
	@RequestMapping("/busqueda")
	public ModelAndView busqueda(@RequestParam(value = "fingre") String fingre,
			@RequestParam(value = "fvenc") String fvenc) {
		ModelAndView mav = new ModelAndView();
		List<Operacion> ope;
		Calendar cal = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-dd-mm");
		//Si los dos no vienen vacios
		if(!fingre.equals("") && !fvenc.equals("")) {
			try {
				cal.setTime(sdf.parse(fingre));
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			try {
				cal2.setTime(sdf.parse(fvenc));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ope = operacionRepo.findByfOperacionBetween(cal,cal2);
			mav.addObject("ope",ope);
			mav.setViewName("estado_cuenta");
			
		}
		//Si fingre viene vacio
		else if(fingre.equals("") && !fvenc.equals("")) {
			try {
				cal2.setTime(sdf.parse(fvenc));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ope = operacionRepo.findByfOperacionLessThan(cal2);
			mav.addObject("ope",ope);
			mav.setViewName("estado_cuenta");
		}
		//Si fvenc viene vacio
		else if(!fingre.equals("") && fvenc.equals("")) {
			try {
				cal.setTime(sdf.parse(fingre));
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			ope = operacionRepo.findByfOperacionGreaterThan(cal);
			mav.addObject("ope",ope);
			mav.setViewName("estado_cuenta");
		}
		//En caso que todo falle
		else {
			mav.addObject("error","El formato de busqueda no es valido");
			mav.setViewName("estado_cuenta");
		}
		
		return mav;
		
	}

}
