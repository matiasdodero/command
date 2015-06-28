package ar.edu.frba.anothercat.filtrosDeUsuario

import java.util.List
import java.util.ArrayList
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.Usuario

class FiltroBurgues implements FiltroReceta{
	
	override filtramePor (List<Receta> unasRecetas, Usuario unUsuario){
		var List<Receta> Rece = new ArrayList<Receta>
		Rece = unasRecetas.filter[ unaReceta | unaReceta.getIngredientes.forall(unIngrediente | unIngrediente.decimeSiSosCaro() == false )].toList()
		return Rece
	}
	
	override boolean filtramePorMisFiltros(Receta unaReceta, Usuario unUsuario){
	 	return ( (unaReceta.getIngredientes.exists(unIngrediente | unIngrediente.decimeSiSosCaro()) ))
	 	
	 	}
	
}