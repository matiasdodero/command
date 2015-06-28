package ar.edu.frba.anothercat.nuevoOrigDatos

import ar.edu.frba.anothercat.receta.Ingrediente
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RecetaJSON {
	String nombreReceta
	List<Ingrediente> ingredientes = new ArrayList<Ingrediente>
	int tiempoDePreparacion
	int totalCalorias
	String dificultad
	String autor
	int anioDeCreacion
}