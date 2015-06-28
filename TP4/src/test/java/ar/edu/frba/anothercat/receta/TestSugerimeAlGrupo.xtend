package ar.edu.frba.anothercat.receta

import org.junit.Before
import org.junit.Test
import org.junit.Assert
import java.util.Date
import ar.edu.frba.anothercat.usuario.Usuario
import ar.edu.frba.anothercat.usuario.Diabetico
import ar.edu.frba.anothercat.usuario.Grupo
import ar.edu.frba.anothercat.usuario.tipoRutina
import ar.edu.frba.anothercat.beforeReceta.BeforeReceta
import ar.edu.frba.anothercat.creacionales.RecetaBuilder

class TestSugerimeAlGrupo {
		
	Usuario JoseCampanela
	Usuario  Mbaracus
	
	Diabetico diabetico
	
	Grupo CocinerosArgentinos
	
	BeforeReceta todasMisRecetasdeTest
	
	
	@Before
	def void init(){
		todasMisRecetasdeTest = new BeforeReceta
	 	diabetico = new Diabetico 
	
		CocinerosArgentinos = new Grupo =>[
			setNombre("ConcinerosArgentinos")
		]
		
		 JoseCampanela = new Usuario => [
	    	setNombre("Juan")
	    	fechaDeNacimiento = new Date(01-01-1987)
			peso=50
			altura=1.71
			sexo = "m"
			agregarPrefer(todasMisRecetasdeTest.getCarne())
			agregarPrefer(todasMisRecetasdeTest.getLechon)
			rutinaE = tipoRutina.PREINTENSIVO
		] 
			 Mbaracus = new Usuario => [
	    	setNombre("Marito")
	    	fechaDeNacimiento = new Date(01-01-1987)
			peso=100
			altura=1.80
			sexo = "m"
			agregarPrefer(todasMisRecetasdeTest.getAgua)
			agregarPrefer(todasMisRecetasdeTest.getPolenta)
			rutinaE = tipoRutina.NADA
		] 
		
		
	}
	
	@Test
	def void sugerimeGruposSinPrefer(){
		CocinerosArgentinos.agregarPreferencias(todasMisRecetasdeTest.getAgua)
		CocinerosArgentinos.agregarPreferencias(todasMisRecetasdeTest.getLechon)
		Assert.assertFalse( todasMisRecetasdeTest.getCarneConPolenta.sugerimeAlGrupo( CocinerosArgentinos ) )
	}
	@Test
		def void sugerimeGruposConPrefer(){
		CocinerosArgentinos.agregarPreferencias(todasMisRecetasdeTest.getCarne)
		CocinerosArgentinos.agregarPreferencias(todasMisRecetasdeTest.getAgua)
		CocinerosArgentinos.agregarPreferencias(todasMisRecetasdeTest.getLechon)
		Assert.assertTrue( todasMisRecetasdeTest.getCarneConPolenta.sugerimeAlGrupo( CocinerosArgentinos ) )
	}
	
	@Test
	def void sugerimeGruposConUserInadecuados(){
		JoseCampanela.agregarCondicion(diabetico)
		CocinerosArgentinos.agregarUsuario(JoseCampanela)
		CocinerosArgentinos.agregarUsuario(Mbaracus)
		Assert.assertFalse( todasMisRecetasdeTest.getCarneConPolenta.sugerimeAlGrupo( CocinerosArgentinos ) )
	}
	
		@Test
	def void sugerimeGruposConUserAdecuados(){
		CocinerosArgentinos.agregarUsuario(JoseCampanela)
		CocinerosArgentinos.agregarUsuario(Mbaracus)
		Assert.assertTrue( todasMisRecetasdeTest.getLechonsal.sugerimeAlGrupo( CocinerosArgentinos ) )
	}
			@Test
	def void sugerimeGruposConUserYPreferencias(){
		CocinerosArgentinos.agregarPreferencias(todasMisRecetasdeTest.getAgua)
		CocinerosArgentinos.agregarPreferencias(todasMisRecetasdeTest.getLechon)
		CocinerosArgentinos.agregarUsuario(JoseCampanela)
		CocinerosArgentinos.agregarUsuario(Mbaracus)
		Assert.assertTrue( todasMisRecetasdeTest.getLechonsal.sugerimeAlGrupo( CocinerosArgentinos ) )
	}
	
			@Test
	def void sugerimeGruposSinPreferenciasNiInadecuados(){
		CocinerosArgentinos.agregarUsuario(JoseCampanela)
		CocinerosArgentinos.agregarUsuario(Mbaracus)
		Assert.assertTrue( todasMisRecetasdeTest.getLechonsal.sugerimeAlGrupo( CocinerosArgentinos ) )
		
		
		
	}
}