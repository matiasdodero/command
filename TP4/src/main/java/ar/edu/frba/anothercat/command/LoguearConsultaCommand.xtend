package ar.edu.frba.anothercat.command

import org.eclipse.xtend.lib.annotations.Accessors
import org.apache.log4j.Logger
import org.apache.log4j.ConsoleAppender
import org.apache.log4j.Level
import org.apache.log4j.PatternLayout
import org.apache.log4j.RollingFileAppender
import ar.edu.frba.anothercat.receta.Receta
import java.util.ArrayList
import java.util.List
import ar.edu.frba.anothercat.usuario.Usuario

@Accessors
class LoguearConsultaCommand implements InterfazCommand {
	
	List<Receta> rece = new ArrayList<Receta>
	Log4JReceptor receptor = new Log4JReceptor
	
	override ejecutar ( ){
	receptor.loguearConsulta(Iterable<Receta> recetas , Usuario usuario)
	}
	//override ejecutar (List<Consulta> consultas){

	//Log4JReceptor framework = new Log4JReceptor
	
	//Log4JReceptor log4JReceptor
	//Logger logger = Logger.getLogger(LoguearConsultaCommand)

	//override ejecutar(rece){
	//BasicConfigurator.configure()
	//logger.debug("Hello World!")

	//}

	//override ejecutar() {
	
		//This is the root logger provided by log4j		
		//Logger log4JReceptor = Logger.getRootLogger()
		//log4JReceptor.setLevel(Level.DEBUG)
		
		//Define log pattern layout
		//PatternLayout layout = new PatternLayout("%d{ISO8601} [%t] %-5p %c %x - %m%n")
		
		//Add console appender to root logger
		//log4JReceptor.addAppender(new ConsoleAppender(layout))
		
		//if ((unaConsulta.consultarRecetas).size() > 100  ) {
			
		//log4JReceptor.info("Consulta Con Mas De 100")
		//}
	//}
//}
	
	//def loguearConsulta(Log4JReceptor receptor, List<Receta> recetas) {
		//throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}