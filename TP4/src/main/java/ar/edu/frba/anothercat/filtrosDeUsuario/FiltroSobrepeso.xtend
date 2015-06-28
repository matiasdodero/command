package ar.edu.frba.anothercat.filtrosDeUsuario

import java.util.List
import java.util.ArrayList
import ar.edu.frba.anothercat.usuario.Usuario
import ar.edu.frba.anothercat.receta.Receta

class FiltroSobrepeso implements FiltroReceta{
	

		override filtramePor (List<Receta> recetas, Usuario unUsuario){
		var List<Receta> recetaFiltrada = new ArrayList<Receta>
		recetaFiltrada = (recetas.filter[  unaReceta | ( unaReceta.getTotalCalorias < 500 && unUsuario.calcularImc() < 25)  ]).toList()	
		return recetaFiltrada
	}
	
	
	override boolean filtramePorMisFiltros (Receta unaReceta, Usuario unUsuario){
		
		return (unaReceta.getTotalCalorias > 500 && unUsuario.calcularImc() > 25)
		
	 	
	}
	
}