package ar.edu.frba.anothercat.usuario

import ar.edu.frba.anothercat.receta.Receta

class Celiaco implements CondicionPreexistente {
	override cumpleValidacion(Usuario unUsuario){
		return true
	}

	override subsanasteCondicionesPreEx(Usuario unUsuario){
		return true
	}

	override esInadecuadaPara(Receta unaReceta){
		return false
	}
	
	override decimeQueCondicionTenes()
	{
		precondicionTipo.celiaco
	}
}