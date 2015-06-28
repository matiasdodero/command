package ar.edu.frba.anothercat.filtrosDeUsuario

import java.util.HashSet
import ar.edu.frba.anothercat.receta.Receta

class PrimerosN implements ProcesamientoPosterior{
	
	override procesamePor (Iterable<Receta> recetas){
		
		var Iterable<Receta> Rece = new HashSet<Receta>
        /*var HashSet<Receta> ReceSet = new HashSet<Receta>
        
        for (item: recetas) {
			ReceSet.add(item)
		  }
		
		Rece = ReceSet*/
		
		Rece = recetas
		

    	return Rece.take(10)
    	
	}
	
}