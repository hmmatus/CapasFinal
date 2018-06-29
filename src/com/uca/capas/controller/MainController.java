package com.uca.capas.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import com.uca.capas.domain.Usuario;
import com.uca.capas.domain.UsuarioBeneficiario;
import com.uca.capas.domain.Admin;
import com.uca.capas.domain.Operacion;
import com.uca.capas.repositories.AdminRepository;
import com.uca.capas.repositories.OperacionRepository;
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
	@Autowired
	private OperacionRepository operacionRepository;
	Calendar cal = Calendar.getInstance();
	Usuario publico = new Usuario();
	
	
	@RequestMapping("/index")
	public ModelAndView initMain() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	@RequestMapping("/cuenta")
	public ModelAndView cuenta() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("cuenta");
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
			if(!u.getuEstado()) {
				nvista="index";
			}
			else {
				nvista="cuenta";
				publico.setIdUsuario(u.getIdUsuario());
				publico.setUsername(u.getUsername());
				publico.setNomCompleto(u.getNomCompleto());
				publico.setNumCuenta(u.getNumCuenta());
				publico.setPassword(u.getPassword());
				publico.setSaldo(u.getSaldo());
				publico.setfCreacion(u.getfCreacion());
				publico.setuEstado(u.getuEstado());
			}
		}
		else {
			nvista="index";
			mav.addObject("state", 0);


		}

		//System.out.println(nvista);
		mav.setViewName(nvista);

		return mav;
	}
	
	@RequestMapping("/pendienteTrans")
	public ModelAndView updateTrans(){
		ModelAndView mav = new ModelAndView();
		//List<Operacion> o = operacionRepository.findByEstado(0);
		
		List<Operacion> o = operacionRepository.findByEstadoAndIdBeneficiario(0,publico);

		mav.addObject("operacion", o);		
		mav.setViewName("mtotransferencia");

		return mav;
	}
	
	@RequestMapping("/accept")
	public ModelAndView acceptTrans(@RequestParam String id){
		ModelAndView mav = new ModelAndView();
		Operacion o = operacionRepository.findOne(Integer.parseInt(id));
		o.setEstado(1);
		
		
		
		o.getIdBeneficiario().setSaldo(o.getIdBeneficiario().getSaldo()+o.getMonto());
		operacionRepository.saveAndFlush(o);
		usuarioRepository.saveAndFlush(o.getIdBeneficiario());

		
		//List<Operacion> o1 = operacionRepository.findByEstado(0);
		List<Operacion> o1 = operacionRepository.findByEstadoAndIdBeneficiario(0,publico);
		
		mav.addObject("operacion", o1);		
		mav.setViewName("mtotransferencia");
		return mav;
	}
	
	@RequestMapping("/deny")
	public ModelAndView denyTrans(@RequestParam String id_r){
		ModelAndView mav = new ModelAndView();
		Operacion o = operacionRepository.findOne(Integer.parseInt(id_r));
		o.setEstado(2);
		
		
		o.getIdUsuario().setSaldo(o.getIdUsuario().getSaldo()+o.getMonto());
		operacionRepository.saveAndFlush(o);
		usuarioRepository.saveAndFlush(o.getIdUsuario());
		
		//List<Operacion> o2 = operacionRepository.findByEstado(0);
		List<Operacion> o2 = operacionRepository.findByEstadoAndIdBeneficiario(0,publico);
		mav.addObject("operacion", o2);		
		mav.setViewName("mtotransferencia");

		return mav;
	}
	
	@RequestMapping("/transfeBenef")
	public ModelAndView benef() {
		ModelAndView mv = new ModelAndView();
		List<Usuario> beneficiario = usuarioRepository.findBeneficiarioByUsuario(publico.getIdUsuario());
		mv.addObject("usuario", publico);
		mv.addObject("beneficiario", beneficiario);
		mv.setViewName("transferencia");
		return mv;
	}
	@RequestMapping("/listaBenef")
	public ModelAndView listaBenef() {
		ModelAndView mv = new ModelAndView();
		/*List<Usuario> usuarios = usuarioRepository.findBeneficiarioNOTUsuario(publico.getIdUsuario());
		if(usuarios.isEmpty()) {*/
			List<Usuario> todos = usuarioRepository.findBeneficiarioNotEqualUsuario(publico.getIdUsuario());
			mv.addObject("usuarios", todos);
	/*	}
		else {
			mv.addObject("usuarios", usuarios);
		}		*/
		mv.setViewName("agregarbeneficiario");
		return mv;
	}

	@RequestMapping(value="/agregarBenef", method = RequestMethod.POST)
	public ModelAndView agregarBenef(@RequestParam String numerocuenta) {
		ModelAndView mv = new ModelAndView();
		Usuario v = usuarioRepository.findBynumCuenta(numerocuenta);
		//UsuarioBeneficiario a= new UsuarioBeneficiario(publico.getIdUsuario(),v.getIdUsuario());
		List<Usuario> beneficiario = usuarioRepository.findBeneficiarioByUsuario(publico.getIdUsuario()); //usuarios beneficiarios
			for(int i=0; i<beneficiario.size();i++) {
			if (v.getIdUsuario()==beneficiario.get(i).getIdUsuario()) { //comparo si el id que acabo de mandar ya es beneficiario
				mv.addObject("us","Ese usuario ya es tu beneficiario, escoge otro");
				List<Usuario> todos = usuarioRepository.findBeneficiarioNotEqualUsuario(publico.getIdUsuario());
				mv.addObject("usuarios", todos);
				mv.setViewName("agregarbeneficiario");
				return mv;
			}
			}
			UsuarioBeneficiario a= new UsuarioBeneficiario(publico.getIdUsuario(),v.getIdUsuario());
			usuarioBenefRepository.save(a);
			mv.addObject("resultado", 0);
			mv.addObject("usuario", publico);
			List<Usuario> beneficiario2 = usuarioRepository.findBeneficiarioByUsuario(publico.getIdUsuario());
			mv.addObject("beneficiario", beneficiario2);
			mv.setViewName("transferencia");
		return mv;
	}
	@RequestMapping(value="/agregarTransferencia", method = RequestMethod.POST)
	public ModelAndView agregarTransferencia(@RequestParam String monto, @RequestParam String concepto, @RequestParam String benef) {
		ModelAndView mv = new ModelAndView();
		Calendar cal = Calendar.getInstance();
		Double mont= Double.parseDouble(monto);
		cal.add(Calendar.DATE, 1);
		SimpleDateFormat format1 = new SimpleDateFormat("dd-MM-yyyy");
		String formatted = format1.format(cal.getTime());
		try {
			cal.setTime(format1.parse(formatted));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Usuario beneficiario = usuarioRepository.findBynumCuenta(benef);
		Operacion a = new Operacion(1,cal,mont,concepto,publico,beneficiario,0);
		operacionRepository.save(a);
		Double nuevoSaldo = publico.getSaldo() - Double.parseDouble(monto);
		
		publico.setSaldo(nuevoSaldo);
		publico.setfCreacion(cal);
		usuarioRepository.save(publico);
		System.out.println(beneficiario.getUsername());	
		mv.addObject("fecha",formatted);
		mv.addObject("nuevoSaldo",nuevoSaldo);
		mv.addObject("beneficiario", beneficiario);
		mv.addObject("concepto",concepto);
		mv.addObject("monto",monto);
		mv.setViewName("postTransferencia");
		return mv;
	}
	@Autowired
	public OperacionRepository operacionRepo;
	
	
	@RequestMapping("/estado")
	public ModelAndView estadoInit() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("estado_cuenta");
		List<Operacion> operaciones=operacionRepo.findByIdUsuario(publico);
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
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
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
