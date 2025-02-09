package com.maria.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.maria.modelos.Cancion;
import com.maria.servicios.ServicioCanciones;

import jakarta.validation.Valid;

@Controller
public class ControladorCanciones {
	
	@Autowired 
	private ServicioCanciones serv;
	
	@GetMapping("/canciones")
	public String desplegarCanciones(Model model) {
		model.addAttribute("cancionesLista", serv.obtenerTodasLasCanciones());
		return "canciones.jsp";
	}
	
	@GetMapping("/canciones/detalle/{idCancion}")
	public String desplegarDetalleCancion(@PathVariable(value="idCancion") Long idCancion,
										  Model model) {
		Cancion cancion = serv.obtenerCancionPorId(idCancion);
		model.addAttribute("cancion", cancion);
		return "detalleCancion.jsp";
		
	}
	
	@GetMapping("/canciones/formulario/agregar")
	public String formularioAgregarCancion(Model model) {
		
		model.addAttribute("cancion", new Cancion());
		return "agregarCancion.jsp";
	}
	
	@PostMapping("/canciones/procesa/agregar")
	public String procesarAgregarCancion(@Valid @ModelAttribute("cancion") Cancion cancion,
										BindingResult resultado,
										Model model) {
		
		if(resultado.hasErrors()) {
			model.addAttribute("cancion", cancion);
			return "agregarCancion.jsp";
		}
		
		serv.agregarCancion(cancion);
		return "redirect:/canciones";
	}
	
}
