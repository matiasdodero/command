package ar.edu.frba.anothercat.command

import java.util.logging.Logger
import org.apache.log4j.Level
import org.apache.log4j.PatternLayout

class Log4JReceptor {
	
		
		this.loguearConsulta 
		//This is the root logger provided by log4j		
		Logger log4JReceptor = Logger.getRootLogger()
		log4JReceptor.setLevel(Level.DEBUG)
		
		//Define log pattern layout
		PatternLayout layout = new PatternLayout("%d{ISO8601} [%t] %-5p %c %x - %m%n")
		
		//Add console appender to root logger
		log4JReceptor.addAppender(new ConsoleAppender(layout))
		
		if ((unaConsulta.consultarRecetas).size() > 100  ) {
			
		log4JReceptor.info("Consulta Con Mas De 100")
		}