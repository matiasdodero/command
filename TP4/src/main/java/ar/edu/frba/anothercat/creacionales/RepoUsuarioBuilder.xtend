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

class RepoUsuarioBuilder {
	RepoUsuarios unRepoUsuario
	
	new() {		
		unRepoUsuario = new RepoUsuarios 
	}
	
	def  unNuevoUsuarioDiabeticoStandard(String nombre, String sexo, Date fNacimiento){
	    var Usuario miUsu
	    miUsu = new Usuario => [ 
	    	setNombre(nombre)
	    	setSexo(sexo)
	    	setFechaDeNacimiento(fNacimiento)
	    	peso = 80
	    	altura = 1.7
			agregarCondicion(new Diabetico)
			agregarPrefer(new Ingrediente)
			agregarDisgusto(new Ingrediente)
			agregarReceta(new Receta => [
		     nombrePlato = "plato de receta"
		     sumarCalorias(100)
		     estado = estadoReceta.Privada
		     agregarIngrediente(new Ingrediente)
		     agregarCondimento(new Condimento)])
			rutinaE = tipoRutina.INTENSIVO	    	
	    ]
	    unRepoUsuario.add(miUsu)
	    this
	}
	
	def unNuevoUsuarioStandard(String nombre, String sexo, Date fNacimiento){
	    var Usuario miUsu
	    miUsu = new Usuario => [ 
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
			rutinaE = tipoRutina.INTENSIVO	    	
	    ]
	    unRepoUsuario.add(miUsu)
	    this
	}
	
	def unNuevoUsuarioVeganoStandard(String nombre, String sexo, Date fNacimiento){
	    var Usuario miUsu
	
	    miUsu = new Usuario => [ 
	    	setNombre(nombre)
	    	setSexo(sexo)
	    	setFechaDeNacimiento(fNacimiento)
	    	peso = 80
	    	altura = 1.7
			agregarCondicion(new Vegano)
			agregarPrefer(new Ingrediente)
			agregarDisgusto(new Ingrediente)
			agregarReceta(new Receta => [
		     nombrePlato = "plato de receta"
		     sumarCalorias(100)
		     estado = estadoReceta.Privada
		     agregarIngrediente(new Ingrediente)
		     agregarCondimento(new Condimento)])
			rutinaE = tipoRutina.INTENSIVO	    	
	    ]
	    unRepoUsuario.add(miUsu)
	    this
	}
	
	def unNuevoUsuarioHipertensoStandard(String nombre, String sexo, Date fNacimiento){
	    var Usuario miUsu
	    miUsu = new Usuario => [ 
	    	setNombre(nombre)
	    	setSexo(sexo)
	    	setFechaDeNacimiento(fNacimiento)
	    	peso = 80
	    	altura = 1.7
			agregarCondicion(new Hipertenso)
			agregarPrefer(new Ingrediente)
			agregarDisgusto(new Ingrediente)
			agregarReceta(new Receta => [
		     nombrePlato = "plato de receta"
		     sumarCalorias(100)
		     estado = estadoReceta.Privada
		     agregarIngrediente(new Ingrediente)
		     agregarCondimento(new Condimento)])
			rutinaE = tipoRutina.INTENSIVO	    	
	    ]
	    unRepoUsuario.add(miUsu)
	    this
	}
	
	def unNuevoUsuarioCeliacoStandard(String nombre, String sexo, Date fNacimiento){
	    var Usuario miUsu
	    miUsu =  new Usuario => [ 
	    	setNombre(nombre)
	    	setSexo(sexo)
	    	setFechaDeNacimiento(fNacimiento)
	    	peso = 80
	    	altura = 1.7
			agregarCondicion(new Celiaco)
			agregarPrefer(new Ingrediente)
			agregarDisgusto(new Ingrediente)
			agregarReceta(new Receta => [
		     nombrePlato = "plato de receta"
		     sumarCalorias(100)
		     estado = estadoReceta.Privada
		     agregarIngrediente(new Ingrediente)
		     agregarCondimento(new Condimento)])
			rutinaE = tipoRutina.INTENSIVO	    	
	    ]
	    unRepoUsuario.add(miUsu)
	    this
	}
	
	
	def aceptarATodos(){
	    var List<Usuario> unSetDeusuarios = new ArrayList<Usuario>
	    var List<Usuario> SetAuxiliar  = new ArrayList<Usuario>
	    
		unSetDeusuarios = unRepoUsuario.getUsuarios
		for (item:unRepoUsuario.getUsuarios)
		  {
		  	SetAuxiliar.add(item)
		  }
		for (item:SetAuxiliar)
		  {
		  	unRepoUsuario.aceptarUsuario(item)
		  }

		this
	}
	
	def rechazarATodos(){
	    var List<Usuario> unSetDeusuarios = new ArrayList<Usuario>
	    var List<Usuario> SetAuxiliar  = new ArrayList<Usuario>
	    
		unSetDeusuarios = unRepoUsuario.getUsuarios
		for (item:unRepoUsuario.getUsuarios)
		  {
		  	SetAuxiliar.add(item)
		  }
		for (item:SetAuxiliar)
		  {
		  	unRepoUsuario.rechazarUsuario(item,"mi Motivo")
		  }
		this
	}
	
	def build() {
		unRepoUsuario
	}

}