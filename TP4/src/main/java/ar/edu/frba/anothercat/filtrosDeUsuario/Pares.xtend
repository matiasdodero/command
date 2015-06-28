package ar.edu.frba.anothercat.filtrosDeUsuario

import java.util.List
import java.util.HashSet
import java.util.ArrayList
import ar.edu.frba.anothercat.receta.Receta

class Pares implements ProcesamientoPosterior {
	
		override procesamePor (Iterable<Receta> recetas){
			
			
        var Iterable<Receta> Rece = new HashSet<Receta>
        var HashSet<Receta> ReceSet = new HashSet<Receta>
        var List<Receta> Rece2Set = new ArrayList<Receta>
        
		for(var int i = 0; i < recetas.size ; i++)
		{
			if (i % 2 == 0) {
				Rece2Set.add(recetas.get(i))
			}
		}
		
        for (item: Rece2Set) {
			ReceSet.add(item)
		  }
		

		Rece = Rece2Set

    	return Rece
		
		
	}
	
}