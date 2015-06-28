package ar.edu.frba.anothercat.command

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.frba.anothercat.observers.Consulta
import java.util.ArrayList
import java.util.List

@Accessors
class ConsultaCommand {
	

ConsultaCommandRunner unaConsultaCommand = new ConsultaCommandRunner
List<EmailCommand> mailsAEnviar = new ArrayList<EmailCommand>

def void instanciarMail(EmailCommand emailCommand){
	mailsAEnviar.add(emailCommand)
}
def void enviarMail(){
	
}



}
