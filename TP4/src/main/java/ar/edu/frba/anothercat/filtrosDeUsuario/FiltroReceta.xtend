package ar.edu.frba.anothercat.filtrosDeUsuario

import java.util.List
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.Usuario

public interface FiltroReceta {
	
	def List<Receta> filtramePor (List<Receta> Recetas, Usuario unUsuario)
	def boolean filtramePorMisFiltros (Receta Recetas, Usuario unUsuario)
	
}