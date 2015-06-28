
package ar.edu.frba.anothercat.observers

import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.Usuario
import java.util.Calendar
import java.util.GregorianCalendar
import java.util.HashSet

class CantidadDeConsultaPorHoraDelDiaObserver implements ConsultaObserver {
	
	//List<MonitorConsultas> cantidadRecetasPorHora = new ArrayList<MonitorConsultas>
	
	public HashSet<Integer> cantidadRecetasPorHora = new HashSet<Integer>
	public int contadorRecetas=0
	
	Calendar calendario = new GregorianCalendar()
	
	int hora = calendario.get(Calendar.HOUR_OF_DAY)
	
	
	
	
	override seRealizoConsulta(Iterable<Receta> recetas, Usuario usuario) {		
		
		if(cantidadRecetasPorHora.contains(hora)){
			cantidadRecetasPorHora +=1
		}
		else{
		cantidadRecetasPorHora.add(hora)
		cantidadRecetasPorHora+=1
		}
	}
	

		
		
	
}