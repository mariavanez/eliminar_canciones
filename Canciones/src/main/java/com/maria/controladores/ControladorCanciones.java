package com.maria.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.maria.modelos.Cancion;
import com.maria.servicios.ServicioCanciones;

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
	
}
