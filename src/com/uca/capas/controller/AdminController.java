package com.uca.capas.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.uca.capas.domain.Usuario;
import com.uca.capas.repositories.AdminRepository;

@Controller
public class AdminController {

	@Autowired
	AdminRepository adminRepository;



	// vista inicial
	@RequestMapping("/admin")
	public ModelAndView showAdmin() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin");
		return mav;
	}

	@RequestMapping("/usuarios")
	public ModelAndView searchUser(@RequestParam(value = "cor") String numCuenta) {
		ModelAndView mav = new ModelAndView();
		List<Usuario> usuarios = adminRepository.findBynumCuentaContaining(numCuenta);
		mav.addObject("users", usuarios);
		mav.setViewName("admin");
		return mav;
	}

	@RequestMapping("/todos")
	public ModelAndView showAll() {
		ModelAndView mav = new ModelAndView();
		List<Usuario> usuarios = adminRepository.findAllByOrderByIdUsuarioAsc();
		mav.addObject("users", usuarios);
		mav.setViewName("admin");
		return mav;
	}
	
	@RequestMapping(value = "/crear", method = RequestMethod.GET)
	public ModelAndView createUser() {
		ModelAndView mav = new ModelAndView();
		Usuario user = new Usuario();
		mav.addObject("newUser", user);
		mav.setViewName("new_user");
		return mav;
	}
	
	@RequestMapping(value = "/actualizar",method = RequestMethod.POST)
	public ModelAndView updateUser(@ModelAttribute(value = "newUser") Usuario user) {
		ModelAndView mav=new ModelAndView();
		Usuario user2=adminRepository.findByidUsuario(user.getIdUsuario());
		user.setfCreacion(user2.getfCreacion());
		try {
			/*Integer res = adminRepository.updateUsuario(user.getUsername(), user.getPassword(), user.getNomCompleto(),
					user.getuEstado(), user.getIdUsuario());*/
			adminRepository.save(user);
			}
			catch(Exception e){
				e.printStackTrace();
			}
			mav.setViewName("admin");
		return mav;
	}
	

	@RequestMapping(value = "/editar", method = RequestMethod.GET)
	public ModelAndView editUser(@RequestParam(value = "ide") Integer id) {
		ModelAndView mav = new ModelAndView();
		Usuario user = adminRepository.findByidUsuario(id);
		mav.addObject("newUser", user);
		mav.setViewName("edit");
		return mav;
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView saveUser(@ModelAttribute(value="newUser") Usuario user) {
		ModelAndView mav = new ModelAndView();
		Calendar cal=Calendar.getInstance();
		cal.add(Calendar.DATE,1);
		SimpleDateFormat format1 = new SimpleDateFormat("dd-MM-yyyy");
		String formatted = format1.format(cal.getTime());
		try {
			if(user.getuEstado()==false) {
				adminRepository.updateOperacion(user.getIdUsuario());
			}
			cal.setTime(format1.parse(formatted));
			user.setfCreacion(cal);
			adminRepository.save(user);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		mav.setViewName("admin");
		return mav;
	}

}
