package ar.edu.frba.anothercat.filtrosDeUsuario

import java.util.List
import java.util.ArrayList
import ar.edu.frba.anothercat.usuario.Usuario
import ar.edu.frba.anothercat.receta.Receta

class FiltroCondicionesPre implements FiltroReceta{
	

	override filtramePor (List<Receta> recetas, Usuario unUsuario){
		
		var List<Receta> recetaFiltrada = new ArrayList<Receta>
		
		recetaFiltrada =  (recetas.filter[ unaReceta| !( unUsuario.precondiciones.exists[ unaPrecondicion | unaPrecondicion.esInadecuadaPara(unaReceta) ] ) ]  ).toList()
		
		return recetaFiltrada
	}
	
	override boolean filtramePorMisFiltros (Receta unaReceta, Usuario unUsuario){
			
		return (unUsuario.precondiciones.exists[ unaPrecondicion | unaPrecondicion.esInadecuadaPara(unaReceta)] )
		
		}
}