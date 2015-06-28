package ar.edu.frba.anothercat.filtrosDeUsuario

import java.util.List
import java.util.ArrayList
import ar.edu.frba.anothercat.usuario.Usuario
import ar.edu.frba.anothercat.receta.Receta

class FiltroDisgusto implements FiltroReceta{
	override filtramePor (List<Receta> Recetas, Usuario unUsuario){
		var List<Receta> Rece = new ArrayList<Receta>
		Rece = (Recetas.filter[ unaReceta | unaReceta.getIngredientes.forall(unIngrediente | 
		unUsuario.getDisgustos.exists[unDisgusto | unDisgusto != unIngrediente]) ]).toList()
		return Rece
	}
	
		override boolean filtramePorMisFiltros (Receta unaReceta, Usuario unUsuario){
	 	
	 	return ( unaReceta.getIngredientes.exists(unIngrediente |unUsuario.getDisgustos.exists[unDisgusto | unDisgusto == unIngrediente]) )
			}
			
	
}