package com.maria.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

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
	
	@GetMapping("/canciones/formulario/editar/{id}")
	public String formularioEditarCancion(@PathVariable("id") Long id,
										  @ModelAttribute("cancion") Cancion cancion,
										  Model model) {
		
		Cancion cancionEditada = serv.obtenerCancionPorId(id);
		model.addAttribute("cancion", cancionEditada);
		return "editarCancion.jsp";
	}
	
	@PutMapping("/canciones/procesa/editar/{id}")
	public String procesarEditarCancion(@Valid @ModelAttribute("cancion") Cancion cancionEditada,
										BindingResult result,
							            Model model) {
		
		if(result.hasErrors()) {
			model.addAttribute("cancion", cancionEditada);
			return "editarCancion.jsp";
		} else {
			serv.actualizaCancion(cancionEditada);
			return "redirect:/canciones";
		}
		
	}
	
	@DeleteMapping("canciones/eliminar/{id}")
	public String procesarEliminarCancion(@PathVariable("id") Long id) {
		serv.eliminaCancion(id);
		return "redirect:/canciones";
	}
}
