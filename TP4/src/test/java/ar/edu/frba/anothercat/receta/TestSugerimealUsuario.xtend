package ar.edu.frba.anothercat.receta

import org.junit.Before
import org.junit.Test
import org.junit.Assert
import java.util.Date
import ar.edu.frba.anothercat.usuario.Usuario
import ar.edu.frba.anothercat.usuario.Diabetico
import ar.edu.frba.anothercat.usuario.Hipertenso
import ar.edu.frba.anothercat.usuario.Grupo
import ar.edu.frba.anothercat.usuario.tipoRutina
import ar.edu.frba.anothercat.beforeReceta.BeforeReceta

class TestSugerimealUsuario {
	
	Usuario JoseCampanela
	
	Repositorio_Receta Utilisima
	
	Diabetico diabetico
	Hipertenso hipertenso
	
	Grupo ConcinerosArgentinos
	BeforeReceta todasMisRecetasdeTest
	
	@Before
	def void init(){
		todasMisRecetasdeTest = new BeforeReceta
	 	diabetico = new Diabetico 
	
	 	hipertenso = new Hipertenso 
			
		ConcinerosArgentinos = new Grupo =>[
			setNombre("PinPals")
		]
		
		 JoseCampanela = new Usuario => [
	    	setNombre("Juan")
	    	fechaDeNacimiento = new Date(01-01-1987)
			peso=50
			altura=1.71
			sexo = "m"
			agregarPrefer(todasMisRecetasdeTest.getCarne)
			agregarPrefer(todasMisRecetasdeTest.getLechon)
			rutinaE = tipoRutina.PREINTENSIVO
		] 
		Utilisima  = new Repositorio_Receta
		
		
	}
	
	@Test
	def void sugerimeUsuarioconDisgustos(){
		
		JoseCampanela.agregarDisgusto(todasMisRecetasdeTest.getPolenta)
		
		Assert.assertFalse(todasMisRecetasdeTest.getCarneConPolenta.sugerimeAlUsuario(JoseCampanela))
		
	}
	
		@Test
	def void sugerimeUsuarioCondicPreex(){
		
		JoseCampanela.agregarCondicion(diabetico)
		Assert.assertFalse(todasMisRecetasdeTest.getCarneConPolenta.sugerimeAlUsuario(JoseCampanela))
		
	}
	
			@Test
	def void sugerimeUsuarioOk(){
		
		
		Assert.assertTrue(todasMisRecetasdeTest.getCarneConPolenta.sugerimeAlUsuario(JoseCampanela))
		
	}
	
	@Test
	def void sugerimeUserContodo(){
		todasMisRecetasdeTest.getCarneConPolenta.agregarCondimento(todasMisRecetasdeTest.getSal)
		JoseCampanela.agregarCondicion(diabetico)
		JoseCampanela.agregarCondicion(hipertenso)
		JoseCampanela.agregarDisgusto(todasMisRecetasdeTest.getPolenta)
		JoseCampanela.agregarDisgusto(todasMisRecetasdeTest.getLechon)
		Assert.assertFalse(todasMisRecetasdeTest.getCarneConPolenta.sugerimeAlUsuario(JoseCampanela))
		
	}
	
	
	
}