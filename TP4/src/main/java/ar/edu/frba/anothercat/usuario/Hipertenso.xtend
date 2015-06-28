package ar.edu.frba.anothercat.usuario

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.frba.anothercat.receta.Receta

@Accessors
class Hipertenso implements CondicionPreexistente {

	override cumpleValidacion(Usuario unUsuario) {
		return (unUsuario.getPreferencias.size >= 1 )
	}

	override subsanasteCondicionesPreEx(Usuario usuario) {
		return (usuario.rutinaE.equals(tipoRutina.INTENSIVO) )

	}
	
	override esInadecuadaPara(Receta unaReceta) {

		return (unaReceta.tenesSal() || 
			unaReceta.tenesCaldo()) 

	}
	
	override decimeQueCondicionTenes()
	{
		precondicionTipo.hipertenso
	}
}