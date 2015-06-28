package ar.edu.frba.anothercat.filtrosDeUsuario

import ar.edu.frba.anothercat.receta.Receta

public interface  ProcesamientoPosterior {
	
		def Iterable<Receta> procesamePor (Iterable<Receta> Recetas)
	
}