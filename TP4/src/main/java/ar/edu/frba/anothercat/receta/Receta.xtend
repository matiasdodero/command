package ar.edu.frba.anothercat.receta

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.frba.anothercat.excepciones.NoCumpleRequisitosException
import ar.edu.frba.anothercat.usuario.CondicionPreexistente
import ar.edu.frba.anothercat.usuario.Usuario
import ar.edu.frba.anothercat.usuario.Grupo

@Accessors
class Receta {

	String nombrePlato
	List<Ingrediente> ingredientes = new ArrayList<Ingrediente>
	List<Condimento> condimentos = new ArrayList<Condimento>
	List<Paso> pasos = new ArrayList<Paso>
	var List<String> condiciones
	int totalCalorias = 0
	String dificultad
	List<Temporada> temporadas = new ArrayList<Temporada>
	estadoReceta estado
	List<Receta> compuestaDe = new ArrayList<Receta>
	
	
	
	def String dificultadReceta(){
		dificultad
	}

	def void agregarIngrediente(Ingrediente unIngrediente) {

		ingredientes.add(unIngrediente)

	}
	
	def void agregarTemporadas(Temporada unaTemporada){
		temporadas.add(unaTemporada)	
	}
	
	def void agregarPaso(Paso unPaso) {

		pasos.add(unPaso)

	}

	def void agregarCondimento(Condimento unCondimento) {
		condimentos.add(unCondimento)
	}

	def void sumarCalorias(int cal) {
		totalCalorias += cal
	}

	def boolean validar() {
		if (ingredientes.size >= 1 && (totalCalorias >= 10 && totalCalorias <= 5000)) {
			return true
		} else {
			throw new NoCumpleRequisitosException("La Receta no cumple con los requisitos minimos para que sea valida")
		}
	}

	def List<CondicionPreexistente> recetaInadecuadaPara(List<CondicionPreexistente> condiciones) {
		condiciones.filter[condicion|condicion.esInadecuadaPara(this)].toList()
	}
	
	def agregarmeReceta(Receta unaReceta) {
		if (unaReceta != this && NoloopDeRecetas(this,unaReceta)) 
		{compuestaDe.add(unaReceta)}
		else {
			throw new NoCumpleRequisitosException("Receta agregandose a ella misma")
		}
		
	}
	
	private def boolean NoloopDeRecetas(Receta unaReceta, Receta otraReceta) {
		if (otraReceta.compuestaDe.empty) 
		{return true}
		else {
			for(item: otraReceta.compuestaDe) {
		    	if (item == unaReceta) {throw new NoCumpleRequisitosException("Receta en loop agregandose")}
		    	else
		    	{NoloopDeRecetas(unaReceta,item) }
		    }
		    return true
		}
		
	}
	
	def sosSimple() {
		return (compuestaDe.empty)
	}
	
	def List<Ingrediente> decimeTusIngredientesTotales()
	{
		var List<Ingrediente> ingreAux = new ArrayList<Ingrediente>
		ingreAux = ingredientes
		
		if (compuestaDe.empty) {
			return ingreAux
		}
		else
		{
		    for(item: compuestaDe.map[unaReceta | unaReceta.decimeTusIngredientesTotales()]) {
		    	ingreAux.addAll(item)
		    }
		    return ingreAux	
		    
		}
			
	}
	
	def List<Condimento> decimeTusCondimentosTotales()
	{
		var List<Condimento> condAux = new ArrayList<Condimento>
		condAux = condimentos
		
		if (compuestaDe.empty) {
			return condAux
		}
		else
		{
		    for(item: compuestaDe.map[unaReceta | unaReceta.decimeTusCondimentosTotales()]) {
		    	condAux.addAll(item)
		    }
		    return condAux	
		    
		}
			
	}
	
	def int caloriasFinales(){
		var int ingreAux = 0
		ingreAux = (ingredientes.fold(0, [acum, unIngrediente |acum + unIngrediente.getCalorias]))
		
		if (compuestaDe.empty) {
			return ingreAux
		}
		else
		{
		    for(item: compuestaDe.map[unaReceta | unaReceta.caloriasFinales()]) {
		    	ingreAux += item
		    }
		    return ingreAux	
		    
		}
	}
	
	def int azucarTotal(){
		var int ingreAux = 0
		//var	Iterable<Condimento> condimentosAux = new ArrayList<Condimento>
		//condimentosAux = condimentos.filter[unCondimento | unCondimento.getNombreCondimento == "azucar"]
		for(item: condimentos) {
			if (item.getNombreCondimento == "azucar") {
				ingreAux += item.getCantidad
			}
		}
			
		if (compuestaDe.empty) {
			return ingreAux
		}
		else
		{
		    for(item: compuestaDe.map[unaReceta | unaReceta.azucarTotal()]) {
		    	ingreAux += item
		    }
		    return ingreAux	
		    
		}
	}
	
	def boolean tenesAzucar() {
		return (this.decimeTusCondimentosTotales.exists[unCondimento | unCondimento.getNombreCondimento == "azucar"] )
	}
	
	def boolean tenesSal() {
		return (this.decimeTusCondimentosTotales.exists[unCondimento | unCondimento.getNombreCondimento == "sal"] )	
	}
	
	def boolean tenesCaldo() {
		return (this.decimeTusCondimentosTotales.exists[unCondimento | unCondimento.getNombreCondimento == "caldo"] )	
	}
	
	def boolean tenesPolloCarneChivitoChori() {
		return (this.decimeTusIngredientesTotales.exists[unIngrediente | unIngrediente.getNombreIngrediente == "pollo"
																	   || unIngrediente.getNombreIngrediente == "carne"
															           || unIngrediente.getNombreIngrediente == "chivito"
															           || unIngrediente.getNombreIngrediente == "chori"
		] )
		
	}
	
	def boolean sugerimeAlUsuario(Usuario unUsuario){
		
		var List<Ingrediente> auxIng = new ArrayList<Ingrediente>
		auxIng = this.decimeTusIngredientesTotales()
		
		if (unUsuario.precondiciones.exists[unaPrecondicion | unaPrecondicion.esInadecuadaPara(this)])
		 {return false}
		for (item: auxIng){
			//System.out.println(item.getNombreIngrediente)
			if (unUsuario.disgustos.exists[unD | unD == item])
			{  
				return false
			}
		}
		return true
		
 
	}
	
	def boolean sugerimeAlGrupo(Grupo unGrupo){
		
		var boolean encontro = false
		var List<Ingrediente> auxIng = new ArrayList<Ingrediente>
		auxIng = this.decimeTusIngredientesTotales()
		
		if (!(unGrupo.getPreferencias.empty))
		{
		for (item: auxIng){
			if (unGrupo.preferencias.exists[unaPreferencia | unaPreferencia == item])
			{encontro = true}
		}
		if (encontro == false){
			//System.out.println("no encontro nada 1")
			return false
		}}
		
		for (item: unGrupo.misUsuarios){
			if (item.precondiciones.exists[unaPrecondicion | unaPrecondicion.esInadecuadaPara(this)])
			{
				//System.out.println("no encontro nada 2 pero en el branch strategy")
				// comentario SOLO VISTO EN STRATEGY
				
				//comentario solo MASTER
				return false
			}
		}
		return true
 
	}
		
}

public enum estadoReceta {
   	Publica,
   	Privada,
   	Compartida;   	
   }