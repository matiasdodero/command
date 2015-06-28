package ar.edu.frba.anothercat.filtrosDeUsuario

import java.util.HashSet
import ar.edu.frba.anothercat.receta.Receta

class OrdenarAlfabeticamente implements ProcesamientoPosterior {
	
		override procesamePor (Iterable<Receta> recetas){
		
		//var Iterable<Receta> receta = new HashSet<Receta>
        //var HashSet<Receta> recetaSet = new HashSet<Receta>
        
        /*for (item: recetas) {
			recetaSet.add(item)
		  }*/
			
		//receta = recetas

    	return recetas.sortBy[ nombrePlato]
		
	}
	
}