package ar.edu.frba.anothercat.usuario

import ar.edu.frba.anothercat.receta.Receta

class Vegano implements CondicionPreexistente {

	override cumpleValidacion(Usuario unUsuario) {
		if (unUsuario.getPreferencias.exists[unaPre|
			unaPre.dameNombre() == "pollo" || unaPre.dameNombre() == "carne" ||
				unaPre.dameNombre() == "chivito" || unaPre.dameNombre() == "chori"]) {
			return false
		} else {
			return true
		}
	}

	override subsanasteCondicionesPreEx(Usuario usuario) {
		return (usuario.preferencias.exists[unaPre|unaPre.dameTipo() == "fruta"] )
	}

	/*override esInadecuadaPara(Receta unaReceta) {
		return (unaReceta.ingredientes.exists[unI | unI.dameNombre() == "carne"] || 
			unaReceta.ingredientes.exists[unI | unI.dameNombre() == "pollo"] ||
			unaReceta.ingredientes.exists[unI | unI.dameNombre() == "chori"]|| 
			unaReceta.ingredientes.exists[unI | unI.dameNombre() == "chivito"]) 
	}*/
	
	override esInadecuadaPara(Receta unaReceta) {
		return (unaReceta.tenesPolloCarneChivitoChori()) 
	}
	
	override decimeQueCondicionTenes()
	{
		precondicionTipo.vegano
	}

}