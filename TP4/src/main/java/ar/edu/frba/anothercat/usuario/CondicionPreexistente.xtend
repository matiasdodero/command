package ar.edu.frba.anothercat.usuario

import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.precondicionTipo

public interface CondicionPreexistente {

	def boolean cumpleValidacion(Usuario unUsuario)

	def boolean subsanasteCondicionesPreEx(Usuario usuario)

	def boolean esInadecuadaPara(Receta unaReceta)
	
	def precondicionTipo decimeQueCondicionTenes()

}