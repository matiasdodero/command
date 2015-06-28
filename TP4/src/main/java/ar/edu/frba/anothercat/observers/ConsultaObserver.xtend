package ar.edu.frba.anothercat.observers

import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.Usuario

public interface ConsultaObserver {
	
	
	def void seRealizoConsulta(Iterable<Receta> recetas , Usuario usuario)
	
}