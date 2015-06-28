package ar.edu.frba.anothercat.observers

import ar.edu.frba.anothercat.command.ConsultaCommand
import ar.edu.frba.anothercat.receta.Receta
import ar.edu.frba.anothercat.usuario.Usuario
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class EmailObserver implements ConsultaObserver {
	
	List<Usuario> usuariosInteresados = new ArrayList <Usuario>
	ConsultaCommand consulta = new ConsultaCommand
	
	override seRealizoConsulta(Iterable<Receta> recetas, Usuario usuario) {
		usuariosInteresados.add(usuario)
	}
	
	
	
}