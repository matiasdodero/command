package ar.edu.frba.anothercat.observers

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.Usuario
import java.util.HashSet

@Accessors
class RecetaMasConsultadaObserver implements ConsultaObserver {

	int contadorRecetasConsultadas = 0
	String nombrePlato
	String nombreConsulta
	HashSet<Receta> recetasConsultadas = new HashSet<Receta>
	//List<MonitorConsultas> recetasConsultadas = new ArrayList<MonitorConsultas>
	
	override seRealizoConsulta(Iterable<Receta> recetas, Usuario usuario) {

		if (!(recetasConsultadas.exists[unaReceta|unaReceta.equals(recetas.filter[rec|rec.equals(unaReceta)])])) {
			val recetaQueNoExiste = new Receta
			recetasConsultadas.add(recetaQueNoExiste)
			contadorRecetasConsultadas+=1
		} else {

			contadorRecetasConsultadas += 1
		}

	}

}
