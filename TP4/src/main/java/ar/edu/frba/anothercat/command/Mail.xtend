package ar.edu.frba.anothercat.command

import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.receta.Repositorio_Receta
import ar.edu.frba.anothercat.usuario.Usuario
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.HashSet

@Accessors
class Mail {
	String to
	Usuario from
	String mensaje
	
	
	
}