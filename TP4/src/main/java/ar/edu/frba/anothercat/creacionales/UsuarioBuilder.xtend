package ar.edu.frba.anothercat.creacionales

import org.uqbar.commons.model.CollectionBasedHome
import java.util.Set
import java.util.HashSet
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.utils.ApplicationContext
import java.util.Date
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.receta.Ingrediente
import ar.edu.frba.anothercat.filtrosDeUsuario.FiltroDisgusto
import ar.edu.frba.anothercat.filtrosDeUsuario.FiltroReceta
import ar.edu.frba.anothercat.filtrosDeUsuario.ProcesamientoPosterior
import ar.edu.frba.anothercat.filtrosDeUsuario.Pares
import ar.edu.frba.anothercat.receta.Condimento
import ar.edu.frba.anothercat.receta.estadoReceta
import ar.edu.frba.anothercat.excepciones.NoCumpleRequisitosException
import java.util.ArrayList
import ar.edu.frba.anothercat.usuario.Usuario
import ar.edu.frba.anothercat.usuario.RepoUsuarios
import ar.edu.frba.anothercat.usuario.Diabetico
import ar.edu.frba.anothercat.usuario.Vegano
import ar.edu.frba.anothercat.usuario.Celiaco
import ar.edu.frba.anothercat.usuario.Hipertenso
import ar.edu.frba.anothercat.usuario.tipoRutina
import ar.edu.frba.anothercat.usuario.Grupo

class UsuarioBuilder {
	Usuario  UnUsuario
	
	new() {		
		UnUsuario = new Usuario 
	}
	
	def hacerUsuarioDiabetico(){
		UnUsuario.agregarCondicion(new Diabetico)
	    this
	}
	
	def hacerUsuarioVegano(){
		UnUsuario.agregarCondicion(new Vegano)
	    this
	}
	
	def hacerUsuarioCeliaco(){
		UnUsuario.agregarCondicion(new Celiaco)
	    this
	}
	
	def hacerUsuarioHipertenso(){
		UnUsuario.agregarCondicion(new Hipertenso)
	    this
	}
	
	
	def setearleUnPerfil(String nombre, Date FNacim, String sexo, double altura, int peso,tipoRutina rutina){
		UnUsuario.setNombre(nombre)
		UnUsuario.setFechaDeNacimiento(FNacim)
		UnUsuario.setSexo(sexo)
		UnUsuario.setAltura(altura)
		UnUsuario.setPeso(peso)
		UnUsuario.setRutinaE(rutina)
	    this
	}
	
	def agregarUnaPreferencia(Ingrediente unIngre){
		UnUsuario.agregarPrefer(unIngre)
	    this
	}
	
	def agregarUnDisgusto(Ingrediente unDisgusto){
		UnUsuario.agregarDisgusto(unDisgusto)
	    this
	}
	
	
	def agregarUnaReceta(Receta unaReceta) {
		UnUsuario.agregarReceta(unaReceta)
		this
	}
	
	def agregarUnGrupo(Grupo unGrupo) {
		UnUsuario.solicitarAgregarmeAlGrupo(unGrupo)
		this
	}

	
	def agregarUnaFavorita(Receta unaReceta) {	
		UnUsuario.agregarRecetaFavorita(unaReceta)
	this
	}	
	
	
	def unNuevoUsuarioStandard(String nombre, String sexo, Date fNacimiento){
	    UnUsuario => [ 
	    	setNombre(nombre)
	    	setSexo(sexo)
	    	setFechaDeNacimiento(fNacimiento)
	    	peso = 80
	    	altura = 1.7
			agregarPrefer(new Ingrediente)
			agregarDisgusto(new Ingrediente)
			agregarReceta(new Receta => [
		     nombrePlato = "plato de receta"
		     sumarCalorias(100)
		     estado = estadoReceta.Privada
		     agregarIngrediente(new Ingrediente)
		     agregarCondimento(new Condimento)])
		     agregarRecetaFavorita(new Receta => [
		     nombrePlato = "plato de receta"
		     sumarCalorias(100)
		     estado = estadoReceta.Privada
		     agregarIngrediente(new Ingrediente)
		     agregarCondimento(new Condimento)])
			rutinaE = tipoRutina.INTENSIVO	    	
	    ]
	    this
	}
	
	def build() {
		UnUsuario
	}
}