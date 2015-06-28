package ar.edu.frba.anothercat.command

import org.apache.log4j.Logger
import org.apache.log4j.spi.LoggingEvent
import org.junit.After
import org.junit.Before
import org.junit.Test
import org.mockito.Mock
import org.mockito.Captor
import org.mockito.ArgumentCaptor
import org.apache.log4j.AppenderSkeleton
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.apache.log4j.spi.LoggingEvent
import org.junit.Test
import static org.mockito.Matchers.any
import static org.mockito.Matchers.eq
import static org.mockito.Mockito.mock
import static org.mockito.Mockito.times
import static org.mockito.Mockito.verify
import static org.mockito.Mockito.when


class LoguearConsultaTest {

	//Logger logger = Logger.getLogger(TestCommandP4)
	//int value = 1

	//@Test
	//def void test() {
	//BasicConfigurator.configure()
	//logger.debug("Hello World!")
	//assertEquals(value, 1)
	//}
	
	LoguearConsultaCommand mockLoguearConsulta
	//Logger logger = Logger.getLogger(this.getClass())
	//var mockLoguearConsulta = mock (typeof (LoguearConsultaCommand))
		
	@Captor
	ArgumentCaptor<LoggingEvent> captorLoggingEvent

				
	@Before
	
	def void setupLoguearConsultaCommand(){
	var Logger logger
	var mockLoguearConsulta = mock (typeof (LoguearConsultaCommand))
	logger.addAppender(mockLoguearConsulta)
	}

	@After
	def void removeAppender(){
	logger.removeAppender(mockLoguearConsulta)
	}

	@Test
	def void LoguearConsultaTest() {
	logger.debug("Test Loguear Consulta")
	verify (mockLoguearConsulta).doAppend(captorLoggingEvent.capture())
	}
}