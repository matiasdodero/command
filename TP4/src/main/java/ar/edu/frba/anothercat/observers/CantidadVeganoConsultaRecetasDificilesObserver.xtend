package ar.edu.frba.anothercat.observers


import ar.edu.frba.anothercat.usuario.CondicionPreexistente


import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.Usuario
import ar.edu.frba.anothercat.usuario.Vegano
import java.util.HashSet

@Accessors
class CantidadVeganoConsultaRecetasDificilesObserver implements ConsultaObserver {

	CondicionPreexistente vegano = new Vegano
	
	//List<MonitorConsultas> recetasVeganos = new ArrayList<MonitorConsultas>
	public HashSet<Integer> recetasVeganos = new HashSet<Integer>
	
	public int cantidadUsuariosVeganos = 0
	
	

	override seRealizoConsulta(Iterable<Receta> recetas, Usuario usuario) {
		
		

		if (usuario.getPrecondiciones.exists[condicion|condicion.equals(vegano)] &&
			recetas.exists[receta | receta.dificultadReceta().equals("d")]) {
			recetasVeganos.add(1)	
			cantidadUsuariosVeganos += 1
		}

	}
}
