package ar.edu.frba.anothercat.command

import ar.edu.frba.anothercat.usuario.Usuario
import ar.edu.frba.anothercat.receta.Repositorio_Receta
import ar.edu.frba.anothercat.receta.Receta

class EmailCommand extends ConsultaCommandRunner {
	
	String to
	StubServidorMails servidorMails = new StubServidorMails
	
	new (Usuario usuario, Repositorio_Receta repo, Iterable<Receta> recetas){
		
	}
	
	override ejecutar() {
		servidorMails.armarEmail(usuario)
	}
	
}