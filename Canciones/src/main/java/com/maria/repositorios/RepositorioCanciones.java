package com.maria.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.maria.modelos.Cancion;

@Repository
public interface RepositorioCanciones extends CrudRepository<Cancion, Long> {

	List<Cancion> findAll();
	
	Cancion save(Cancion nuevaCancion);
}
