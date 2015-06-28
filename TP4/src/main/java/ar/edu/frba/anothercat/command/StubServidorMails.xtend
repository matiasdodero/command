package ar.edu.frba.anothercat.command


import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.frba.anothercat.usuario.Usuario
import ar.edu.frba.anothercat.receta.Repositorio_Receta
import ar.edu.frba.anothercat.receta.Receta

@Accessors
class StubServidorMails {
	List<Mail> mails = new ArrayList<Mail>	
	
	def void armarEmail(Usuario to, Repositorio_Receta unRepo, Iterable<Receta> recetas){
		mail.from = to
		
	}
	
	def void enviarMail(Usuario to, Mail mail){
		mails.add(mail)
	}
	
	
	
	
}