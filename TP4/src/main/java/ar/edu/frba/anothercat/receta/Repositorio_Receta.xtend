package ar.edu.frba.anothercat.receta

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.HashSet
import ar.edu.frba.anothercat.usuario.Usuario
import ar.edu.frba.anothercat.usuario.Grupo

@Accessors
class Repositorio_Receta {
	HashSet<Receta> Recetas_Publicas = new HashSet<Receta>
	
	def List<Receta> sugerirRecetaA(Usuario unUsu){
		var List<Receta> Recetas_Pu = new ArrayList<Receta>
		for (item: Recetas_Publicas) {
			if (item.sugerimeAlUsuario(unUsu) == true) {Recetas_Pu.add(item)}
		}
		return Recetas_Pu
	}
	
	def List<Receta> sugerirRecetaGrupo(Grupo unGru){
		var List<Receta> Recetas_Pu = new ArrayList<Receta>
		for (item: Recetas_Publicas) {
			if (item.sugerimeAlGrupo(unGru) == true) {Recetas_Pu.add(item)}
		}
		return Recetas_Pu
	}
	
	def boolean sosValido(){
		true
	}
	
	def public void agregarRecetasPublicas(Receta unaR) {
		Recetas_Publicas.add(unaR)
	}
		
	
	}