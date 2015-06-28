package ar.edu.frba.anothercat.observers

import java.util.HashSet
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.frba.anothercat.usuario.Usuario
import ar.edu.frba.anothercat.receta.Receta


@Accessors
class RecetaMasConsultadaEnBaseAlSexoObserver implements ConsultaObserver {

	//List<MonitorConsultas> cantidadRecetasMujeres = new ArrayList<MonitorConsultas>
	//List<MonitorConsultas> cantidadRecetasHombres = new ArrayList<MonitorConsultas>
	public HashSet<Integer> cantidadRecetasHombres = new HashSet<Integer>
	public HashSet<Integer> cantidadRecetasMujeres = new HashSet<Integer>

	int contadorFemenino = 0
	int contadorMasculino = 0

	override seRealizoConsulta(Iterable<Receta> recetas, Usuario usuario) {

		if (usuario.getSexo.equals("m")) {
			cantidadRecetasMujeres.add(1)
			contadorFemenino++
		} else if (usuario.getSexo.equals("h")) {
			cantidadRecetasHombres.add(1)
			contadorMasculino++

		}

	}

}
