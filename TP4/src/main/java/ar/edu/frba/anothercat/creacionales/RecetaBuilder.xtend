package ar.edu.frba.anothercat.creacionales

import ar.edu.frba.anothercat.receta.Receta
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.frba.anothercat.receta.Ingrediente
import ar.edu.frba.anothercat.receta.Condimento
import ar.edu.frba.anothercat.receta.estadoReceta
import ar.edu.frba.anothercat.receta.Paso
import ar.edu.frba.anothercat.excepciones.NoCumpleRequisitosException
import ar.edu.frba.anothercat.receta.Temporada

@Accessors
class RecetaBuilder {
	
	private Receta unaReceta
	
	new() {
		unaReceta = new Receta
	}
	
	def agregarNombre(String nombrePlato){
		
		unaReceta.setNombrePlato(nombrePlato)
		this
		
	}
	
	def agregarDifcultad(String dificultad){
		unaReceta.setDificultad(dificultad)
		this
	}
	
	def agregarEstado(estadoReceta estado){
		
		unaReceta.setEstado(estado)
		this
	}
	
	def agregarCalorias (int calorias){
		
		unaReceta.sumarCalorias(calorias)
		this
	}
	def agregarPasos(){
		unaReceta.agregarPaso(new Paso)
		this
	}
	def agregarTemporadas(){
		unaReceta.agregarTemporadas(new Temporada)
	}
	def agregarIngrediente(Ingrediente ingrediente){
		unaReceta.agregarIngrediente(ingrediente)
		this
	}
	
	def agregarIngredienteNuevo(String nombre,String tipo, int calorias,boolean valor ){
		unaReceta.agregarIngrediente(new Ingrediente =>[setNombreIngrediente(nombre)
														setTipoIngrediente(tipo)
														setCalorias(calorias)
														setSosCaro(valor)])
		this
	}
	
	def agregarCondimento(Condimento unCondimento){
		unaReceta.agregarCondimento(unCondimento)
		this
	}
	def agregarCondimentoNuevo(String nombre, int cantidad){
		unaReceta.agregarCondimento(new Condimento=>[setNombreCondimento(nombre)
													 setCantidad(cantidad)])
		this
	}
	
	def agregarpaso(Paso unPaso){
		unaReceta.pasos.add(unPaso)
		this
	}
	
	def agregarTemporada(Temporada unaTemp){
		unaReceta.temporadas.add(unaTemp)
		this
	}
	
	
	def build() {
		if (!unaReceta.validar()) {
			throw new NoCumpleRequisitosException("La Receta no cumple con los requisitos minimos para que sea valida")
		}
		return unaReceta
	}
		
}