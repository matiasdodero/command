package ar.edu.frba.anothercat.nuevoOrigDatos

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ParametroBusqueda {
	String nombreABuscar
	String dificultad
	List<String> palabrasClave = new ArrayList<String>
	
	
}